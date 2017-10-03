+`timescale 1ns/1ns
+
+module ULA32_TB;
  
+   logic clk;
+   logic [101:0] TestVector[10000:0];
+   logic [127:0] vectornum, errors;
+   logic [31:0] ExpectedResult;
+   logic [3:0] ExpectedFlags;
+
+//variáveis de entrada
+   logic [31:0] a;
+   logic [31:0] b;
+   logic [1:0] ALUcontrol;
+  
+//variáveis de saída
+   logic [31:0] Result;
+   logic [3:0] ALUflags;

+// instanciar devide under test - dut
+   ULA32 dut(
+	.a(a),
+	.b(b),
+	.ALUcontrol(ALUcontrol),
+	.Result(Result),
+	.ALUflags(ALUflags)
+   );
+
+//mostrar no transcript
    initial begin
 	$display("\t\ta,\tb,\tALUcontrol,\tResult,\tALUflags");
 	$monitor("%b,\t%b,\t%b,\t%b, \t%b", a, b, ALUcontrol, Result, ALUflags); 
+
+   end
  
  
+//clock
+   always begin 
+	clk = 1; #5; clk = 0; #5;
    end
  
+//leitura de vetores do arquivo texto; valores iniciais
+   initial begin 
+	$readmemb("TBVectors", TestVector);
+	vectornum = 0; errors = 0;
+   end
+
+//subida do clock
+   always @(posedge clk) begin
+	{a, b, ALUcontrol, ExpectedResult, ExpectedFlags} = TestVector[vectornum]; #10;
+   end
+
+//descida do clock
+   always @(negedge clk) begin
+	$display("Saídas erradas para as entradas informadas %b,ou %b!=%b e/ou %b!=%b", {a, b, ALUcontrol}, ExpectedResult, Result, ExpectedFlags, ALUFlags);
+   	errors = errors +1;
+   end
+
+endmodule 
