module add_round_key(state,key,next_state);
    input [0:127] key;
    input [0:127] state;
    output [0:127] next_state;
    assign next_state =key^state;
endmodule