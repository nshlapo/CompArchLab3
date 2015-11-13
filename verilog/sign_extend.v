module signExt
    #(parameter width = 32)
    (input [15:0] immediate,
     output [width-1:0] extended);


    assign extended = {{(width-16){immediate[15]}}, immediate};
endmodule
