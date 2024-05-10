module Cipher#(parameter x)(
  input[0:127] in, 
  input[0:128*(11+2*x)-1] words,
  output[0:127] out,
  input clk,
  input[4:0] round);

  wire [0:127] inbefore_AddKey, inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
  reg [0:127] state; // To store input of add round key operation

  add_round_key U1(inbefore_AddKey, words[((128)*round)+:128], inafter_AddKey);
  sub_bytes U2(inafter_AddKey, inafter_SubBytes);
  shift_rows U3(inafter_SubBytes, inafter_ShiftRow);
  MixColumns U4(inafter_ShiftRow, inafter_MixColumns);

  assign inbefore_AddKey = (round == 0) ? in : state;
  assign out = (round == 0) ? in : inafter_AddKey; 
  
  always @(posedge clk) begin
    if(round < (10 + 2*x)) begin
      if(round < (9 + 2*x)) begin
        state <= inafter_MixColumns;
      end else if(round == (9 + 2*x)) begin
        state <= inafter_ShiftRow;
      end
    end
  end
endmodule