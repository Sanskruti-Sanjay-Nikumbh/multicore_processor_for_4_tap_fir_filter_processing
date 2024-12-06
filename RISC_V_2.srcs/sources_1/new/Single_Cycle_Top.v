module Single_Cycle_Top(clk,rst,core_id,ALURes,multi_instr);

    input clk,rst;
    input [1:0]core_id;
    input [31:0]multi_instr ;
    output [31:0] ALURes;
    
    wire [31:0] PC_Top,RD1_Top,RD_Instr,Imm_Ext_Top,ReadData,PCPlus4,RD2_Top,SrcB,Result,ALUResult;
    wire RegWrite,MemWrite,ALUSrc,ResultSrc;
    wire [1:0]ImmSrc;
    wire [2:0]ALUControl_Top; 
   

    PC_Module PC(
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_Next(PCPlus4)
    );

    PC_Adder PC_Adder(
                    .a(PC_Top),
                    .b(32'd4),
                    .c(PCPlus4)
    );
    
    Instruction_Memory Instruction_Memory(
                            .rst(rst),
                            .A(PC_Top),
                            .RD(RD_Instr),
                            .multi_instr(multi_instr)
    );
     
  wire [4:0] a3rf = multi_instr[11:7];
  wire [4:0] a2rf = multi_instr[24:20];
  wire [4:0] a1rf = multi_instr[19:15];
   
    Register_File Register_File(
                            .clk(clk),
                            .rst(rst),
                            .WE3(RegWrite),
                            .WD3(Result),
                            .A1(a1rf),
                            
                            .A2(a2rf),
                            .A3(a3rf),

                            .RD1(RD1_Top),
                            .RD2(RD2_Top)
    );

    Sign_Extend Sign_Extend(
                        .In(RD_Instr),
                        .ImmSrc(ImmSrc[0]),
                        .Imm_Ext(Imm_Ext_Top)
    );

    Mux Mux_Register_to_ALU(
                            .a(RD2_Top),
                            .b(Imm_Ext_Top),
                            .s(ALUSrc),
                            .c(SrcB)
    );

    ALU ALU(
            .A(RD1_Top),
            .B(SrcB),
            .Result(ALUResult),
            .ALUControl(ALUControl_Top),
            .OverFlow(),
            .Carry(),
            .Zero(),
            .Negative()
    );
    
    assign ALURes = ALUResult;
    wire [2:0]f3 = multi_instr[14:12];
    wire [6:0]f7 = multi_instr[31:25];
    
    Control_Unit_Top Control_Unit_Top(
                            .Op(multi_instr[6:0]),
                            .RegWrite(RegWrite),
                            .ImmSrc(ImmSrc),
                            .ALUSrc(ALUSrc),
                            .MemWrite(MemWrite),
                            .ResultSrc(ResultSrc),
                            .Branch(),
                            .funct3(f3),
                            .funct7(f7),
                            .ALUControl(ALUControl_Top)
    );

    Data_Memory Data_Memory(
                        .clk(clk),
                        .rst(rst),
                        .WE(MemWrite),
                        .WD(RD2_Top),
                        .A(ALUResult),
                        .RD(ReadData)
    );

    Mux Mux_DataMemory_to_Register(
                            .a(ALUResult),
                            .b(ReadData),
                            .s(ResultSrc),
                            .c(Result)
    );

endmodule