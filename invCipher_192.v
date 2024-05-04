module Cipher_256(
     input[0:127] in, 
      input[0:1919] words,
       output[0:127] out,
        input clk);
    integer round= 0;
    wire [0:127] inbefore_AddKey,inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state;
    add_round_key_256 U1(inbefore_AddKey, words[(256*round)+:256], inafter_AddKey);
    sub_bytes U2(inafter_AddKey, inafter_SubBytes);
    shift_rows U3(inafter_SubBytes, inafter_ShiftRow);
    MixColumns U4(inafter_ShiftRow, inafter_MixColumns);
    assign inbefore_AddKey = (round == 0)? in:state;
    assign out = (round == 0)? in:inafter_AddKey;
    always @(posedge clk) begin
        if(round < 14) begin
            if(round < 13) begin
                state <= inafter_MixColumns;
             end
            else if(round == 13) begin
                state <= inafter_ShiftRow;
             end
            round <= round + 1;
        end
    end
endmodule

