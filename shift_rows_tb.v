module shift_rows_tb;
reg [0:127] in;
wire [0:127] out;
shift_rows test(in, out);

initial begin 
    $monitor("[monitor] in = %h, out = %h", in, out);
    in <= 128'h63cab7040953d051cd60e0e7ba70e18c;
    #10;
    in <= 128'ha761ca9b97be8b45d8ad1a611fc97369;
    #10;
    in <= 128'h3b59cb73fcd90ee05774222dc067fb68;
    #10;
    in <= 128'h2dfb02343f6d12dd09337ec75b36e3f0;
    #10;
    in <= 128'h36400926f9336d2d9fb59d23c42c3950;
    #10;
    in <= 128'he847f56514dadde23f77b64fe7f7d490;    
    #10;
    in <= 128'hb458124c68b68a014b99f82e5f15554c;
    #10;
    in <= 128'h3e175076b61c04678dfc2295f6a8bfc0;
    #10;
    in <= 128'h5411f4b56bd9700e96a0902fa1bb9aa1;
end
    
endmodule