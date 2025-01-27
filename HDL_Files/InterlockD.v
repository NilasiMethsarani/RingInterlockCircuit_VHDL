module InterlockD (
    //Current Input
    input i_DD,
    //Feedback of each contactor
    input i_AD,
    input i_BD,
    input i_ED,
    input i_CD,
    input i_FD,
    input i_GD,
    input i_HD,
    output o_D
);

assign o_D = (~(i_CD & i_DD & i_ED) & ~(i_BD & i_DD & i_ED & i_GD & i_HD) & ~(i_CD & i_DD & i_FD & i_GD) & ~(i_AD & i_BD & i_DD & i_ED) & ~(i_AD & i_BD & i_HD & i_ED & i_DD) & ~(i_AD & i_CD & i_DD & i_FD & i_HD ) & ~(i_CD & i_DD & i_GD & i_BD & i_FD));

endmodule