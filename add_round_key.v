module add_round_key(
  input [0:127] state,
  input [0:127] key,
  output [0:127] next_state);
    assign next_state = key^state;
endmodule