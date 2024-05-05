module Cipher(
     input[0:127] in, 
      input[0:1407] words,
       output[0:127] out,
        input clk,
        input [4:0] round);
    //integer round= 0;
    wire [0:127] inbefore_AddKey, inafter_AddKey, inafter_ShiftRow, inafter_SubBytes, inafter_MixColumns;
    reg [0:127] state;
    
    add_round_key U1(inbefore_AddKey, words[(128*round)+:128], inafter_AddKey);
    sub_bytes U2(inafter_AddKey, inafter_SubBytes);
    shift_rows U3(inafter_SubBytes, inafter_ShiftRow);
    MixColumns U4(inafter_ShiftRow, inafter_MixColumns);
    
    //handling boundary conditions when >10

    assign inbefore_AddKey = (round == 0)? in:state;
    
    assign out = (round == 0)? in: (round > 10)?state^words[(128*10)+:128]:inafter_AddKey;
    //assign out = inafter_AddKey;
    
    always @(posedge clk) begin
        if(round < 10) begin
            if(round < 9) begin
                state <= inafter_MixColumns;
             end
            else if(round == 9) begin
                state <= inafter_ShiftRow;
             end
            //round <= round + 1;
        end
    end
endmodule

// 0 9
// 10 19 