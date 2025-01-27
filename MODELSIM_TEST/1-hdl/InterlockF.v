module InterlockF (
    input i_A1,
    input i_B1,
    input i_C1,
    input i_D1,
    input i_E1,
    input i_F,
    input i_G1,
    input i_H1,
    output o_F
);

assign o_F = (~(i_E1 & i_G1 & i_F) & ~(i_G1 & i_A1 & i_B1 & i_D1 & i_F) & ~(i_E1 & i_A1 & i_H1 & i_F) & ~(i_D1 & i_C1 & i_B1 & i_G1 & i_F) & ~(i_E1 & i_C1 & i_H1 & i_B1 & i_F) & ~(i_E1 & i_F & i_C1 & i_B1 & i_H1 ) & ~(i_E1 & i_F & i_A1 & i_D1 & i_H1));

endmodule