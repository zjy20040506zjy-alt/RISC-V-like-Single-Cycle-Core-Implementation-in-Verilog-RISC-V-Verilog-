Single-Cycle Processor Core (Verilog)
A full-featured single-cycle embedded processor core implemented in synthesizable Verilog HDL. This project includes a complete data path, control unit, independent instruction and data memory, register file, ALU, immediate extension unit, and address generation logic. The design is verified with a complete simulation flow using ModelSim.
Features
Full RTL implementation of a single-cycle embedded processor architecture
Clear separation of controller and data path modules
Independent instruction memory and data memory (1 KB each)
Integrated register file, arithmetic logic unit (ALU), immediate extension, and program counter logic
Complete simulation and verification environment using ModelSim
Testbench-driven functional validation for all instruction behaviors
Module Overview
Top-level module: core_top.v
Controller: controller.v
Program counter: program_counter.v
Register file: reg_file.v
Arithmetic logic unit: alu.v
Instruction RAM: inst_ram.v
Data RAM: data_ram.v
Immediate extension unit: extend.v
Testbench: tb_core.v
Simulation Flow
Compile all RTL design files
Load instruction hex file into instruction memory
Run behavioral simulation in ModelSim
Verify waveforms, register values, and memory access behavior
