//TODO A_1 :implement Binary -> BCD Converter
module BCD_Converter();
endmodule
//TODO A_2 :implement BCD -> 7-segment Decoder
module Seg7_Decoder();
endmodule
module main(input [1:0]SW,output [1:0]LEDR,input [1:0]KEY);
    reg input_text,key_text_128,key_text_192,key_text_256;
    wire [0:1407]words_128;
    wire [0:1663]words_192;
    wire [0:1919]words_256;
    assign input_text='h00112233445566778899aabbccddeeff;
    assign key_text_128='h000102030405060708090a0b0c0d0e0f;
    assign key_text_192='h000102030405060708090a0b0c0d0e0f;
    assign key_text_256='h000102030405060708090a0b0c0d0e0f;
    wire[0:127] out;
    always @(*)begin
    if(SW==0||SW==3)
    begin
        KeyExpansion KEx(key_text_128,words_128);
        Cipher C(input_text,words_128,out,KEY[0]);
        invCipher iC();
    end
    else if(SW==1)
    begin
        KeyExpansion_192 KEx_1(key_text_192,words_192);
        Cipher_192 C_1(input_text,words_192,out,KEY[0]);
        invCipher_192 iC_1();
    end    
     else if(SW==2)
    begin
        KeyExpansion_256 KEx_2(key_text_256,words_256);
        Cipher_256 C_2(input_text,words_256,out,KEY[0]);
        invCipher_256 iC_2();
    end    
    end
    if(out==input_text)
    assign LEDR[0]=1;
    else
    assign LEDR[0]=0;
    //After modifing input_text and out don't forget to
    //Set the leastsig to the previous mods and this is your output
endmodule