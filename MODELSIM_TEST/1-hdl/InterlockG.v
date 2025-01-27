module InterlockG (
    input i_A1,
    input i_B1,
    input i_C1,
    input i_D1,
    input i_E1,
    input i_F1,
    input i_G,
    input i_H1,
    output o_G
);

assign o_G = (~(i_A1 & i_H1 & i_G) & ~(i_F1 & i_E1 & i_G) & ~(i_H1 & i_B1 & i_G & i_C1) & ~(i_F1 & i_D1 & i_C1 & i_G) & ~(i_H1 & i_B1 & i_D1 & i_E1 & i_G) & ~(i_F1 & i_D1 & i_B1 & i_A1 & i_G ) & ~(i_H1 & i_A1 & i_G & i_F1));

endmodule