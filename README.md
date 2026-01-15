# 16-bit Carry Lookahead Adder in Verilog

This project implements a hierarchical **16-bit Carry Lookahead Adder (CLA)** using Verilog.  
The goal of this project is to understand how arithmetic blocks inside processors are optimized for speed by reducing carry propagation delay.

---

## Project Overview

The design is built in three levels:

- **cla_bit.v** – 1-bit block that computes:
  - Propagate (P)
  - Generate (G)
  - Sum

- **cla4.v** – 4-bit Carry Lookahead block that uses propagate and generate logic to compute carry signals in parallel.

- **cla16.v** – 16-bit Carry Lookahead Adder built using four 4-bit CLA blocks.  
  It also generates ALU status flags:
  - Sign  
  - Zero  
  - Parity  
  - Overflow  

- **tb_cla.v** – Testbench used to verify functionality and generate GTKWave waveform.

---

## Why Carry Lookahead Adder?

In a ripple carry adder, carry propagates sequentially through every bit, resulting in high delay for large word sizes.

In a Carry Lookahead Adder:


Using P and G, all carry bits are computed in parallel, reducing delay from **O(n)** to **O(log₂ n)**.

This is the same principle used inside modern CPU ALUs.

---

## How to Run

Use Icarus Verilog and GTKWave.


---

## Output Flags

The 16-bit CLA generates the following flags:

| Flag | Description |
|------|------------|
| Sign | MSB of result |
| Zero | High when result is zero |
| Parity | XOR reduction of result |
| Overflow | Signed arithmetic overflow detection |

---

## Learning Outcomes

- Structural modeling in Verilog  
- Difference between Ripple Carry and Carry Lookahead architecture  
- Hierarchical hardware design  
- Carry optimization using propagate and generate logic  
- Simulation and debugging using GTKWave  

---

This project represents my transition from basic behavioral coding to real hardware architecture thinking.




