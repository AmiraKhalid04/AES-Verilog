module Cipher(
     input[0:127] in, 
      input[0:1407] words,
       output[0:127] out,
         input clk);
    reg [3:0] round=4'b0000;
    wire [0:127] in, inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state,AddkeyReg, ShiftRowReg, subBytesReg, MixColumnsReg, out_reg, currentKey;
    sub_bytes U3(subBytesReg, inafter_SubBytes);
    shift_rows U2(ShiftRowReg, inafter_ShiftRow);
    MixColumns U4(MixColumnsReg, inafter_MixColumns);
    add_round_key U1(AddkeyReg,currentKey , inafter_AddKey);
    assign out = out_reg; 
    integer i;
    always @(posedge clk) begin
        if(round < 11) begin
            i <= round;
            currentKey <= words[(128*i)+:128];
            if(round == 0)begin
                AddKeyReg <= in;
            end
            if(round < 10) begin
                subBytesReg <= state;
                ShiftRowReg <= inafter_SubBytes;
                MixColumnsReg <= inafter_ShiftRow;
                AddKeyReg <= inafter_MixColumns;
            end else if(round == 10) begin 
                subBytesReg <= state;
                ShiftRowReg <= inafter_SubBytes;
                AddKeyReg <= inafter_ShiftRow;
            end
            out_reg <= inafter_AddKey;
            state <= out_reg;
            round <= round + 1;
        end
    end
endmodule


module Cipher_tb;
    reg clk;
    reg [0:127]in;
    reg [0:127] key;
    wire [0:1407] words;
    output [0:127] out;
    Cipher tst(in, words, out, clk);
    KeyExpansion(key,words);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        clk <= 0;
        in = 128'h00112233445566778899aabbccddeeff;
        key = 128'h000102030405060708090a0b0c0d0e0f
    end
endmodule