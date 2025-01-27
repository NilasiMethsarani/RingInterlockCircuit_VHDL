Ring Interlock Circuit for EV Charging

This repository contains the design and implementation of a Ring Interlock Circuit for electric vehicle (EV) charging, using a CPLD (Complex Programmable Logic Device), specifically the EPM240T100C5N. The interlock circuit enhances the safety, efficiency, and reliability of EV charging systems by ensuring dynamic power sharing and robust fault prevention mechanisms.
Key Features

    Dynamic Power Sharing: Efficient distribution of power between multiple EVs to optimize charging performance.
    Enhanced Prioritization: Ensures prioritized power delivery based on load requirements.
    Short Circuit Prevention: Detects and prevents potential short circuits during charging.
    Compact and Scalable Design: Designed for scalability, leveraging the EPM240T100C5N CPLD for cost-effective implementation.

Design Components

    Technology Used:
        CPLD Model: EPM240T100C5N
        Quartus Prime for synthesis and implementation.
        ModelSim for simulation.
        Proteus for circuit-level design and testing.

    Input Signals:
        EV charging status.
        Fault detection inputs.
        Load conditions for power prioritization.

    Output Signals:
        Control signals to charging ports.
        Fault notifications.
        Power allocation indicators.


Objectives

    Ensure safe and efficient charging of multiple EVs using an interlock mechanism.
    Provide a cost-effective solution with minimal hardware overhead.
    Test and validate the design against real-world fault conditions.

