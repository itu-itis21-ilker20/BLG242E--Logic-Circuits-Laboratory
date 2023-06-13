
module part_1_test();
reg [7:0] A;
reg [7:0] B;
reg sel;
wire [7:0] O;

part_1 uut(.data1(A), .data2(B),  .select(sel), .out(O));

initial begin
        A=8'b10101110; B=8'b11111001; sel=1; #300;
        A=8'b10101110; B=8'b11111001; sel=0; #300;
        A=8'b11111111; B=8'b11111001; sel=0; #300;
end
endmodule

module part_2_test();
reg [7:0] A;
reg [7:0] B;
reg sel;
wire [7:0] O1;
wire [7:0] O2;

part_2 uut(.data1(A), .data2(B),  .select(sel), .out(O1), .out2(O2));

initial begin
        A=8'b10101110; B=8'b11111001; sel=1; #125;
        A=8'b10101110; B=8'b11111001; sel=0; #125;
end
endmodule



