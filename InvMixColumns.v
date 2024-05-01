module InvMixColumns (state_in, state_out);
input[0:127] state_in;
output[0:127] state_out;


function [7:0] mb2Reapeted;
input[7:0] in;
input integer n;
integer i;
begin
  for (i = 0 ; i<n ; i=i+1) begin
    if(in[7] == 1) in = ((in << 1) ^ 8'h1b);
    else in = in << 1; 
  end
  mb2Reapeted = in;
end
endfunction
function [7:0]mb_09;
    input[7:0] in;
    mb_09 = mb2Reapeted(in, 3) ^ in;
endfunction

function [7:0]mb_0b;
    input[7:0] in;
    mb_0b = mb2Reapeted(in, 3) ^ mb2Reapeted(in, 1)^ in;
endfunction

function [7:0]mb_0d;
    input[7:0] in;
    mb_0d =  mb2Reapeted(in, 3) ^ mb2Reapeted(in, 2) ^ in;
endfunction

function [7:0]mb_0e;
    input[7:0] in;
    mb_0e = mb2Reapeted(in, 3) ^ mb2Reapeted(in, 2)^ mb2Reapeted(in, 1);
endfunction

genvar i;
  generate
for ( i=0 ; i<4 ; i = i+1 ) begin :InvMx_loop
      assign state_out[(i*32)+:8] = mb_0e(state_in[(i*32)+:8]) ^ mb_0b(state_in[(i*32 + 8)+:8]) ^ mb_0d(state_in[(i*32 + 16)+:8]) ^ mb_09(state_in[(i*32 + 24)+:8]);
  assign state_out[(i*32 + 8)+:8] = mb_09(state_in[(i*32)+:8]) ^ mb_0e(state_in[(i*32 + 8)+:8]) ^ mb_0b(state_in[(i*32 + 16)+:8]) ^ mb_0d(state_in[(i*32 + 24)+:8]);
  assign state_out[(i*32 + 16)+:8] = mb_0d(state_in[(i*32)+:8]) ^ mb_09(state_in[(i*32 + 8)+:8]) ^ mb_0e(state_in[(i*32 + 16)+:8]) ^ mb_0b(state_in[(i*32 + 24)+:8]);
  assign state_out[(i*32 + 24)+:8] = mb_0b(state_in[(i*32)+:8]) ^ mb_0d(state_in[(i*32 + 8)+:8]) ^ mb_09(state_in[(i*32 + 16)+:8]) ^ mb_0e(state_in[(i*32 + 24)+:8]);
end
  endgenerate

endmodule