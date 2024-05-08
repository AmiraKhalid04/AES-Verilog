module Decipher#(parameter x)(
    input[0:127] in,
    input[0:128*(2*x+11)-1] words,
    output[0:127] out,
    input clk
    , input [4:0] round
);

reg[0:127]finalstate;
    //integer round = 10;
    wire [0:127] inafter_AddKey, inafter_InvShiftRow, inafter_InvSubBytes, inafter_InvMixColumns;
    reg [0:127] state, inbefore_AddKey;
    wire [0:127] inv_sr;
    
    inverse_shift_rows U1(inv_sr, inafter_InvShiftRow);
    inv_sub_bytes U2(inafter_InvShiftRow, inafter_InvSubBytes);
    add_round_key U3(inbefore_AddKey, words[(128*(-round+10+10+4*x))+:128], inafter_AddKey);
    InvMixColumns U4(inafter_AddKey, inafter_InvMixColumns);


    
   assign inv_sr=(round == 10+2*x )? in^ words[(128*(10+2*x))+:128]:inafter_InvMixColumns;
    
     //handling boundary conditions when <10
always @(*)
if(round==20+4*x)
finalstate=inafter_AddKey;

    assign out =(round>20+4*x)?finalstate:(round == 20+4*x)? inafter_AddKey:(round == 10+2*x)?in^ words[(128*(10+2*x))+:128]:inafter_InvMixColumns;    // 9 or 10

  
    always @(posedge clk) begin
        
        if(round <20+4*x&&round>=10+2*x) begin   
            
            
            inbefore_AddKey <= inafter_InvSubBytes;

            //round <= round + 1;
        end
    end
endmodule

