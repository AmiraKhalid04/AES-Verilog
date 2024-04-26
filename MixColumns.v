module MixColumns(state_in, state_out);
input [127:0] state_in;
output [127:0] state_out;

function [7:0]mb_02;
  input [7:0] x;
  begin
    if(x[7] == 1) mb_02 = ((x << 1) ^ 8'h1b);
    else
        mb_02 = x << 1; 
  end
    
endfunction

function [7:0]mb_03;
    input[7:0] x;
    begin
    mb_03 = mb_02(x) ^ x;
    end
endfunction

genvar i;
  generate
for ( i=0 ; i<4 ; i = i+1 ) begin    
  assign state_out[(i*32)+:8] = mb_02(state_in[(i*32)+:8]) ^ state_in[(i * 32 + 8)+:8] ^ state_in[(i * 32 + 16)+:8] ^ mb_03(state_in[(i*32 + 24)+:8]);
  assign state_out[(i*32 + 8)+:8] = mb_03(state_in[(i*32)+:8]) ^ mb_02(state_in[(i*32 + 8)+:8]) ^ state_in[(i * 32 + 16)+:8] ^state_in[(i*32 + 24)+:8];
  assign state_out[(i*32 + 16)+:8] = state_in[(i*32)+:8] ^ mb_03(state_in[(i * 32 + 8)+:8]) ^ mb_02(state_in[(i * 32 + 16)+:8]) ^ state_in[(i*32 + 24)+:8];
  assign state_out[(i*32 + 24)+:8] = state_in[(i*32)+:8] ^ state_in[(i*32 + 8)+:8] ^ mb_03(state_in[(i*32 + 16)+:8]) ^ mb_02(state_in[(i * 32 + 24)+:8]);
end
  endgenerate
endmodule

