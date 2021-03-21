# Introduction

A unanimous development environment across amd64, arm/v7, arm64/v8.

Tested on Intel Ice Lake, ARM Cortex-A53 and Cortex-A72(Raspberry Pi, using arm/v7 and arm64/v8), Apple M1(with arm64/v8).

Numpy, scipy and sympy pass the self-tests. Most packages have been briefly tested and used on all three platforms.

The aim of this image is to balance usability, correctness and the latest version. It might be the easiest way to
setup a Linux workspace on Apple M1, since Docker has released RC1 version of Apple Silicon, and there seems to be
no other way to run VMs on the new M1 chip.

# Usage

Start the container:

```bash
docker run -v /some-path-to-home:/home -d --rm --name workspace vxst/workspace
```

Go into workspace:

```bash
docker exec -it workspace byobu
```

Aliases can be set like:

```bash
alias StartLinux='docker run -v /Users/vxst/workdir/home:/home -d --rm --name workspace vxst/workspace'
alias ToLinux='docker exec -it workspace byobu'
```

```
MIT License

Copyright (c) 2013-2021 Shan Chunqing(vxst@vxst.org)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
