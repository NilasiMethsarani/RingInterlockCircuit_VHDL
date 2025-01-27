module InterlockF (
    //Current Input
    input i_FF,
    //Feedback of each Contactor
    input i_AF,
    input i_BF,
    input i_CF,
    input i_DF,
    input i_EF,
    input i_GF,
    input i_HF,
    output o_F
);

assign o_F = (~(i_EF & i_GF & i_FF) & ~(i_GF & i_AF & i_BF & i_DF & i_FF) & ~(i_EF & i_AF & i_HF & i_FF) & ~(i_DF & i_CF & i_BF & i_GF & i_FF) & ~(i_EF & i_CF & i_HF & i_BF & i_FF) & ~(i_EF & i_FF & i_CF & i_BF & i_HF ) & ~(i_EF & i_FF & i_AF & i_DF & i_HF));

endmodule