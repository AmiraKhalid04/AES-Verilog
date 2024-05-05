module KeyExpansion_tb();
reg [0:127]key=128'h000102030405060708090a0b0c0d0e0f;
wire [0:1407]word;

KeyExpansion k(key,word);
    integer i;
    initial begin
    #10;   
    for (i=0 ; i<11 ; i=i+1) begin
	$display("word_1: %h word_2: %h word_3: %h word_4: %h",
	word[(32*4*i)+:32],word[(32*(4*i+1))+:32],word[(32*(4*i+2))+:32],word[(32*(4*i+3))+:32]);
end
end

endmodule