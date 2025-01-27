module InterlockD (
    input i_A1,
    input i_B1,
    input i_D,
    input i_E1,
    input i_C1,
    input i_F1,
    input i_G1,
    input i_H1,
    output o_D
);

assign o_D = (~(i_C1 & i_D & i_E1) & ~(i_B1 & i_D & i_E1 & i_G1 & i_H1) & ~(i_C1 & i_D & i_F1 & i_G1) & ~(i_A1 & i_B1 & i_D & i_E1) & ~(i_A1 & i_B1 & i_H1 & i_E1 & i_D) & ~(i_A1 & i_C1 & i_D & i_F1 & i_H1 ) & ~(i_C1 & i_D & i_G1 & i_B1 & i_F1));

endmodule