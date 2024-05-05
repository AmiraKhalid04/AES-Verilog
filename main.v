//TODO A_1 :implement Binary -> BCD Converter
module BCD_Converter();
endmodule
//TODO A_2 :implement BCD -> 7-segment Decoder
module Seg7_Decoder();
endmodule

module main(input [1:0]SW,out);
    reg input_text;
    output out;
    always @(*)begin
    if(SW==0)
    begin
        KeyExpansion KEx();
        Cipher C();
        invCipher iC();
    end
    else if(SW==1)
    begin
        KeyExpansion_192 KEx();
        Cipher_192 C();
        invCipher_192 iC();
    end    
     else if(SW==2)
    begin
        KeyExpansion_256 KEx();
        Cipher_256 C();
        invCipher_256 iC();
    end    
    end
    //After modifing input_text and out don't forget to
    //Set the leastsig to the previous mods and this is your output
endmodule