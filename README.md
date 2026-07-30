# UART Transmitter (Verilog HDL)

## Overview

This project implements an 8-bit UART (Universal Asynchronous Receiver Transmitter) Transmitter using Verilog HDL. The design is modular, making each block independently testable and reusable.

The transmitter accepts 8-bit parallel data and serially transmits it at a fixed baud rate.

---

## Features

- 8-bit UART Transmitter
- Modular RTL Design
- Finite State Machine (FSM) Control
- Baud Rate Generator
- Parallel-to-Serial Shift Register
- Bit Counter
- Top-Level Integration
- Individual Testbenches for Every Module
- Simulated using ModelSim and Icarus Verilog

---

## Project Structure

```
UART-TX
│
├── rtl
│   ├── shift_register.v
│   ├── baud_generator.v
│   ├── bit_counter.v
│   ├── fsm.v
│   └── top.v
│
├── tb
│   ├── shift_register_tb.v
│   ├── baud_generator_tb.v
│   ├── bit_counter_tb.v
│   ├── fsm_tb.v
│   └── top_tb.v
│
├── docs
│
├── waveforms
│
├── .gitignore
│
└── README.md
```

---

## Module Description

### Shift Register

Loads 8-bit parallel data and shifts one bit out on every shift pulse.

### Baud Generator

Generates the baud tick used for serial transmission timing.

### Bit Counter

Counts transmitted bits and asserts `tx_done` after the final data bit.

### FSM

Controls the complete transmission sequence.

States:

- IDLE
- LOAD
- RUN
- STOP

### Top Module

Integrates all RTL modules into a complete UART Transmitter.

---

## Simulation

Each RTL module has an independent testbench.

Final verification was performed using the integrated Top Module.

Simulation Tools:

- ModelSim Intel FPGA Edition
- Icarus Verilog
- GTKWave

---

## Future Improvements

- UART Receiver
- Configurable Baud Rate
- Parameterized Data Width
- Parity Bit Support
- Stop Bit Configuration
- Full Duplex UART

---

## Author

Tejo Rama Krishna Brundhavanam