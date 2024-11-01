module imem(input  logic [31:0] a,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  initial
      //$readmemh("riscvtest.txt",RAM);
      //$readmemh("blt_test.txt",RAM);
      //$readmemh("SRA_negTest.txt",RAM);
      //$readmemh("SRA_posTest.txt", RAM);
      $readmemh("BLT_SRA_TEST.txt",RAM);

  assign rd = RAM[a[31:2]]; // word aligned
endmodule