module Cipher(
     input[0:127] in, 
      input[0:1407] words,
       output[0:127] out,
        input clk);
    integer round= 0;
    wire [0:127] inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] currentKey, out_reg;
    sub_bytes U1(out_reg, inafter_SubBytes);
    shift_rows U2(inafter_SubBytes, inafter_ShiftRow);
    MixColumns U3(inafter_ShiftRow, inafter_MixColumns);
    add_round_key U4(inafter_MixColumns, currentKey, inafter_AddKey);
    assign out = out_reg;
    always @(posedge clk) begin
        if(round < 11) begin
            if(round == 0)begin
                out_reg = in ^ words[0+:128];
             end
            else if(round < 10) begin
                out_reg = inafter_AddKey;
             end
            else if(round == 10) begin
                out_reg = inafter_ShiftRow ^ currentKey;
             end
            round = round + 1;
            currentKey = words[(128*round)+:128];
        end
    end
endmodule