module inv_sub_bytes_tb();
reg [127:0] state;
wire [127:0] next_state;

initial 
$monitor("state = %h, next_state =%h",state,next_state);

inv_sub_bytes DUT(state,next_state);

initial begin

    //Round 1
    state= 128'h7a9f102789d5f50b2beffd9f3dca4ea7;#10
    //Round 2
    state= 128'h5411f4b56bd9700e96a0902fa1bb9aa1;#10
    //Round 3
    state= 128'h3e175076b61c04678dfc2295f6a8bfc0;#10
    //Round 4
    state= 128'hb415f8016858552e4bb6124c5f998a4c;#10
    //Round 5
    state= 128'he847f56514dadde23f77b64fe7f7d490;#10
    //Round 6
    state= 128'h36400926f9336d2d9fb59d23c42c3950;#10
    //Round 7
    state= 128'h2dfb02343f6d12dd09337ec75b36e3f0;#10
    //Round 8
    state= 128'h3b59cb73fcd90ee05774222dc067fb68;#10
    //Round 9
    state= 128'ha761ca9b97be8b45d8ad1a611fc97369;#10
    //Round 10
    state= 128'h63cab7040953d051cd60e0e7ba70e18c;

end
endmodule

