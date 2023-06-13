`timescale 1ns / 1ps
// Zeynep Deniz Gündoðan 040190382
//Fatmagül Ýlker 150200088
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 13:18:41
// Design Name: 
// Module Name: Modules
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and_gate(A, B, O  );
input wire A;
input wire B;
output wire O;

assign O = A & B;
endmodule

module or_gate(A, B, O);
input wire A;
input wire B;
output wire O;

assign O = A | B;
endmodule

module or_gate_3in(A, B, C,O);
input wire A;
input wire B;
input wire C;
output wire O;

assign O = A | B | C;
endmodule

module and_gate_3in(A, B, C,O);
input wire A;
input wire B;
input wire C;
output wire O;

assign O = A & B & C;
endmodule

module not_gate(A, O);
input wire A;
output wire O;

assign O = ~A;
endmodule

module xor_gate(A, B, O);
input wire A;
input wire B;
output wire O;
wire O1;
wire O2;
wire Bn;
wire An;
not_gate NOT(.A(B), .O(Bn));
not_gate NOT2(.A(A), .O(An));
and_gate AND(.A(A), .B(Bn), .O(O1));
and_gate AND1(.A(An), .B(B), .O(O2));

or_gate OR(.A(O1), .B(O2), .O(O));

endmodule

module nand_gate(A, B, O);
input wire A;
input wire B;
output wire O;

wire AB;

and_gate AND(.A(A), .B(B), .O(AB)  );
not_gate NOT(.A(AB), .O(O));
endmodule

module mux(in, out, sel);

input wire [7:0]in;
input wire [2:0]sel;
output wire out;


endmodule

module dec(in, out);

output wire [7:0]out;
input wire [2:0]in;

reg [7:0]out;

always@*
    begin
        case(in)
        3'b000: out=8'b00000001;
        3'b001: out=8'b00000010;
        3'b010: out=8'b00000100;
        3'b011: out=8'b00001000;
        3'b100: out=8'b00010000;
        3'b101: out=8'b00100000;
        3'b110: out=8'b01000000;
        3'b111: out=8'b10000000;
        endcase
    end
endmodule

module decoder3_to_8(
    input x,
    input y,
    input z,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7
    );
and (d0,xn,yn,zn),(d1,xn,yn,z),(d2,xn,y,zn),(d3,xn,y,z),(d4,x,yn,zn),(d5,x,yn,z),(d6,x,y,zn),(d7,x,y,z);
not (xn,x),(yn,y),(zn,z);
endmodule

module d_circuit(A, B, C, D, O);
input wire A;
input wire B;
input wire C;
input wire D;
wire notb;
wire notd;
wire nota;
wire and1;
wire and2;
wire and3;
and_gate_3in AND1(.A(A), .B(C),C(D) .O(and1));

output wire O;

assign O = ~A;
endmodule

module half_adder(A, B, Cout, Out);
input wire A;
input wire B;
output wire Cout;
output wire Out;

xor_gate XOR(.A(A), .B(B), .O(Out));
and_gate AND(.A(A), .B(B), .O(Cout));
endmodule

module full_adder_1bit(A, B, Cin, Cout, Out);
input wire A;
input wire B;
input wire Cin;
output wire Cout;
output wire Out;
wire AB;
wire Cout1;
wire Cout2;
half_adder HA1(.A(A), .B(B), .Cout(Cout1), .Out(AB));
half_adder HA2(.A(AB), .B(Cin), .Cout(Cout2), .Out(Out));
or_gate OR(.A(Cout1), .B(Cout2), .O(Cout));

endmodule

module full_adder_4bit(A, B, Cin, Out, Cout);
input wire [3:0]A;
input wire [3:0]B;
input wire Cin;
output wire [3:0]Out;
output wire Cout;
wire Cout1;
wire Cout2;
wire Cout3;

full_adder_1bit FA1(.A(A[0]), .B(B[0]), .Cin(Cin), .Cout(Cout1), .Out(Out[0]));
full_adder_1bit FA2(.A(A[1]), .B(B[1]), .Cin(Cout1), .Cout(Cout2), .Out(Out[1]));
full_adder_1bit FA3(.A(A[2]), .B(B[2]), .Cin(Cout2), .Cout(Cout3), .Out(Out[2]));
full_adder_1bit FA4(.A(A[3]), .B(B[3]), .Cin(Cout3), .Cout(Cout), .Out(Out[3]));

endmodule

module full_adder_8bit(A, B, Cin, Out, Cout);
input wire [7:0]A;
input wire [7:0]B;
input wire Cin;
output wire [7:0]Out;
output wire Cout;
wire Cout1;
wire Cout2;
wire Cout3;
wire Cout4;
wire Cout5;
wire Cout6;
wire Cout7;

full_adder_1bit FA1(.A(A[0]), .B(B[0]), .Cin(Cin), .Cout(Cout1), .Out(Out[0]));
full_adder_1bit FA2(.A(A[1]), .B(B[1]), .Cin(Cout1), .Cout(Cout2), .Out(Out[1]));
full_adder_1bit FA3(.A(A[2]), .B(B[2]), .Cin(Cout2), .Cout(Cout3), .Out(Out[2]));
full_adder_1bit FA4(.A(A[3]), .B(B[3]), .Cin(Cout3), .Cout(Cout4), .Out(Out[3]));
full_adder_1bit FA5(.A(A[4]), .B(B[4]), .Cin(Cout4), .Cout(Cout5), .Out(Out[4]));
full_adder_1bit FA6(.A(A[5]), .B(B[5]), .Cin(Cout5), .Cout(Cout6), .Out(Out[5]));
full_adder_1bit FA7(.A(A[6]), .B(B[6]), .Cin(Cout6), .Cout(Cout7), .Out(Out[6]));
full_adder_1bit FA8(.A(A[7]), .B(B[7]), .Cin(Cout7), .Cout(Cout), .Out(Out[7]));

endmodule

module adder_subtractor_16bit(A, B, Cin, Out, Cout);
input wire [15:0]A;
input wire [15:0]B;
input wire Cin;
output wire [15:0]Out;
output wire Cout;
wire Cout1;
wire C1[7:0];                        
wire C2[7:0];

xor_gate XOR1(.A(B[0]), .B(Cin), .O(C1[0]));
xor_gate XOR2(.A(B[1]), .B(Cin), .O(C1[1]));
xor_gate XOR3(.A(B[2]), .B(Cin), .O(C1[2]));
xor_gate XOR4(.A(B[3]), .B(Cin), .O(C1[3]));
xor_gate XOR5(.A(B[4]), .B(Cin), .O(C1[4]));
xor_gate XOR6(.A(B[5]), .B(Cin), .O(C1[5]));
xor_gate XOR7(.A(B[6]), .B(Cin), .O(C1[6]));
xor_gate XOR8(.A(B[7]), .B(Cin), .O(C1[7]));
xor_gate XOR9(.A(B[8]), .B(Cin), .O(C1[8]));
xor_gate XOR10(.A(B[9]), .B(Cin), .O(C1[9]));
xor_gate XOR11(.A(B[10]), .B(Cin), .O(C1[10]));
xor_gate XOR12(.A(B[11]), .B(Cin), .O(C1[11]));
xor_gate XOR13(.A(B[12]), .B(Cin), .O(C1[12]));
xor_gate XOR14(.A(B[13]), .B(Cin), .O(C1[13]));
xor_gate XOR15(.A(B[14]), .B(Cin), .O(C1[14]));
xor_gate XOR16(.A(B[15]), .B(Cin), .O(C1[15]));
full_adder_8bit FA1(.A(A[7:0]), .B(B[7:0]), .Cin(Cin), .Cout(Cout1), .Out(Out[7:0]));
full_adder_8bit F21(.A(A[15:7]), .B(B[15:7]), .Cin(Cout1), .Cout(Cout), .Out(Out[15:7]));



endmodule

module b_minus_2a(A, B, Out, Cout);
input wire [15:0]A;
input wire [15:0]B;
output wire [15:0]Out;
output wire Cout;
wire Out1[15:0];
wire Cout1;


adder_subtractor_16bit AS1(.A(B), .B(A), .Cin(1), .Cout(Cout1), .Out(Out1));
adder_subtractor_16bit AS2(.A(Out1), .B(A), .Cin(1), .Cout(Cout), .Out(Out));


endmodule