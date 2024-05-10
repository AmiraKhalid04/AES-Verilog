module add_round_key_tb();
 reg [0:127] state;
 reg [0:127] key;
 wire [0:127] next_state;

 initial 
 $monitor("key = %h,state=%h,next_state=%h",key,state,next_state);

 add_round_key DUT(state,key,next_state);
 
 initial begin
    //Start
    key = 128'h00112233445566778899aabbccddeeff;
    state=128'h000102030405060708090a0b0c0d0e0f;
    
    //Round 1
    #10
    key = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;
    state=128'h5f72641557f5bc92f7be3b291db9f91a;
    
    //Round 2
    #10
    key = 128'hff87968431d86a51645151fa773ad009;
    state=128'hb692cf0b643dbdf1be9bc5006830b3fe;
    
    //Round 3
    #10
    key = 128'h4c9c1e66f771f0762c3f868e534df256;
    state=128'hb6ff744ed2c2c9bf6c590cbf0469bf41;
    
    //Round 4
    #10
    key = 128'h6385b79ffc538df997be478e7547d691;
    state=128'h47f7f7bc95353e03f96c32bcfd058dfd;

    //Round 5
    #10
    key = 128'hf4bcd45432e554d075f1d6c51dd03b3c;
    state=128'h3caaa3e8a99f9deb50f3af57adf622aa;
    
    //Round 6
    #10
    key = 128'h9816ee7400f87f556b2c049c8e5ad036;
    state=128'h5e390f7df7a69296a7553dc10aa31f6b;
    
    //Round 7
    #10
    key = 128'hc57e1c159a9bd286f05f4be098c63439;
    state=128'h14f9701ae35fe28c440adf4d4ea9c026;
    
    //Round 8
    #10
    key = 128'hbaa03de7a1f9b56ed5512cba5f414d23;
    state=128'h47438735a41c65b9e016baf4aebf7ad2;
    
    //Round 9
    #10
    key = 128'he9f74eec023020f61bf2ccf2353c21c7;
    state=128'h549932d1f08557681093ed9cbe2c974e;
    
    //Round 10
    #10
    key = 128'h7ad5fda789ef4e272bca100b3d9ff59f;
    state=128'h13111d7fe3944a17f307a78b4d2b30c5;
 end
endmodule 


