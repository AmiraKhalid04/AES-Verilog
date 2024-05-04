module add_round_key_192(state,key,next_state);
    input [0:191] key;
    input [0:127] state;
    output [0:127] next_state;
    assign next_state =key^state;
endmodule
