module Cipher(
     input[0:127] in, 
      input[0:1407] words,
       output[0:127] out,
         input clk,
         output [0:3] round_tst,
         output [0:127] round_tst2,
         output [0:127] round_tst3);
    reg [3:0] round= 0;
    wire [0:127] inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state, AddKeyReg, ShiftRowReg, subBytesReg, MixColumnsReg, currentKey;
    sub_bytes U3(subBytesReg, inafter_SubBytes);
    shift_rows U2(ShiftRowReg, inafter_ShiftRow);
    MixColumns U4(MixColumnsReg, inafter_MixColumns);
    add_round_key U1(AddkeyReg,currentKey , inafter_AddKey);
    //assign inafter_AddKey = AddKeyReg ^ currentKey;
    assign out = inafter_AddKey;
    assign round_tst3 = state;
    assign round_tst2 = currentKey;
    assign round_tst = round;


    always @(posedge clk) begin
        if(round < 11) begin
            currentKey = words[(128*round)+:128];
            #10;
            if(round == 0)begin
                #5;
                AddKeyReg = in;
                #5;
                state = inafter_AddKey;
                #5;
                round = round + 1;
            end
            else if(0 < round < 10) begin
                #5;
                subBytesReg = state;
                #5;
                ShiftRowReg = inafter_SubBytes;
                #5;
                MixColumnsReg = inafter_ShiftRow;
                #5;
                AddKeyReg = inafter_MixColumns;
                #5;
                state = inafter_AddKey;
                #5;
                round = round + 1;
            end else if(round == 10) begin
                #5; 
                subBytesReg = state;
                #5;
                ShiftRowReg = inafter_SubBytes;
                #5;
                AddKeyReg = inafter_ShiftRow;
                #5;
                state = inafter_AddKey;
                #5;
                round = round + 1;
            end
        end
    end
endmodule




