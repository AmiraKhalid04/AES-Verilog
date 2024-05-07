//TODO A_1 :implement Binary -> BCD Converter
module BCD_converter(
    input [7:0] data,
    output [3:0] units,
    output [3:0] tens,
    output [3:0] hundreds);

    wire [3:0] in1, in2, in3, in4, in5, in6, in7;
    wire [3:0] out1, out2, out3, out4, out5, out6, out7;

    assign in1 = {1'b0, data[7:5]};
    assign in2 = {out1[2:0], data[4]};
    assign in3 = {out2[2:0], data[3]};
    assign in4 = {out3[2:0], data[2]};
    assign in5 = {out4[2:0], data[1]};
    assign in6 = {1'b0, out1[3], out2[3], out3[3]};
    assign in7 = {out6[2:0], out4[3]};

    add_3 m1 (in1, out1);
    add_3 m2 (in2, out2);
    add_3 m3 (in3, out3);
    add_3 m4 (in4, out4);
    add_3 m5 (in5, out5);
    add_3 m6 (in6, out6);
    add_3 m7 (in7, out7);

    assign units = {out5[2:0], data[0]};
    assign tens = {out7[2:0], out5[3]};
    assign hundreds = {out6[3], out7[3]};
endmodule

module add_3(
    input [3:0] in,
    output reg [3:0] out);

    always @(*)
        case (in)
            4'b0000: out <= 4'b0000;
            4'b0001: out <= 4'b0001;
            4'b0010: out <= 4'b0010;
            4'b0011: out <= 4'b0011;
            4'b0100: out <= 4'b0100;
            4'b0101: out <= 4'b1000;
            4'b0110: out <= 4'b1001;
            4'b0111: out <= 4'b1010;
            4'b1000: out <= 4'b1011;
            4'b1001: out <= 4'b1100;
            default: out <= 4'b0000;
        endcase
endmodule

module seg7_decoder(
    input [3:0] data,
    output reg [6:0] out);

    always @(*) begin
        case (data)
            4'b0000: out <= 7'b1000000;
            4'b0001: out <= 7'b1111001;
            4'b0010: out <= 7'b0100100;
            4'b0011: out <= 7'b0011000;
            4'b0100: out <= 7'b0011001;
            4'b0101: out <= 7'b0010010;
            4'b0110: out <= 7'b0000011;
            4'b0111: out <= 7'b1111000;
            4'b1000: out <= 7'b0000100;
            4'b1001: out <= 7'b0010000;
            default: out <= 7'b0000000;
        endcase
    end
endmodule

module main(input KEY,output LEDR, 
output [6:0] seg_units,
output [6:0] seg_tens,
output [6:0] seg_hundreds);

integer round =0; 
    reg [0:127]input_text=128'h00112233445566778899aabbccddeeff;
    wire [0:127] outCipher_128;
    wire [0:127] outCipher_192;
    wire [0:127] outCipher_256;

    //wire [0:127] outDecipher;

    wire [0:127] outDecipher_128;
    wire [0:127] outDecipher_192;
    wire [0:127] outDecipher_256;
    reg [0:255] key=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
    wire [0:1407] words_128;
    wire [0:1663] words_192;
    wire [0:1919] words_256;

    wire [3:0] units;
    wire [3:0] tens;
    wire [3:0] hundreds;

    wire [7:0] least_bytes;
    
    
    
    
    BCD_converter bcd(least_bytes,units,tens,hundreds);
    seg7_decoder seg1(units, seg_units);
    seg7_decoder seg2(tens, seg_tens);
    seg7_decoder seg3(hundreds, seg_hundreds);

    KeyExpansion #(.x(0))KEx_128(key[0:127],words_128[0:1407]);
    KeyExpansion #(.x(1))KEx_192(key[0:191],words_192[0:1663]);
    KeyExpansion #(.x(2))KEx_256(key[0:255],words_256[0:1919]);
    
    Cipher #(.x(0))C_128(input_text, words_128[0:1407], outCipher_128, KEY, round);
    Decipher #(.x(0))iC_128(outCipher_128, words_128[0:1407], outDecipher_128, KEY, round);
    Cipher #(.x(1))C_192(input_text, words_192[0:1663], outCipher_192, KEY, round);
    Decipher #(.x(1))iC_192(outCipher_192, words_192[0:1663], outDecipher_192, KEY, round);
    Cipher #(.x(2))C_256(input_text, words_256[0:1919], outCipher_256, EY, round);
    Decipher #(.x(2))iC_256(outCipher_256, words_256[0:1919], outDecipher_256, KEY, round);


    assign LEDR = (outDecipher_128==input_text)?1'b1:
    1'b0;
    assign least_bytes =(round <= 10)? outCipher_128[120:127]:
    outDecipher_128[120:127];     // i think decipher must start from round 11
    always@(posedge KEY ) begin
       
         if(round < 28) begin          //ternary operator to avoid first condition don't care (round ==0)
        
             round<=round+1;     
            end 
          
        end                 

   

    
endmodule
