FROM debian:bullseye

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get install -y -q software-properties-common

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y -q build-essential

RUN apt-get install -y -q byobu vim-nox ssh emacs-nox zsh bash sudo zstd

RUN apt-get install -y -q gdb lldb valgrind clang libopenblas-dev openjdk-17-jdk

RUN apt-get install -y -q texlive-full

RUN apt-get install -y -q python3 python3-ipython python3-numpy python3-scipy python3-sympy python3-numba python3-numexpr python3-jedi \
                          python3-pytest python3-nose python3-requests python3-skimage python3-skimage-lib python3-sklearn python3-sklearn-lib \
					      python3-matplotlib python3-django python3-pandas python3-pandas-lib python3-tables python3-tables-lib python3-joblib\
					      python3-dask python3-tornado python3-jupyter-console python3-jupyter-core python3-pip python3-pil dvipng python-sympy-doc\
						  isympy3 python-numpy-doc python3-numpy-dbg python-scipy-doc python3-scipy-dbg python-sklearn-doc

RUN apt-get install -y -q rustc golang scala swi-prolog clojure git git-lfs gpg coq coq-theories nodejs erlang julia julia-doc

RUN apt-get install -y -q libprotobuf-c-dev libprotobuf-dev libboost-dev protobuf-c-compiler protobuf-compiler-grpc protobuf-compiler

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
