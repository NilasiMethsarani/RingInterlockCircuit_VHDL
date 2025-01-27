# Useful ModelSim/VSIM commands
## Simulate for the first time
Note: WLF stands for wave log format
```
vsim -wlf Ilock.wlf work.Ilock_tb
run -all
quit -sim
```

## View the waveform without re-simulation
```
vsim -view Ilock.wlf -do Ilock.do
dataset close Ilock
```

## Re-simulation using the same waveform configuration
```
vsim -wlf Ilock.wlf -do Ilock.do -do "run -all" work.Ilock_tb
```