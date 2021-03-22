FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get install -y -q --no-install-recommends software-properties-common apt-utils
RUN apt-get install -y -q build-essential

RUN apt-get install -y -q vim-nox emacs-nox byobu zsh bash sudo xz-utils \
                          bash-completion bzip2 gzip zstd lldb \
                          gcc g++ gfortran gdb valgrind clang openjdk-17-jdk default-jdk \
                          libopenblas-dev libomp-dev libgomp1 openmpi-bin llvm-dev \
                          cmake git git-lfs gpg locales-all htop glances \
                          python-is-python2 python2-dev python-six swig rsync wget

RUN apt-get install -y -q --no-install-recommends texlive texlive-lang-chinese

RUN apt-get install -y -q --no-install-recommends python3 python3-ipython ipython3 \
                          python3-numpy python3-scipy python3-sympy python3-dask python3-hypothesis \
                          python3-numba python3-numexpr python3-jedi python3-pytest python3-nose \
                          python3-skimage python3-sklearn python3-pandas python3-tables python3-joblib python3-matplotlib \
                          python3-django python3-requests python3-tornado python3-pip python3-pil

RUN apt-get install -y -q rustc golang nodejs npm julia gdc mono-devel groovy clojure scala \
                          swi-prolog afnix elixir ghc pakcs nim lua5.4 ninja-build

RUN apt-get install -y -q coq pari-gp pari-galpol gnuplot maxima pi octave yacas

RUN apt-get install -y -q libgrpc++-dev protobuf-c-compiler protobuf-compiler-grpc \
                          bison libgdbm-dev libncurses5-dev libsqlite3-dev libyaml-dev libreadline-dev libicu-dev \
                          uuid-dev icu-devtools libcurl4-openssl-dev libedit-dev libicu-dev libpython2-dev \
                          libpython3-dev libxml2-dev systemtap-sdt-dev tzdata uuid-dev

RUN adduser --disabled-password vxst
RUN echo "vxst ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vxst-sudo
RUN chsh -s /bin/zsh vxst

VOLUME /home

USER vxst
WORKDIR /home/vxst

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
