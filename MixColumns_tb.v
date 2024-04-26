module MixColumns_tb;
reg [127:0] in;
wire [127:0] out;
MixColumns tst(in, out);
initial begin 
    $monitor("[monitor] in = %h, out = %h", in, out);
    in <= 128'h6353e08c0960e104cd70b751bacad0e7;
    #10;
    in <= 128'ha7be1a6997ad739bd8c9ca451f618b61;
    #10;
    in <= 128'h3bd92268fc74fb735767cbe0c0590e2d;
    #10;
    in <= 128'h2d6d7ef03f33e334093602dd5bfb12c7;
    #10;
    in <= 128'h36339d50f9b539269f2c092dc4406d23;
    #10;
    in <= 128'he8dab6901477d4653ff7f5e2e747dd4f;    
    #10;
    in <= 128'hb458124c68b68a014b99f82e5f15554c;
    #10;
    in <= 128'h3e1c22c0b6fcbf768da85067f6170495;
    #10;
    in <= 128'h54d990a16ba09ab596bbf40ea111702f;
end
    
endmodule