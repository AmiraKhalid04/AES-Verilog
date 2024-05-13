module Cipher#(parameter x  )(
     input[0:127] in, 
      input[0:128*(11+2*x)-1] words,
       output[0:127] out,
        input clk,input rst,input enable);
    integer round= 0;
    wire [0:127] inbefore_AddKey,inafter_AddKey
    , inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state;
    add_round_key U1(inbefore_AddKey, words[((128)*round)+:128], inafter_AddKey);
    sub_bytes U2(inafter_AddKey, inafter_SubBytes);
    shift_rows U3(inafter_SubBytes, inafter_ShiftRow);
    MixColumns U4(inafter_ShiftRow, inafter_MixColumns);
    assign inbefore_AddKey = (round == 0)? in:state;
    assign out =(!enable)?state:
    (round == 0)? in:
    (round == 10 + 2*x)?inafter_AddKey:
    (round > 10 + 2*x)?state:inafter_AddKey;
    always @(posedge clk or posedge rst) begin
        if(rst) begin round <=0;end
        else if(enable) begin
        if(round <= (10+2*x)) begin
            if(round < (9+2*x)) begin
                state <= inafter_MixColumns;
             end
             else if(round == 9+2*x)begin
                state <= inafter_ShiftRow;
             end
             else if(round == 10 +2*x)begin
                state <= inafter_AddKey;
             end

        end
            round <= round + 1;
        end
    end
endmodule