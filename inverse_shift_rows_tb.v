module inverse_shift_rows_tb;
  reg [0:127] in;
  wire [0:127] out;
  inverse_shift_rows test(in, out);

  initial begin 
    $monitor("[monitor] in = %h, out = %h", in, out);
    // Round 1
    in <= 128'hbdb52189f261b63d0b107c9e8b6e776e;

    // Round 2
    #10;
    in <= 128'hfde596f1054737d235febad7f1e3d04e;

    // Round 3
    #10;
    in <= 128'hd1c4941f7955f40fb46f6c0ad68730ad;

    // Round 4
    #10;
    in <= 128'hc65e395df779cf09ccf9e1c3842fed5d;

    // Round 5
    #10;
    in <= 128'hc87a79969b0219bc2526773bb016c992;

    // Round 6
    #10;
    in <= 128'h2466756c69d25b236e4240fa8872b332;

    // Round 7 
    #10;
    in <= 128'hfab38a1725664d2840246ac957633931;

    // Round 8
    #10;
    in <= 128'h49e594f755ca638fda0a59a01f15d7fa;

    // Round 9
    #10;
    in <= 128'h5411f4b56bd9700e96a0902fa1bb9aa1;
  end
endmodule