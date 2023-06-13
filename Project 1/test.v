
module and_gate_test();
    reg A;
    reg B;
    
    wire O;
    and_gate uut(.A(A), .B(B), .O(O));
    
        initial begin
        A= 0; B= 0; #50;
        A= 1; B=0; #50;
        A= 0; B=1; #50;
        A= 1; B=1; #50;
        end
endmodule

module or_gate_test();
    reg A;
    reg B;
    
    wire O;
    or_gate uut(.A(A), .B(B), .O(O));
    
        initial begin
        A= 0; B= 0; #50;
        A= 1; B=0; #50;
        A= 0; B=1; #50;
        A= 1; B=1; #50;
        end
endmodule
module not_gate_test();
    reg A;
    
    wire O;
    not_gate uut(.A(A), .O(O));
    
        initial begin
        A= 0; #50;
        A= 1; #50;
       
        end
endmodule

module xor_gate_test();
    reg A;
    reg B;
    
    wire O;
    xor_gate uut(.A(A), .B(B), .O(O));
    
        initial begin
        A= 0; B= 0; #50;
        A= 1; B=0; #50;
        A= 0; B=1; #50;
        A= 1; B=1; #50;
        end
endmodule
module nand_gate_test();
    reg A;
    reg B;
    
    wire O;
    nand_gate uut(.A(A), .B(B), .O(O));
    
        initial begin
        A= 0; B= 0; #50;
        A= 1; B=0; #50;
        A= 0; B=1; #50;
        A= 1; B=1; #50;
        end
endmodule
module dec_test();
reg [2:0] in;

wire [7:0]out;
dec uut(.in(in), .out(out));

initial begin
in = 3'b000; #100;
in = 3'b001; #100;
in = 3'b010; #100;
in = 3'b011; #100;
in = 3'b100; # 100;
in = 3'b101; #100;
in = 3'b110; #100;
in = 3'b111; #100;
end
endmodule
module decoder3_to_8_test();
reg x;
    reg y;
    reg z;
    wire d0;
    wire d1;
    wire d2;
    wire d3;
    wire d4;
    wire d5;
    wire d6;
    wire d7;

decoder3_to_8 uut(.x(x), .y(y), .z(z), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7));

initial begin
x = 0;y = 0;z = 0;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
#100;x = 0;y = 0;z = 1;
#100;x = 0;y = 1;z = 0;
#100;x = 0;y = 1;z = 1;
#100;x = 1;y = 0;z = 0;
#100;x = 1;y = 0;z = 1;
#100;x = 1;y = 1;z = 0;
#100;x = 1;y = 1;z = 1;
end
endmodule

module half_adder_test();
reg  A;
reg  B;
wire Cout;
wire Out;

half_adder uut(.A(A), .B(B), .Cout(Cout), .Out(Out) );

initial begin
A= 0; B=0; #100;
A= 1; B=0; #100;
A= 0; B=1; #100;
A= 1; B=1; #100;
end
endmodule

module full_adder_1bit_test();
reg A;
reg B;
reg Cin;

wire Cout;
wire Out;

full_adder_1bit uut(.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Out(Out));

initial begin
A=0; B=0; Cin=0; #100;
A=0; B=0; Cin=1; #100;
A=0; B=1; Cin=0; #100;
A=0; B=1; Cin=1; #100;
A=1; B=0; Cin=0; #100;
A=1; B=0; Cin=1; #100;
A=1; B=1; Cin=0; #100;
A=1; B=1; Cin=1; #100;

end
endmodule

module full_adder_4bit_test();
reg [3:0]A;
reg [3:0]B;
reg Cin;

wire Cout;
wire [3:0]Out;
full_adder_4bit uut(.A(A), .B(B), .Cin(Cin),  .Out(Out), .Cout(Cout));

initial begin
A = 4'b0000; B=  4'b0000; Cin=0; #100;
A = 4'b1000; B=  4'b0001; Cin=0; #100;
A = 4'b0010; B=  4'b0111; Cin=0; #100;
A = 4'b0100; B=  4'b0101; Cin=0; #100;
A = 4'b1011; B=  4'b1010; Cin=0; #100;
A = 4'b1110; B=  4'b0101; Cin=0; #100;
A = 4'b1111; B=  4'b1001; Cin=0; #100;
A = 4'b0110; B=  4'b0011; Cin=0; #100;
A = 4'b1000; B=  4'b1100; Cin=0; #100;

end

endmodule
