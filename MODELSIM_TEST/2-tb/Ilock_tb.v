module Ilock_tb();
    reg        i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1; //Feedbacks
    reg        i_A, i_B, i_C, i_D, i_E, i_F, i_G, i_H; //Current Inputs
    reg        o_A_expected, o_B_expected, o_C_expected, o_D_expected,o_E_expected, o_F_expected,o_G_expected, o_H_expected; //Expected Outputs
    wire       o_A, o_B, o_C, o_D, o_E, o_F, o_G, o_H; // Circuit outputs
    reg        clk;                                                 
    reg [7:0]  vectornum_A, vectornum_B, vectornum_C, vectornum_D,vectornum_E, vectornum_F,vectornum_G, vectornum_H, 
               errors_A, errors_B, errors_C, errors_D, errors_E, errors_F, errors_G, errors_H; // Bookkeeping variables
    reg [8:0]  testvectors_A[256:0], testvectors_B[256:0], testvectors_C[256:0], testvectors_D[256:0], testvectors_E[256:0], testvectors_F[256:0], testvectors_G[256:0], testvectors_H[256:0]; // Test vectors 

    // Instances
    InterlockA dut_A(i_A, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A);
    InterlockB dut_B(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_B);
    InterlockC dut_C(i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1, o_C);
    InterlockC dut_D(i_A1, i_B1, i_C1, i_D, i_E1, i_F1, i_G1, i_H1, o_D);
    InterlockD dut_E(i_A1, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1, o_E);

    InterlockF dut_F(i_A1, i_B1, i_C1, i_D1, i_E1, i_F, i_G1, i_H1, o_F);
    InterlockG dut_G(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G, i_H1, o_G);
    InterlockH dut_H(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H, o_H);

    // Generate clock with period #10
    always begin
        clk = 1; #5; clk=0; #5;
    end

    // Load vectors for InterlockA and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockA.tv", testvectors_A); // Path relative to the modelsim project
        vectornum_A = 0; errors_A = 0;
    end

    // Load vectors for InterlockB and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockB.tv", testvectors_B); // Path relative to the modelsim project
        vectornum_B = 0; errors_B = 0;
    end

    // Load vectors for InterlockC and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockC.tv", testvectors_C); // Path relative to the modelsim project
        vectornum_C = 0; errors_C = 0;
    end

    // Load vectors for InterlockD and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockD.tv", testvectors_D); // Path relative to the modelsim project
        vectornum_D = 0; errors_D = 0;
    end
    // Load vectors for InterlockE and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockE.tv", testvectors_E); // Path relative to the modelsim project
        vectornum_E = 0; errors_E = 0;
    end

    // Load vectors for InterlockF and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockF.tv", testvectors_F); // Path relative to the modelsim project
        vectornum_F = 0; errors_F = 0;
    end

    // Load vectors for InterlockG and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockG.tv", testvectors_G); // Path relative to the modelsim project
        vectornum_G = 0; errors_G = 0;
    end
    // Load vectors for InterlockH and initialize bookkeeping variables
    initial begin
        $readmemb("../2-tb/InterlockH.tv", testvectors_H); // Path relative to the modelsim project
        vectornum_H = 0; errors_H = 0;
    end

    // Apply test vectors on rising edge for InterlockA
    always @(posedge clk) begin
        {i_A, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A_expected} = testvectors_A[vectornum_A];
        {i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_B_expected} = testvectors_B[vectornum_B];
        {i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1, o_C_expected} = testvectors_C[vectornum_C];
        {i_A1, i_B1, i_C1, i_D, i_E1, i_F1, i_G1, i_H1, o_D_expected} = testvectors_D[vectornum_D];
        {i_A, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1, o_E_expected} = testvectors_E[vectornum_E];

        {i_A1, i_B1, i_C1, i_D1, i_E1, i_F, i_G1, i_H1, o_F_expected} = testvectors_F[vectornum_F];
        {i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G, i_H1, o_G_expected} = testvectors_G[vectornum_G];
        {i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G, i_H1, o_H_expected} = testvectors_H[vectornum_H];
    end

    // Check results on falling edge for InterlockA
    always @(negedge clk) begin
        if (o_A !== o_A_expected) begin
            $display("InterlockA Error: inputs=%b", {i_A, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_A, o_A_expected);
            errors_A = errors_A + 1;
        end
        vectornum_A = vectornum_A + 1;
        if (testvectors_A[vectornum_A] === 9'bxxxxxxxxx) begin
            $display("InterlockA: %3d tests completed with %2d errors", vectornum_A, errors_A);
            $finish;
        end
    end

    // Check results on falling edge for InterlockB
    always @(negedge clk) begin
        if (o_B !== o_B_expected) begin
            $display("InterlockB Error: inputs=%b", {i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_B, o_B_expected);
            errors_B = errors_B + 1;
        end
        vectornum_B = vectornum_B + 1;
        if (testvectors_B[vectornum_B] === 9'bxxxxxxxxx) begin
            $display("InterlockB: %3d tests completed with %2d errors", vectornum_B, errors_B);
            $finish;
        end
    end

    // Check results on falling edge for InterlockC
    always @(negedge clk) begin
        if (o_C !== o_C_expected) begin
            $display("InterlockC Error: inputs=%b", {i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_C, o_C_expected);
            errors_C = errors_C + 1;
        end
        vectornum_C = vectornum_C + 1;
        if (testvectors_C[vectornum_C] === 9'bxxxxxxxxx) begin
            $display("InterlockC: %3d tests completed with %2d errors", vectornum_C, errors_C);
            $finish;
        end
    end

    // Check results on falling edge for InterlockD
    always @(negedge clk) begin
        if (o_D !== o_D_expected) begin
            $display("InterlockD Error: inputs=%b", {i_A1, i_B1, i_C1, i_D, i_E1, i_F1, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_D, o_D_expected);
            errors_A = errors_A + 1;
        end
        vectornum_D = vectornum_D + 1;
        if (testvectors_D[vectornum_D] === 9'bxxxxxxxxx) begin
            $display("InterlockD: %3d tests completed with %2d errors", vectornum_D, errors_D);
            $finish;
        end
    end

    // Check results on falling edge for InterlockE
    always @(negedge clk) begin
        if (o_E !== o_E_expected) begin
            $display("InterlockE Error: inputs=%b", {i_A1, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_E, o_E_expected);
            errors_E = errors_E + 1;
        end
        vectornum_E = vectornum_E + 1;
        if (testvectors_E[vectornum_E] === 9'bxxxxxxxxx) begin
            $display("InterlockE: %3d tests completed with %2d errors", vectornum_E, errors_E);
            $finish;
        end
    end

    // Check results on falling edge for InterlockF
    always @(negedge clk) begin
        if (o_F !== o_F_expected) begin
            $display("InterlockF Error: inputs=%b", {i_A1, i_B1, i_C1, i_D1, i_E1, i_F, i_G1, i_H1});
            $display(" outputs=%b (%b expected)", o_F, o_F_expected);
            errors_F = errors_F + 1;
        end
        vectornum_F = vectornum_F + 1;
        if (testvectors_F[vectornum_F] === 9'bxxxxxxxxx) begin
            $display("InterlockF: %3d tests completed with %2d errors", vectornum_F, errors_F);
            $finish;
        end
    end

    // Check results on falling edge for InterlockG
    always @(negedge clk) begin
        if (o_G !== o_G_expected) begin
            $display("InterlockG Error: inputs=%b", {i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G, i_H1});
            $display(" outputs=%b (%b expected)", o_G, o_G_expected);
            errors_G = errors_G + 1;
        end
        vectornum_G = vectornum_G + 1;
        if (testvectors_G[vectornum_G] === 9'bxxxxxxxxx) begin
            $display("InterlockG: %3d tests completed with %2d errors", vectornum_G, errors_G);
            $finish;
        end
    end

    // Check results on falling edge for InterlockH
    always @(negedge clk) begin
        if (o_H !== o_H_expected) begin
            $display("InterlockH Error: inputs=%b", {i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H});
            $display(" outputs=%b (%b expected)", o_H, o_H_expected);
            errors_H = errors_H + 1;
        end
        vectornum_H = vectornum_H + 1;
        if (testvectors_H[vectornum_H] === 9'bxxxxxxxxx) begin
            $display("InterlockH: %3d tests completed with %2d errors", vectornum_H, errors_H);
            $finish;
        end
    end
        
    // Print out in transcript window
    initial begin
        $monitor("Time=%3dns, i_A1=%b, i_B1=%b, i_C1=%b, i_D1=%b, i_E1=%b, i_F1=%b, i_G1=%b, i_H1=%b, o_A=%b, o_B=%b, o_C=%b, o_D=%b, o_E=%b, o_F=%b, o_G=%b, o_H=%b", $time, i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A, o_B, o_C, o_D, o_E, o_F, o_G, o_H);
    end
endmodule
