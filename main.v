//TODO A_1 :implement Binary -> BCD Converter
module BCD_Converter();
endmodule

//TODO A_2 :implement BCD -> 7-segment Decoder
module Seg7_Decoder();
endmodule

module main(out);
    reg input_text;
    output out;
    begin
        KeyExpansion KEx();
        Cipher C();
        invCipher iC();
    end
    //After modifing input_text and out don't forget to
    //Set the leastsig to the previous mods and this is your output
endmodule