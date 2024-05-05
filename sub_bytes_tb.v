module sub_bytes_tb();
reg [127:0] state;
wire [127:0] next_state;

initial 
$monitor("state = %h, next_state =%h",state,next_state);

sub_bytes DUT(state,next_state);

initial begin
     
    //Round 1
     state=128'h 00102030405060708090a0b0c0d0e0f0;#10
    //Round 2
     state=128'h89d810e8855ace682d1843d8cb128fe4;#10 
    //Round 3
     state=128'h4915598f55e5d7a0daca94fa1f0a63f7;#10 
    //Round 4
     state=128'hfa636a2825b339c940668a3157244d17;#10
    //Round 5
     state=128'h247240236966b3fa6ed2753288425b6c;#10 
    //Round 6
     state=128'hc81677bc9b7ac93b25027992b0261996;#10 
    //Round 7
     state=128'hc62fe109f75eedc3cc79395d84f9cf5d;#10 
    //Round 8
     state=128'hd1876c0f79c4300ab45594add66ff41f;#10
    //Round 9
     state=128'hfde3bad205e5d0d73547964ef1fe37f1;#10 
    //Round 10
     state=128'hbd6e7c3df2b5779e0b61216e8b10b689;     
end

  
endmodule
