//TODO A_1 :implement Binary -> BCD Converter
module BCD_Converter();
endmodule
//TODO A_2 :implement BCD -> 7-segment Decoder
module Seg7_Decoder();
endmodule

module main(input [1:0]SW,out);
    reg input_text_128,input_text_192_input_text_256;
    assign input_text_128='h
    output out;
    always @(*)begin
    if(SW==0||SW==3)
    begin
        KeyExpansion KEx();
        Cipher C();
        invCipher iC();
    end
    else if(SW==1)
    begin
        KeyExpansion_192 KEx_1();
        Cipher_192 C_1();
        invCipher_192 iC_1();
    end    
     else if(SW==2)
    begin
        KeyExpansion_256 KEx_2();
        Cipher_256 C_2();
        invCipher_256 iC_2();
    end    
    end
    //After modifing input_text and out don't forget to
    //Set the leastsig to the previous mods and this is your output
endmodule