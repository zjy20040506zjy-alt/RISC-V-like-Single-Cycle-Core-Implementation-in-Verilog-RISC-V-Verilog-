# Single-Cycle Processor Core (Verilog)
A full-featured single-cycle processor core implemented in synthesizable Verilog HDL, with complete control path, data path, and automated simulation flow.

## Features
- Full RTL implementation of a single-cycle embedded processor
- Independent controller & datapath separation
- Instruction memory & data memory (1KB each)
- Register file, ALU, immediate extension, and address generation
- Simulation & verification platform with ModelSim
- Fully testbench-driven validation

## Module Overview
- Top-level: core_top.v
- Controller: ctrl.v
- Program counter: pc.v
- Register file: reg_file.v
- ALU: alu.v
- Instruction RAM: im.v
- Data RAM: dm.v
- Immediate extend: ext.v
- Testbench: tb_core.v

## Simulation Flow
1. Compile all RTL files
2. Load instruction hex
3. Run ModelSim simulation
4. Verify waveform & register/memory behavior
