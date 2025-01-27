module InterlockH (
    input i_A1,
    input i_B1,
    input i_C1,
    input i_D1,
    input i_E1,
    input i_F1,
    input i_G1,
    input i_H,
    output o_H
);

assign o_H = (~(i_G1 & i_A1 & i_H) & ~(i_C1 & i_D1 & i_F1 & i_A1 & i_H) & ~(i_G1 & i_C1 & i_B1 & i_H) & ~(i_A1 & i_E1 & i_F1 & i_H) & ~(i_E1 & i_F1 & i_D1 & i_A1 & i_H) & ~(i_G1 & i_H & i_E1 & i_B1 & i_D1 ) & ~(i_G1 & i_H & i_C1 & i_F1 & i_B1));

endmodule