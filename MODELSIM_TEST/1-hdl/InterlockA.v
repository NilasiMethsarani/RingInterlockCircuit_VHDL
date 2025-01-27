module InterlockA (
    input i_A,
    input i_B1,
    input i_C1,
    input i_D1,
    input i_E1,
    input i_F1,
    input i_G1,
    input i_H1,
    output o_A
);

assign o_A = (~(i_C1 & i_B1 & i_A) & ~(i_H1 & i_G1 & i_A) & ~(i_B1 & i_D1 & i_E1 & i_A) & 
            ~(i_E1 & i_F1 & i_H1 & i_A) & ~(i_B1 & i_D1 & i_F1 & i_G1 & i_A) & 
            ~(i_C1 & i_D1 & i_F1 & i_H1 & i_A) & ~(i_B1 & i_C1 & i_H1 & i_A));

endmodule
