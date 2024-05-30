module inverse_shift_rows (
	input [0:127] state_in,
	output [0:127] state_out);

  // First row is not shifted
  assign state_out[0:7] = state_in[0:7];
  assign state_out[32:39] = state_in[32:39];
  assign state_out[64:71] = state_in[64:71];
  assign state_out[96:103] = state_in[96:103];
  
  // Second row is shifted cyclically to the right by 1
  assign state_out[8:15] = state_in[104:111];
  assign state_out[40:47] = state_in[8:15];
  assign state_out[72:79] = state_in[40:47];
  assign state_out[104:111] = state_in[72:79];
  
  // Third row is shifted cyclically to the right by 2
  assign state_out[16:23] = state_in[80:87];
  assign state_out[48:55] = state_in[112:119];
  assign state_out[80:87] = state_in[16:23];
  assign state_out[112:119] = state_in[48:55];
  
  // Fourth row is shifted cyclically to the right by 3
  assign state_out[24:31] = state_in[56:63];
  assign state_out[56:63] = state_in[88:95];
  assign state_out[88:95] = state_in[120:127];
  assign state_out[120:127] = state_in[24:31];

endmodule
