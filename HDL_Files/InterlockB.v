module InterlockB (
    //Current Input
    input i_BB,
    //Feedback of each contactor
    input i_AB,
    input i_CB,
    input i_DB,
    input i_EB,
    input i_FB,
    input i_GB,
    input i_HB,
    output o_B
);

assign o_B = (~(i_AB & i_BB & i_CB) & ~(i_AB & i_BB & i_DB & i_EB) & ~(i_BB & i_CB & i_FB & i_GB & i_HB) & ~(i_BB & i_CB & i_EB & i_HB) & ~(i_BB & i_CB & i_GB & i_HB) & ~(i_AB & i_BB & i_DB & i_FB & i_GB ) & ~(i_AB & i_BB & i_DB & i_EB & i_HB));

endmodule
