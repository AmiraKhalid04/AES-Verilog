//TODO A_1 :implement Binary -> BCD Converter
module BCDconverter();
endmodule

//TODO A_2 :implement BCD -> 7-segment Decoder
module seg7_Deocder();
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