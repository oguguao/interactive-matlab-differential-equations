# Interactive MATLAB Differential Equations

Companion MATLAB repository for:

**Differential Equations at an Elementary Level with Interactive MATLAB**  
**Ogugua N. Onyejekwe, Ph.D.**

This repository contains the MATLAB source code and ready-to-use MATLAB Live Scripts for the book's **68 Interactive MATLAB Labs**.

## Repository structure

| Chapter | Topic | MATLAB Labs |
|---:|---|---:|
| 1 | Classification of Differential Equations | 10 |
| 2 | First-Order Differential Equations | 10 |
| 3 | Applications of First-Order Differential Equations | 9 |
| 4 | Second-Order Linear Differential Equations | 9 |
| 5 | Applications of Second-Order Differential Equations | 7 |
| 6 | Numerical Methods for Differential Equations | 7 |
| 7 | The Laplace Transform | 7 |
| 8 | Systems of Linear Differential Equations | 3 |
| 9 | Series Solutions | 6 |

## Folder structure

```text
interactive-matlab-differential-equations/
├── README.md
├── LICENSE
└── chapters/
    ├── chapter-01/
    │   ├── Interactive_MATLAB_Lab_1_1.m
    │   ├── ...
    │   └── mlx/
    │       ├── Interactive_MATLAB_Lab_1_1.mlx
    │       └── ...
    ├── chapter-02/
    │   └── mlx/
    ├── chapter-03/
    │   └── mlx/
    ├── chapter-04/
    │   └── mlx/
    ├── chapter-05/
    │   └── mlx/
    ├── chapter-06/
    │   └── mlx/
    ├── chapter-07/
    │   └── mlx/
    ├── chapter-08/
    │   └── mlx/
    └── chapter-09/
        └── mlx/
```

## MATLAB files

Each chapter contains two complementary versions of the interactive activities:

- **`.m` files** — readable and editable MATLAB source code.
- **`.mlx` files** — ready-to-use interactive MATLAB Live Scripts with Live Editor controls where appropriate.

The `.mlx` files are stored in each chapter's `mlx` subfolder.

Example:

```text
chapters/chapter-06/Interactive_MATLAB_Lab_6_4.m
chapters/chapter-06/mlx/Interactive_MATLAB_Lab_6_4.mlx
```

## Open a lab in MATLAB Online

The Live Scripts can be opened directly from this GitHub repository in MATLAB Online. A file-specific MATLAB Online link follows this pattern:

```text
https://matlab.mathworks.com/open/github/v1?repo=oguguao/interactive-matlab-differential-equations&file=chapters/chapter-06/mlx/Interactive_MATLAB_Lab_6_4.mlx
```

MATLAB Online clones the repository and opens the selected file.

## Download a Live Script

Students can also download an `.mlx` file directly from its chapter's `mlx` folder and open it in desktop MATLAB or MATLAB Online.

Example:

```text
https://github.com/oguguao/interactive-matlab-differential-equations/blob/main/chapters/chapter-06/mlx/Interactive_MATLAB_Lab_6_4.mlx?raw=1
```

## Learning design

The labs follow the learning sequence:

**Predict → Interact → Examine → Modify → Reflect**

They are intended to support mathematical reasoning, visualization, numerical experimentation, verification, and computational exploration. The MATLAB activities complement the mathematical development rather than replace analytical reasoning.

## Software

The Live Scripts were prepared for **MATLAB R2025b**. Some activities use Symbolic Math Toolbox; many others use base MATLAB.

## License

The book and companion educational materials are provided under the book's **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)** license unless otherwise noted.
