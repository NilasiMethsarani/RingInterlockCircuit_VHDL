module Interlock_tb();
    reg        i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1; //Feedbacks
    reg        i_A, i_B, i_C; //Current Inputs
    reg        o_A_expected, o_B_expected, o_C_expected; //Expected Outputs
    wire       o_A, o_B, o_C; // Circuit outputs
    reg        clk;                                                 
    reg [7:0]  vectornum_A, vectornum_B, vectornum_C,  
               errors_A, errors_B, errors_C; // Bookkeeping variables
    reg [8:0]  testvectors_A[256:0], testvectors_B[256:0], testvectors_C[256:0]; // Test vectors 

    // Instances
    InterlockA dut_A(i_A, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A);
    InterlockB dut_B(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_B);
    InterlockC dut_C(i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1, o_C);
    //InterlockC dut_D(i_A1, i_B1, i_C1, i_D, i_E1, i_F1, i_G1, i_H1, o_D);
    //InterlockD dut_E(i_A1, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1, o_E);
    //InterlockA dut_E(i_A1, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1, o_E);
    //InterlockB dut_F(i_A1, i_B1, i_C1, i_D1, i_E1, i_F, i_G1, i_H1, o_F);
    //InterlockA dut_G(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G, i_H1, o_G);
    //InterlockB dut_H(i_A1, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H, o_H);

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

    // Apply test vectors on rising edge for InterlockA
    always @(posedge clk) begin
        {i_A, i_B1, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A_expected} = testvectors_A[vectornum_A];
        {i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_B_expected} = testvectors_B[vectornum_B];
        {i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1, o_C_expected} = testvectors_C[vectornum_C];
        //{i_A1, i_B1, i_C1, i_D, i_E1, i_F1, i_G1, i_H1, o_D_expected} = testvectors_D[vectornum_D];
        //{i_A, i_B1, i_C1, i_D1, i_E, i_F1, i_G1, i_H1, o_E_expected} = testvectors_E[vectornum_E];
        //{i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_F_expected} = testvectors_F[vectornum_F];
        //{i_A1, i_B1, i_C, i_D1, i_E1, i_F1, i_G1, i_H1, o_G_expected} = testvectors_G[vectornum_G];
        //{i_A1, i_B1, i_D, i_E1, i_C1, i_F1, i_G1, i_H1, o_H_expected} = testvectors_H[vectornum_H];
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

        
    // Print out in transcript window
    initial begin
        $monitor("Time=%3dns, i_A1=%b, i_B1=%b, i_C1=%b, i_D1=%b, i_E1=%b, i_F1=%b, i_G1=%b, i_H1=%b, o_A=%b, o_B=%b, o_C=%b", $time, i_A1, i_B, i_C1, i_D1, i_E1, i_F1, i_G1, i_H1, o_A, o_B, o_C);
    end
endmodule
