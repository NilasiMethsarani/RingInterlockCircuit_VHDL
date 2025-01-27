module InterlockCombined (
    //input(Feedbacks + Current Inputs)
    input i_AA,
    input i_BA,
    input i_CA,
    input i_DA,
    input i_EA,
    input i_FA,
    input i_GA,
    input i_HA,

    input i_AB,
    input i_BB,
    input i_CB,
    input i_DB,
    input i_EB,
    input i_FB,
    input i_GB,
    input i_HB,

    input i_AC,
    input i_BC,
    input i_CC,
    input i_DC,
    input i_EC,
    input i_FC,
    input i_GC,
    input i_HC,

    input i_AD,
    input i_BD,
    input i_CD,
    input i_DD,
    input i_ED,
    input i_FD,
    input i_GD,
    input i_HD,


    input i_AE,
    input i_BE,
    input i_CE,
    input i_DE,
    input i_EE,
    input i_FE,
    input i_GE,
    input i_HE,

    input i_AF,
    input i_BF,
    input i_CF,
    input i_DF,
    input i_EF,
    input i_FF,
    input i_GF,
    input i_HF,

    input i_AG,
    input i_BG,
    input i_CG,
    input i_DG,
    input i_EG,
    input i_FG,
    input i_GG,
    input i_HG,

    input i_AH,
    input i_BH,
    input i_CH,
    input i_DH,
    input i_EH,
    input i_FH,
    input i_GH,
    input i_HH,

    //Outputs
    output o_A,
    output o_B,
    output o_C,
    output o_D,
    output o_E,
    output o_F,
    output o_G,
    output o_H
);

    // Instantiate InterlockA module
    InterlockA ContactorA (
        .i_AA(i_AA),
        .i_BA(i_BA),
        .i_CA(i_CA),
        .i_DA(i_DA),
        .i_EA(i_EA),
        .i_FA(i_FA),
        .i_GA(i_GA),
        .i_HA(i_HA),
        .o_A(o_A)
    );

    // Instantiate InterlockB module
    InterlockB ContactorB (
        .i_AB(i_AB),
        .i_BB(i_BB),
        .i_CB(i_CB),
        .i_DB(i_DB),
        .i_EB(i_EB),
        .i_FB(i_FB),
        .i_GB(i_GB),
        .i_HB(i_HB),
        .o_B(o_B)
    );

// Instantiate InterlockC module
    InterlockC ContactorC (
        .i_AC(i_AC),
        .i_BC(i_BC),
        .i_CC(i_CC),
        .i_DC(i_DC),
        .i_EC(i_EC),
        .i_FC(i_FC),
        .i_GC(i_GC),
        .i_HC(i_HC),
        .o_C(o_C)
    );

    // Instantiate InterlockD module
    InterlockD ContactorD (
        .i_AD(i_AD),
        .i_BD(i_BD),
        .i_CD(i_CD),
        .i_DD(i_DD),
        .i_ED(i_ED),
        .i_FD(i_FD),
        .i_GD(i_GD),
        .i_HD(i_HD),
        .o_D(o_D)
    );
    
    // Instantiate InterlockE module
    InterlockE ContactorE (
        .i_AE(i_AE),
        .i_BE(i_BE),
        .i_CE(i_CE),
        .i_DE(i_DE),
        .i_EE(i_EE),
        .i_FE(i_FE),
        .i_GE(i_GE),
        .i_HE(i_HE),
        .o_E(o_E)
    );

    // Instantiate InterlockF module
    InterlockF ContactorF (
        .i_AF(i_AF),
        .i_BF(i_BF),
        .i_CF(i_CF),
        .i_DF(i_DF),
        .i_EF(i_EF),
        .i_FF(i_FF),
        .i_GF(i_GF),
        .i_HF(i_HF),
        .o_F(o_F)
    );

// Instantiate InterlockG module
    InterlockG ContactorG (
        .i_AG(i_AG),
        .i_BG(i_BG),
        .i_CG(i_CG),
        .i_DG(i_DG),
        .i_EG(i_EG),
        .i_FG(i_FG),
        .i_GG(i_GG),
        .i_HG(i_HG),
        .o_G(o_G)
    );

    // Instantiate InterlockH module
    InterlockH ContactorH (
        .i_AH(i_AH),
        .i_BH(i_BH),
        .i_CH(i_CH),
        .i_DH(i_DH),
        .i_EH(i_EH),
        .i_FH(i_FH),
        .i_GH(i_GH),
        .i_HH(i_HH),
        .o_H(o_H)
    );
    

endmodule

