module InvMixColumns_tb;
reg [0:127] in;
wire [0:127] out;
InvMixColumns tst(in, out);
initial
begin 
    $monitor("[monitor] in = %h, out = %h", in, out);
    in <= 128'hbd6e7c3df2b5779e0b61216e8b10b689;
    #10;
    in <= 128'hfde3bad205e5d0d73547964ef1fe37f1;
    #10;
    in <= 128'hd1876c0f79c4300ab45594add66ff41f;
    #10;
    in <= 128'hc62fe109f75eedc3cc79395d84f9cf5d;
    #10;
    in <= 128'hc81677bc9b7ac93b25027992b0261996;
    #10;
    in <= 128'h247240236966b3fa6ed2753288425b6c;
    #10;
    in <= 128'hfa636a2825b339c940668a3157244d17;    
    #10;
    in <= 128'h247240236966b3fa6ed2753288425b6c;
    #10;
    in <= 128'h4915598f55e5d7a0daca94fa1f0a63f7;
    #10;
    in <= 128'h89d810e8855ace682d1843d8cb128fe4;
end
    
endmodule