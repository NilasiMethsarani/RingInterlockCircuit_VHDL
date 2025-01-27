module InterlockE (
    input i_A1,
    input i_B1,
    input i_C1,
    input i_D1,
    input i_E,
    input i_F1,
    input i_G1,
    input i_H1,
    output o_E
);

assign o_E = (~(i_G1 & i_F1 & i_E) & ~(i_C1 & i_D1 & i_E) & ~(i_F1 & i_H1 & i_A1 & i_E) & ~(i_D1 & i_B1 & i_A1 & i_E) & ~(i_C1 & i_E & i_B1 & i_H1 & i_F1) & ~(i_D1 & i_B1 & i_H1 & i_G1 & i_E ) & ~(i_F1 & i_G1 & i_D1 & i_E));

endmodule