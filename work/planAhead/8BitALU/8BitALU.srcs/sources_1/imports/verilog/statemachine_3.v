/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module statemachine_3 (
    input clk,
    input rst,
    output reg [7:0] a,
    output reg [7:0] b,
    output reg z,
    output reg v,
    output reg n,
    output reg [4:0] shiftb,
    input [7:0] boole,
    input [7:0] s,
    input [7:0] sum,
    input checker,
    output reg out,
    output reg [5:0] alufn,
    output reg [7:0] ans,
    input [4:0] io_button
  );
  
  
  
  reg [26:0] M_counter_d, M_counter_q = 1'h0;
  localparam IDLE_state = 5'd0;
  localparam ADD_state = 5'd1;
  localparam SUBTRACT_state = 5'd2;
  localparam MULTIPLIER_state = 5'd3;
  localparam OVERFLOW_state = 5'd4;
  localparam CMPEQ_state = 5'd5;
  localparam CMPEQF_state = 5'd6;
  localparam CMPLT_state = 5'd7;
  localparam CMPLTF_state = 5'd8;
  localparam CMPLE_state = 5'd9;
  localparam CMPLEF_state = 5'd10;
  localparam AND_state = 5'd11;
  localparam OR_state = 5'd12;
  localparam XOR_state = 5'd13;
  localparam A_state = 5'd14;
  localparam NOSHIFT_state = 5'd15;
  localparam LEFTSHIFT_state = 5'd16;
  localparam RIGHTSHIFT_state = 5'd17;
  localparam RIGHTEXTENDSHIFT_state = 5'd18;
  localparam ENDSHIFT_state = 5'd19;
  localparam ERROR_state = 5'd20;
  
  reg [4:0] M_state_d, M_state_q = IDLE_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_counter_d = M_counter_q + 1'h1;
    a = 8'h00;
    b = 8'h00;
    alufn = 6'h00;
    ans = 8'h00;
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    out = 1'h0;
    shiftb = 5'h00;
    
    case (M_state_q)
      IDLE_state: begin
        alufn = 6'h00;
        a = 8'h00;
        b = 8'h00;
        ans = 8'h00;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = ADD_state;
          M_counter_d = 1'h0;
        end else begin
          if (io_button[2+0-:1] == 1'h1) begin
            M_state_d = CMPEQ_state;
            M_counter_d = 1'h0;
          end else begin
            if (io_button[3+0-:1] == 1'h1) begin
              M_state_d = AND_state;
              M_counter_d = 1'h0;
            end else begin
              if (io_button[4+0-:1] == 1'h1) begin
                M_state_d = NOSHIFT_state;
                M_counter_d = 1'h0;
              end
            end
          end
        end
      end
      ADD_state: begin
        alufn = 6'h00;
        a = 8'h04;
        b = 8'h04;
        ans = s;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (s == 8'h08) begin
            M_state_d = SUBTRACT_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      SUBTRACT_state: begin
        alufn = 6'h01;
        a = 8'h14;
        b = 8'h11;
        ans = s;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          if (s == 8'h03) begin
            M_state_d = MULTIPLIER_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      MULTIPLIER_state: begin
        alufn = 6'h02;
        a = 8'h04;
        b = 8'h05;
        ans = s;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (s == 8'h14) begin
            M_state_d = OVERFLOW_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      OVERFLOW_state: begin
        alufn = 6'h00;
        a = 8'h99;
        b = 8'h99;
        ans = s;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          if (s == 8'h32) begin
            M_state_d = IDLE_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      CMPEQ_state: begin
        alufn = 6'h33;
        a = 8'h00;
        b = 8'h00;
        z = 1'h0;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (checker == 1'h0) begin
            M_state_d = CMPEQF_state;
          end
        end
      end
      CMPEQF_state: begin
        alufn = 6'h33;
        a = 8'h01;
        b = 8'h00;
        z = 8'h01;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          if (checker == 1'h1) begin
            M_state_d = CMPLT_state;
          end
        end
      end
      CMPLT_state: begin
        alufn = 6'h35;
        v = 8'h01;
        n = 8'h00;
        a = 8'h1f;
        b = 8'h7f;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (checker == 1'h1) begin
            M_state_d = CMPLTF_state;
          end
        end
      end
      CMPLTF_state: begin
        alufn = 6'h35;
        a = 8'h7f;
        b = 8'h1f;
        v = 8'h01;
        n = 8'h01;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          if (checker == 1'h0) begin
            M_state_d = CMPLE_state;
          end
        end
      end
      CMPLE_state: begin
        alufn = 6'h37;
        z = 8'h01;
        v = 8'h01;
        n = 8'h01;
        a = 8'h1f;
        b = 8'h7f;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          if (checker == 1'h1) begin
            M_state_d = CMPLEF_state;
          end
        end
      end
      CMPLEF_state: begin
        alufn = 6'h37;
        z = 8'h00;
        v = 8'h01;
        n = 8'h01;
        a = 8'h7f;
        b = 8'h1f;
        out = checker;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          if (checker == 1'h0) begin
            M_state_d = IDLE_state;
          end
        end
      end
      AND_state: begin
        alufn = 6'h18;
        a = 8'ha5;
        b = 8'hc3;
        ans = boole;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = OR_state;
        end
      end
      OR_state: begin
        alufn = 6'h1e;
        a = 8'ha5;
        b = 8'hc3;
        ans = boole;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          M_state_d = XOR_state;
        end
      end
      XOR_state: begin
        alufn = 6'h16;
        a = 8'ha5;
        b = 8'hc3;
        ans = boole;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = A_state;
        end
      end
      A_state: begin
        alufn = 6'h1a;
        a = 8'ha5;
        b = 8'hc3;
        ans = boole;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          M_state_d = IDLE_state;
        end
      end
      NOSHIFT_state: begin
        a = 8'hff;
        shiftb = 1'h0;
        ans = sum;
        alufn = 6'h00;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          M_state_d = LEFTSHIFT_state;
        end
      end
      LEFTSHIFT_state: begin
        a = 8'hff;
        shiftb = 2'h3;
        b = 2'h3;
        ans = sum;
        alufn = 6'h20;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = RIGHTSHIFT_state;
        end
      end
      RIGHTSHIFT_state: begin
        a = 8'hff;
        shiftb = 3'h6;
        b = 3'h6;
        ans = sum;
        alufn = 6'h22;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          M_state_d = RIGHTEXTENDSHIFT_state;
        end
      end
      RIGHTEXTENDSHIFT_state: begin
        a = 8'hf0;
        shiftb = 3'h6;
        b = 3'h6;
        ans = sum;
        alufn = 6'h23;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = ENDSHIFT_state;
        end
      end
      ENDSHIFT_state: begin
        a = sum;
        shiftb = 1'h0;
        b = 1'h0;
        alufn = 6'h00;
        if (M_counter_q[26+0-:1] == 1'h0) begin
          ans = sum;
          M_state_d = IDLE_state;
        end
      end
      ERROR_state: begin
        a = 8'hff;
        b = 8'hff;
        ans = 8'hff;
        alufn = 6'h3f;
        out = 1'h1;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
