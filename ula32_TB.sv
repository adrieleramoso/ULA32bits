+`timescale 1ns/1ns
+
+module ULA32_TB;
+
+//variáveis de entrada
+   logic [31:0] a;
+   logic [31:0] b;
+   logic [1:0] ALUcontrol;
+  
+//variáveis de saída
+   logic [31:0] Result;
+   logic [3:0] ALUflags;
+   logic neg;
+   logic carry;
+   logic zero;
+   logic overflow;
+
+   ULA32 dut(
+	.a(a),
+	.b(b),
+	.ALUcontrol(ALUcontrol),
+	.Result(Result),
+	.ALUflags(ALUflags),
+	.neg(neg),
+	.carry(carry),
+	.zero(zero),
+	.overflow(overflow)
+   );
+
+   always
+	begin
+		
+
+
+	end
+
+
+endmodule 
