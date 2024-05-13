module Decipher#(parameter x)(
    input[0:127] in,
    input[0:128*(2*x+11)-1] words,
    output[0:127] out,
    input clk ,input rst,input enable
);

reg [0:127]finalstate;
    integer round = 0;
    wire [0:127] inafter_AddKey, inafter_InvShiftRow, inafter_InvSubBytes, inafter_InvMixColumns;
    reg [0:127] state;
    wire [0:127] inbefore_AddKey;
    reg [0:127] inv_sr;
    
    inverse_shift_rows U1(inv_sr, inafter_InvShiftRow);
    inv_sub_bytes U2(inafter_InvShiftRow, inafter_InvSubBytes);
    add_round_key U3(inbefore_AddKey, words[(128*(-round-10+20+2*x))+:128], inafter_AddKey);
    InvMixColumns U4(inafter_AddKey, inafter_InvMixColumns);


    assign inbefore_AddKey=(round +10+2*x== 10+2*x)? in:inafter_InvSubBytes;
    assign out =(!enable)?in:
    (round+10+2*x>20+4*x)?finalstate:
    (round+10+2*x == 20+4*x)?inafter_AddKey:
    (round+10+2*x == 10+2*x)?inafter_AddKey:inafter_InvMixColumns;    // 9 or 10

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin round <=0;end
        else if(enable)begin
            if(round+10+2*x <20+4*x&&round+10+2*x>=10+2*x) begin
                if(round+10+2*x == 10+2*x) 
                    inv_sr<=inafter_AddKey;
                else
                inv_sr<=inafter_InvMixColumns;
                round<=round+1;
            end
            if(round +10 +2*x== 20+4*x)begin
            finalstate <= inafter_AddKey;
        end
    end
    end
endmodule