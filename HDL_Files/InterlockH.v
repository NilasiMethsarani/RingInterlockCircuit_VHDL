module InterlockH (
    //Current Input
    input i_HH,
    //Feedback of each Contactor
    input i_AH,
    input i_BH,
    input i_CH,
    input i_DH,
    input i_EH,
    input i_FH,
    input i_GH,
    output o_H
);

assign o_H = (~(i_GH & i_AH & i_HH) & ~(i_CH & i_DH & i_FH & i_AH & i_HH) & ~(i_GH & i_CH & i_BH & i_HH) & ~(i_AH & i_EH & i_FH & i_HH) & ~(i_EH & i_FH & i_DH & i_AH & i_HH) & ~(i_GH & i_HH & i_EH & i_BH & i_DH ) & ~(i_GH & i_HH & i_CH & i_FH & i_BH));

endmodule