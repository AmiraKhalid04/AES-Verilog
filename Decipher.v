module Decipher(
    input[0:127] in,
    input[0:1407] words,
    output[0:127] out,
    input clk
    // input [4:0] round
);

    integer round = 10;

    wire [0:127] inbefore_AddKey,inafter_AddKey, inafter_InvShiftRow, inafter_InvSubBytes, inafter_InvMixColumns,inv_sr;
    reg [0:127] state;
    
    //inverse_shift_rows U1(state, inafter_InvShiftRow);
    inverse_shift_rows U1(inv_sr, inafter_InvShiftRow);
    inv_sub_bytes U2(inafter_InvShiftRow, inafter_InvSubBytes);
    add_round_key U3(inbefore_AddKey, words[(128*(-round+10+10))+:128], inafter_AddKey);
    InvMixColumns U4(inafter_AddKey, inafter_InvMixColumns);


    assign inv_sr=(round == 10)? inafter_AddKey:inafter_InvMixColumns;
    
    assign inbefore_AddKey =(round == 10)?in:inafter_InvSubBytes;

    // desperate tries
    //assign inbefore_AddKey = (round == 10)? in:state;
    // assign out = (round == 0)? in:inafter_AddKey;
    // assign out =(round == 19)? inafter_AddKey:inafter_InvMixColumns;

    //assign out =(round == 10)?inafter_AddKey:state;
    always @(posedge clk) begin
        if(round-10 < 10 && round > 9) begin
            if (round==10) begin
                state<=inafter_AddKey;
            end
           else if(round-10 < 9) begin
                state <= inafter_InvMixColumns;
                //state <= inafter_InvSubBytes;
                end
            else if(round-10 == 9) begin
                //state <= inafter_InvSubBytes;
                state <= inafter_AddKey;
            end
            round <= round + 1;
        end
    end


endmodule

// 0 to 9 --> cipher 
// 10 to 19 --> decipher 


// another try 
// state is input of second round 
// first operation in decipher is shift rows 

// update should be :
// assign inafter_InvShiftRow = (round == 10)? inafter_AddKey:state;