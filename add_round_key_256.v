
module add_round_key_256(state,key,next_state);
    input [0:255] key;
    input [0:127] state;
    output [0:127] next_state;
    assign next_state =key^state;
endmodule
