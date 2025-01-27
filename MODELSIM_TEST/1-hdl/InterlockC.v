module InterlockC (
    input i_A1,
    input i_B1,
    input i_C,
    input i_D1,
    input i_E1,
    input i_F1,
    input i_G1,
    input i_H1,
    output o_C
);

assign o_C = (~(i_C & i_D1 & i_E1) & ~(i_A1 & i_B1 & i_C) & ~(i_C & i_D1 & i_F1 & i_G1) & ~(i_B1 & i_C & i_H1 & i_G1) & ~(i_A1 & i_C & i_D1 & i_F1 & i_H1) & ~(i_B1 & i_C & i_E1 & i_F1 & i_H1) & ~(i_B1 & i_C & i_D1 & i_E1));

endmodule