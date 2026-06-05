# ALU-Design-Using-Verilog-HDL
**Overview**

This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU is designed using a hierarchical approach, where complex functionality is built from smaller reusable modules such as Full Adders, a Ripple Carry Adder, Arithmetic Unit, Logic Unit, and Shift Unit.

The design supports arithmetic, logical, and shift operations along with status flag generation commonly used in processor architectures.

**Features**
**Arithmetic Operations**
- Addition (A + B)
- Subtraction (A - B) using Two's Complement arithmetic
**Logical Operations**
- AND
- OR
- XOR
- NOT
**Shift Operations**
- Logical Left Shift
- Logical Right Shift
**Status Flags**
- Zero (Z) – Set when result equals zero
- Carry (C) – Indicates carry-out from arithmetic operations
- Negative (N) – Indicates negative result (MSB = 1)
- Overflow (V) – Indicates signed arithmetic overflow

**ALU Opcode Table**
|Opcode | Operation |
|-------|-----------|
|000	| Addition |
|001	| Subtraction |
|010	| AND |
|011	| OR |
|100	| XOR |
|101	| NOT A |
|110	| Shift Left |
|111	| Shift Right |

**Project Hierarchy**
```text
ALU
│
├── Full Adder
│
├── Ripple Carry Adder
│
├── Arithmetic Unit
│   ├── Addition
│   └── Subtraction
│
├── Logic Unit
│   ├── AND
│   ├── OR
│   ├── XOR
│   └── NOT
│
├── Shift Unit
│   ├── Shift Left
│   └── Shift Right
│
├── Opcode Decoder
│
├── Result Selector
│
└── Status Flags
    ├── Zero
    ├── Carry
    ├── Negative
    └── Overflow
```

**Design Concepts Used**
- Combinational Logic Design
- Hierarchical Design Methodology
- Ripple Carry Adder Architecture
- Two's Complement Arithmetic
- Opcode Decoding
- Status Flag Generation
- Verilog HDL Module Instantiation
- Functional Verification using Testbenches

**Simulation and Verification**
The ALU was verified using dedicated Verilog testbenches covering:
- Arithmetic operations
- Logical operations
- Shift operations
- Carry generation
- Overflow detection
- Zero flag generation
- Negative flag generation

Waveform analysis was performed to validate functionality for all supported opcodes.

**Tools Used**
- Verilog HDL
- EDA Playground / ModelSim
- Quartus Prime
- GTKWave
- 
**Future Improvements**
- Parameterized ALU width (8-bit, 16-bit, 32-bit)
- Barrel Shifter implementation
- Multiplication and Division operations
- Register File integration
- Processor datapath integration
- Pipelined ALU design

**Author**
Niki Majithiya
Verilog HDL | Digital Design | VLSI Enthusiast
