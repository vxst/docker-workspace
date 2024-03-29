# Introduction

A unanimous development environment across amd64, arm/v7, arm64/v8.

My devices are:

 * Apple M1 (Macbook Air)
 * i7 1068NG7(Macbook Pro)

Tested on Intel Ice Lake, ARM Cortex-A53 and Cortex-A72(Raspberry Pi, using arm/v7 and arm64/v8), Apple M1(with arm64/v8).

Numpy, scipy and sympy pass the self-tests. Most packages have been briefly tested and used on all three platforms.

This image aims to balance usability, correctness and the latest version. It might be the easiest way to
setup a Linux workspace on Apple M1, since Docker has released the stable version for Apple Silicon, and there seems to be
no easier way to run the Linux development environment on the new M1 chip.

# Included language

Language selection is based on my personal habit. You can always add new languages in homedir, or 
build image FROM vxst/workspace.

## Common purpose languages

 * C/C++/ObjC/ObjC++/C#/D
 * Fortran
 * Java 11
 * Python3 with science related libraries
 * Elixir
 * NodeJS
 * Rust
 * Golang
 * Julia
 * Haskell
 * Prolog
 * Groovy
 * Clojure
 * Scala
 * Lua
 * Nim
 * OCaml
 * AFNIX
 * Curry

## Domain-specific programming languages

 * Coq
 * Pari/GP
 * Maxima
 * Octave (mimics Matlab)
 * Yacas (mimics Wolfram/Mathematica)
 * Protobuf compiler
 * GRPC generator


# Usage

You need to have a home dir prepared, with vxst as the default user, you can always change user by 
build your own workspace FROM this release.

**YOU NEED TO HAVE A HOME DIR! COPY FROM EXISTING HOME OR CREATE IT**

Start the container:

```bash
docker run -v /some-path-to-home:/home -d --rm --name workspace vxst/workspace
```

Go into the workspace:

```bash
docker exec -it workspace byobu
```

Aliases can be set like:

```bash
alias _.begin='docker run -v /Volumes/Linux\ Home/home:/home -d --rm --name workspace vxst/workspace'
alias _.end='docker stop workspace'
alias _.byobu='docker exec -it workspace byobu'
alias _.zsh='docker exec -it workspace zsh'
alias _.update='docker pull vxst/workspace'
```
And you could type
```bash
_.end; _.update; _.begin
_.zsh
```

> Everything that has a beginning has an end.


```
MIT License

Copyright (c) 2013-2021 Shan Chunqing(vxst@vxst.org)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the software, and to permit persons to whom the software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
