module multicore(clk,rst,a,b,c,d,w,x,y,z,final_result);
    
    input clk,rst;
    input [1:0]a,b,c,d;
    wire [31:0]core1_result,core2_result;
    wire [31:0]core3_result,core4_result;
    output [31:0] final_result;
    output reg [31:0] w,x,y,z;
    
    reg [31:0] mem [1023:0];
    
    Single_Cycle_Top CPU_1(.clk(clk), .rst(rst), .core_id(a), .multi_instr(w), .ALURes(core1_result));
    Single_Cycle_Top CPU_2(.clk(clk), .rst(rst), .core_id(b), .multi_instr(x), .ALURes(core2_result));
    Single_Cycle_Top CPU_3(.clk(clk), .rst(rst), .core_id(c), .multi_instr(y), .ALURes(core3_result));
    Single_Cycle_Top CPU_4(.clk(clk), .rst(rst), .core_id(d), .multi_instr(z), .ALURes(core4_result));
    

//    always @(*) begin
//    if (a == 2'b00)
//        multi_instr = 32'h0092F6B3;
//    else if (b == 2'b01)
//        multi_instr = 32'h00837633;
//    else if (c == 2'b10)
//        multi_instr = 32'h0021F5B3;
//    else if (d == 2'b11)
//        multi_instr = 32'h00727533;
//    else
//        multi_instr = 32'h00000000;
//end

     always @(*) begin
    case (a)
        2'b00: w = 32'h0092F6B3;  // Instruction for core 1
        2'b01: w = 32'h00837633;  // Optional different instruction
        2'b10: w = 32'h0021F5B3;  // Optional different instruction
        2'b11: w = 32'h00727533;  // Optional different instruction
        default: w = 32'h00000000;
    endcase

    case (b)
        2'b00: x = 32'h0092F6B3;  // Instruction for core 2
        2'b01: x = 32'h00837633;  
        2'b10: x = 32'h0021F5B3;  
        2'b11: x = 32'h00727533;  
        default: x = 32'h00000000;
    endcase

    case (c)
        2'b00: y = 32'h0092F6B3;  // Instruction for core 3
        2'b01: y = 32'h00837633;  
        2'b10: y = 32'h0021F5B3;  
        2'b11: y = 32'h00727533;  
        default: y = 32'h00000000;
    endcase

    case (d)
        2'b00: z = 32'h0092F6B3;  // Instruction for core 4
        2'b01: z = 32'h00837633;  
        2'b10: z = 32'h0021F5B3;  
        2'b11: z = 32'h00727533;  
        default: z = 32'h00000000;
    endcase
end


    
    assign final_result = core1_result + core2_result + core3_result + core4_result;
    
endmodule   