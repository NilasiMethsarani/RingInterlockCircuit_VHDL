module InterlockA (
    input i_AA,//Current Input
    //Feedbacks of each contactor
    input i_BA,
    input i_CA,
    input i_DA,
    input i_EA,
    input i_FA,
    input i_GA,
    input i_HA,
    output o_A
);

assign o_A = (~(i_CA & i_BA & i_AA) & ~(i_HA & i_GA & i_AA) & ~(i_BA & i_DA & i_EA & i_AA) & 
            ~(i_EA & i_FA & i_HA & i_AA) & ~(i_BA & i_DA & i_FA & i_GA & i_AA) & 
            ~(i_CA & i_DA & i_FA & i_HA & i_AA) & ~(i_BA & i_CA & i_HA & i_AA));

endmodule
