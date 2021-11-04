# Terraform Provider for Taikun Workshop

The manuals for the workshop are written in LaTeX.
- `terraform-taikun-workshop-unix.pdf` is the manual for Linux and MacOS users.
- `terraform-taikun-workshop-win.pdf` is the manual for Windows users.

The `workshop/` directory contains the files required at the start of the workshop.
Every participant should be provided with a ZIP archive containing this directory,
as well as the manual corresponding to their OS.

# Build

## Using Docker
Run `make docker` to build both manuals.

## On Linux
The ArchLinux package `texlive-most` contains the necessary LaTex packages to build the manuals.
On Ubuntu, there is the `texlive-generic-extra` package.

`make` builds both manuals.
`make unix` builds the manual for Linux and MacOS users.
`make win` builds the manual for Windows users.
