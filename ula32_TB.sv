`timescale 1ns/1ns

module ULA32_TB;

   logic clk;
   logic [101:0] TestVector[10000:0];
	logic [127:0] vectornum;
   logic [31:0] ExpectedResult;
   logic [3:0] ExpectedFlags;

//variáveis de entrada
   logic [31:0] a;
   logic [31:0] b;
   logic [1:0] ALUcontrol;
  
//variáveis de saída
   logic [31:0] Result;
   logic [3:0] ALUflags;
   
// instanciar devide under test - dut
   ula32 dut(
	.a(a),
	.b(b),
	.ALUcontrol(ALUcontrol),
	.Result(Result),
	.ALUflags(ALUflags)
	);
   

   initial begin 
	$dumpfile ("ULA32.vcd");
	$dumpvars;
   end

//mostrar no transcript
   initial begin
	$display("\t\ta,\tb,\tALUcontrol,\tResult,\tALUflags");
	$monitor("%b,\t%b,\t%b,\t%b, \t%b", a, b, ALUcontrol, Result, ALUflags); 

   end

//clock
   always begin 
	clk = 1; #5; clk = 0; #5;
   end

//leitura de vetores do arquivo texto; valor inicial
   initial begin 
	$readmemb("TBVectors", TestVector);
	vectornum = 0; 
   end

//subida do clock
   always @(posedge clk) begin
	{a, b, ALUcontrol, ExpectedResult, ExpectedFlags} = TestVector[vectornum]; #10;
   end

//descida do clock
   always @(negedge clk) begin
	if (ExpectedResult !== Result | ExpectedFlags !== ALUflags) begin // checando os resultados
		$display("Saídas erradas para as entradas informadas %b,ou %b!=%b e/ou %b!=%b", {a, b, ALUcontrol}, ExpectedResult, Result, ExpectedFlags, ALUflags);
	end
	vectornum = vectornum +1;
   end

endmodule 
