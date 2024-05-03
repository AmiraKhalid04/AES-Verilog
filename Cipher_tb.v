module Cipher_tb;
    reg clk;
    reg [0:127]in;
    reg [0:127] key;
    wire [0:1407] words;
    wire [0:127] out;
    KeyExpansion tst2(key,words);
    Cipher tst(in, words, out, clk);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        $monitor("%h", out);
        clk = 0;
        in = 128'h00112233445566778899aabbccddeeff;
        key = 128'h000102030405060708090a0b0c0d0e0f;
    end
endmodule