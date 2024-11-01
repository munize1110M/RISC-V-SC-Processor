module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] WriteData, DataAdr;
  logic        MemWrite;

  // instantiate device to be tested
  top dut(clk, reset, WriteData, DataAdr, MemWrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  always @(negedge clk)
    begin
      if(MemWrite) begin
        if(DataAdr === 100 & WriteData === 25) begin
          $display("Simulation succeeded");
          $stop;
        end/* else if (DataAdr !== 96) begin
          $display("Simulation failed");
          $stop;*/
        //This test case bellow is to verify that the SRA works with a pos input
        /*end else if (DataAdr === 80 & WriteData === 1) begin
          $display("Simulation succeeded: SRA instruction functions");
          $stop;
        end*/  
        //This test case below is to verify that the SRA works with a neg input
        else if (DataAdr ===80 & WriteData === 32'hFFFFFFFB) begin

                $display("SRA functions");
                

        end
        else if (DataAdr === 100 & WriteData === 32'h0000000E) begin
                $display("Simulation Succeded: BLT Functions");
                $stop;
        end
        //This is to verify blt using blt_test.txt
        /*else if (DataAdr === 96 & WriteData === 10) begin
          $display("wrote to 96");
          $stop;
        end*/
      end
    end
endmodule