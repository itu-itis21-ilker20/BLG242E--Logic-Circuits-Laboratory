module three_state_buffer(A, enable, out);
input wire [7:0] A;
input wire enable;

output wire [7:0] out;

assign out= (enable) ? A : 8'bZZZZZZZZ; 
endmodule

module part_1(data1, data2, select, out);
input wire [7:0] data1;
input wire [7:0] data2;
input wire select;
output wire [7:0] out;

wire o1;
wire o2;

three_state_buffer B1(.A(data1), .enable(~select), .out(out) );
three_state_buffer B2(.A(data2), .enable(select), .out(out) );

endmodule

module part_2(data1, data2, select, out1, out2);
input wire [7:0] data1;
input wire [7:0] data2;
input wire select;
output wire [7:0] out1;
output wire [7:0] out2;

wire [7:0] second_in;

three_state_buffer B1(.A(data1), .enable(~select), .out(second_in) );
three_state_buffer B2(.A(data2), .enable(select), .out(second_in) );

three_state_buffer B3(.A(second_in), .enable(~select), .out(out1) );
three_state_buffer B4(.A(second_in), .enable(select), .out(out2) );


endmodule

module part3_memory( in,clk, reset, line_select, read_enable, write_enable, out);
input wire [7:0] in;
input wire clk; 
input wire reset; 
input wire line_select;
input wire read_enable;
input wire write_enable;
output reg [7:0] out;

    reg [7:0] stored_data;
    always @(posedge clk) begin
        if(write_enable==1 & line_select==1)
            stored_data=in;
    end
    
    always @(negedge reset) begin
        stored_data=8'b0;
    end
    
    always @(*) begin
        if(read_enable==1 & line_select==1)
            out = stored_data;
        else
            out = 8'bZ;
    end
    
endmodule