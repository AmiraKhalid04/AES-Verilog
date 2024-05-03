module Cipher(
     input[0:127] in, 
      input[0:1407] words,
       output[0:127] out,
        input clk);
    integer round= 0;
    wire [0:127] inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state,next_state, currentKey, out_reg;
    add_round_key U1(state, currentKey, inafter_AddKey);
    sub_bytes U2(inafter_AddKey, inafter_SubBytes);
    shift_rows U3(inafter_SubBytes, inafter_ShiftRow);
    MixColumns U4(inafter_ShiftRow, inafter_MixColumns);
    assign out = out_reg;
    always @(posedge clk) begin
        if(round < 12) begin
            
            if(round == 0)begin
                out_reg = in;
                state = in;
             end
            else if((0 < round) && (round < 10)) begin
                out_reg = inafter_AddKey;
                next_state = inafter_MixColumns;
                state = next_state;
             end
            else if(round == 10) begin
                out_reg = inafter_AddKey;
                next_state = inafter_ShiftRow;
                state = next_state;
             end
            else if(round == 11) begin
                out_reg = inafter_AddKey;
                next_state = inafter_AddKey;
                state = next_state;
             end
            currentKey = words[(128*round)+:128];
            round = round + 1;
        end
    end
endmodule