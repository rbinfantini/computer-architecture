# Computer Architecture Studies

A repository dedicated to exploring computer architecture, instruction set architectures (ISAs), and low-level software-hardware interfaces.

It serves as both an archive of academic lab coursework and a growing foundation for independent explorations in low-level systems and processor architectures.

---

## Repository Structure

```text
computer-architecture/
├── mips/
│   ├── 01-registers-and-arithmetic/       # lista-01.pdf + solutions
│   ├── 02-branch-and-memory/              # lista-02.pdf + solutions
│   ├── 03-control-flow-and-divisibility/  # lista-03.pdf + solutions
│   └── 04-procedure-calls-and-bubblesort/ # lista-04.pdf + solutions
├── tools/
│   └── Mars4_5.jar
└── README.md
```

---

## MIPS Architecture (Coursework)

The `mips/` directory contains practical lab exercises written in MIPS32 assembly, developed to study computer architecture fundamentals, memory organization, and low-level problem solving. Each module folder also includes the original assignment specification (`lista-0X.pdf`) next to its solutions.

### Modules

| Module | Topics |
| --- | --- |
| [`01-registers-and-arithmetic`](mips/01-registers-and-arithmetic/) | Arithmetic operations, immediate values, basic branching, and C-to-assembly loops |
| [`02-branch-and-memory`](mips/02-branch-and-memory/) | Data segment access, memory word alignment (`sw`/`lw`), and array traversals |
| [`03-control-flow-and-divisibility`](mips/03-control-flow-and-divisibility/) | Multi-way branch classification, primality testing, and Euclidean GCD (`rem`) |
| [`04-procedure-calls-and-bubblesort`](mips/04-procedure-calls-and-bubblesort/) | Subroutine linkage (`jal`/`jr $ra`) and in-register sorting |

### Technologies

| | |
| --- | --- |
| **Architecture** | MIPS32 |
| **Language** | Assembly |
| **Simulator** | [MARS](https://dpetersanderson.github.io/) (MIPS Assembler and Runtime Simulator) v4.5 |
| **Runtime** | Java Runtime Environment (JRE 8+) |

### How to Run

1. Open the **MARS** simulator by launching `tools/Mars4_5.jar` (or download it from [dpetersanderson.github.io](https://dpetersanderson.github.io/)):

   ```bash
   java -jar tools/Mars4_5.jar
   ```

2. Load any `.asm` file (**File → Open**).
3. Click **Assemble** (or press `F3`).
4. Run the program (`F5`) or execute it step by step (`F7`).

---

## Future Exploration

- [ ] **RISC-V**: Open ISA fundamentals, instruction encoding, and porting MIPS algorithms to RISC-V assembly
- [ ] **ARM64 (AArch64)**: Calling conventions, load-store differences, and compiler optimization disassembly
- [ ] **Memory & Caching**: Cache hierarchies (L1/L2/L3), memory locality benchmarks, and hardware performance counters
- [ ] **Microarchitecture**: Pipelining, data/control hazards, and branch prediction mechanics
