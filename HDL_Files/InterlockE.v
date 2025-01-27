module InterlockE (
    //Current Input
    input i_EE,
    //Feedback of each Contactor
    input i_AE,
    input i_BE,
    input i_CE,
    input i_DE,
    input i_FE,
    input i_GE,
    input i_HE,
    output o_E
);

assign o_E = (~(i_GE & i_FE & i_EE) & ~(i_CE & i_DE & i_EE) & ~(i_FE & i_HE & i_AE & i_EE) & ~(i_DE & i_BE & i_AE & i_EE) & ~(i_CE & i_EE & i_BE & i_HE & i_FE) & ~(i_DE & i_BE & i_HE & i_GE & i_EE ) & ~(i_FE & i_GE & i_DE & i_EE));

endmodule