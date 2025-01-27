module InterlockC (
    //Current Input
    input i_CC,
    //Feedback of each contactor
    input i_AC,
    input i_BC,
    input i_DC,
    input i_EC,
    input i_FC,
    input i_GC,
    input i_HC,
    output o_C
);

assign o_C = (~(i_CC & i_DC & i_EC) & ~(i_AC & i_BC & i_CC) & ~(i_CC & i_DC & i_FC & i_GC) & ~(i_BC & i_CC & i_HC & i_GC) & ~(i_AC & i_CC & i_DC & i_FC & i_HC) & ~(i_BC & i_CC & i_EC & i_FC & i_HC) & ~(i_BC & i_CC & i_DC & i_EC));

endmodule