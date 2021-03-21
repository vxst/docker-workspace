FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get install -y -q --no-install-recommends software-properties-common apt-utils
RUN apt-get install -y -q build-essential

RUN apt-get install -y -q vim-nox emacs-nox byobu zsh bash sudo xz-utils \
                          bash-completion bzip2 gzip zstd lldb \
                          gcc g++ gfortran gdb valgrind clang openjdk-17-jdk \
                          libopenblas-dev libomp-dev libgomp1 openmpi-bin llvm-dev \
                          cmake

RUN apt-get install -y -q --no-install-recommends texlive texlive-lang-chinese

RUN apt-get install -y -q --no-install-recommends python3 python3-ipython ipython3 \
                          python3-numpy python3-scipy python3-sympy python3-dask python3-hypothesis \
                          python3-numba python3-numexpr python3-jedi python3-pytest python3-nose \
                          python3-skimage python3-sklearn python3-pandas python3-tables python3-joblib python3-matplotlib \
                          python3-django python3-requests python3-tornado python3-pip python3-pil

RUN apt-get install -y -q rustc golang git git-lfs gpg nodejs julia swi-prolog clojure scala coq mono-devel npm groovy

RUN apt-get install -y -q libgrpc++-dev protobuf-c-compiler protobuf-compiler-grpc

RUN adduser --disabled-password vxst
RUN echo "vxst ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vxst-sudo
RUN chsh -s /bin/zsh vxst

VOLUME /home

USER vxst
WORKDIR /home/vxst

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
