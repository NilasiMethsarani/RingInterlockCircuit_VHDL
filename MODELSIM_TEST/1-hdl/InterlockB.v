module InterlockB (
    input i_A1,
    input i_B,
    input i_C1,
    input i_D1,
    input i_E1,
    input i_F1,
    input i_G1,
    input i_H1,
    output o_B
);

assign o_B = (~(i_A1 & i_B & i_C1) & ~(i_A1 & i_B & i_D1 & i_E1) & ~(i_B & i_C1 & i_F1 & i_G1 & i_H1) & ~(i_B & i_C1 & i_E1 & i_H1) & ~(i_B & i_C1 & i_G1 & i_H1) & ~(i_A1 & i_B & i_D1 & i_F1 & i_G1 ) & ~(i_A1 & i_B & i_D1 & i_E1 & i_H1));

endmodule
