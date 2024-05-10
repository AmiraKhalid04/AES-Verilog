module Decipher#(parameter x)(
    input[0:127] in,
    input[0:128*(2*x + 11) - 1] words,
    output[0:127] out,
    input clk, 
    input [4:0] round);
    
    // Input and output of each operation
    wire [0:127] inbefore_AddKey, inafter_AddKey, inafter_InvShiftRow, inafter_InvSubBytes, inafter_InvMixColumns; 
    reg [0:127] finalstate; // To store the output of the last round
    reg [0:127] inv_sr; // Input of inverse shift rows operation
    
    inverse_shift_rows U1(inv_sr, inafter_InvShiftRow);
    inv_sub_bytes U2(inafter_InvShiftRow, inafter_InvSubBytes);
    add_round_key U3(inbefore_AddKey, words[(128*(-round+20+4*x))+:128], inafter_AddKey);
    InvMixColumns U4(inafter_AddKey, inafter_InvMixColumns);

    assign inbefore_AddKey = (round == 10+2*x) ? in : inafter_InvSubBytes;
    
    assign out = 
      (round > 20 + 4*x) ? finalstate : 
      (round == 10 + 2*x) ? inafter_AddKey : // First round only performs add round key operation
      (round == 20 + 4*x) ? inafter_AddKey : 
      inafter_InvMixColumns; 

    always @(posedge clk) begin
      if(round <20 + 4*x && round >= 10 + 2*x) begin   
        if(round == 10+2*x) begin
          inv_sr <= inafter_AddKey; 
        end else begin
          inv_sr <= inafter_InvMixColumns;
        end
      end
      if(round == 20 + 4*x) begin
        finalstate <= inafter_AddKey;
      end
    end
endmodule

