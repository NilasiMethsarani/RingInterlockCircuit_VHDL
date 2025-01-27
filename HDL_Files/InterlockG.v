module InterlockG (
    //Current Input
    input i_GG,
    //Feedback of each Contactor
    input i_AG,
    input i_BG,
    input i_CG,
    input i_DG,
    input i_EG,
    input i_FG,
    input i_HG,
    output o_G
);

assign o_G = (~(i_AG & i_HG & i_GG) & ~(i_FG & i_EG & i_GG) & ~(i_HG & i_BG & i_GG & i_CG) & ~(i_FG & i_DG & i_CG & i_GG) & ~(i_HG & i_BG & i_DG & i_EG & i_GG) & ~(i_FG & i_DG & i_BG & i_AG & i_GG ) & ~(i_HG & i_AG & i_GG & i_FG));

endmodule