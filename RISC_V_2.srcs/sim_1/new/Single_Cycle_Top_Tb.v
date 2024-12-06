module Single_Cycle_Top_Tb ();
    
    reg clk=1'b01,rst;
    
    reg clk,rst;
    reg [1:0]a,b,c,d;
    reg [31:0]core1_result,core2_result,core3_result,core4_result;
    wire [31:0] final_result,w,x,y,z;
    
//    Single_Cycle_Top Single_Cycle_Top(
//                                .clk(clk),
//                                .rst(rst)
//    );
    //, .b(b) , .c(c) , .d(d)
   multicore DUT (.clk(clk),.rst(rst), .a(a), .b(b) , .c(c) , .d(d)  ,.w(w),.x(x),.y(y),.z(z),
                 .final_result(final_result));

   
    always 
    begin
        clk = ~ clk;
        #100;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #100;
        
//        rst <=1'b1;
//        #900;
//        a=2'b00;
//        #100;
//        b=2'b01;
//        #100;
//        c=2'b10;
//        #100;
//        d=2'b11;
//        #100;
        rst=1'b1;
        a = 2'b00;   
        b = 2'b01;
        c = 2'b10;
        d = 2'b11;
        #100;        
        $finish;
    end
endmodule