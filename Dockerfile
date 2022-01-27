FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN apt-get update && apt-get dist-upgrade -y

# Base system
RUN apt-get install -y -q acl apt-utils backdoor-factory bash-completion \
                          bc binutils byobu bzip2 ca-certificates dbus dirb \
                          distro-info-data file fontconfig gawk gettext-base \
                          git git-lfs git-man gobuster gpg hping3 \
                          htop inetutils-ping inetutils-tools ioping irpas \
                          keychain locales-all man-db manpages mtr-tiny \
                          ncrack ncurses-term netbase netcat netsniff-ng \
                          nikto nmap openssh-client openssl patch perl \
                          pinentry-curses procps psmisc readline-common \
                          rsync screen socat steghide strace sudo sysstat \
                          tcpdump telnet traceroute tzdata ucf unzip \
                          websploit wget xxd xz-utils zip zsh zstd \
			  pwgen 

# Basic development environment
RUN apt-get install -y -q vim-nox emacs-nox build-essential cmake \
                          g++ gfortran gdb gcc-doc valgrind swig default-jdk \
                          python-is-python2 python2-dev python3-dev python-six \
                          vim-youcompleteme 

# TeX Packages
RUN apt-get install -y -q --no-install-recommends texlive texlive-lang-chinese

# Python packages
RUN apt-get install -y -q --no-install-recommends ipython3 python3-dask \
                          python3-django python3-hypothesis python3-joblib \
                          python3-matplotlib python3-nose python3-numba \
                          python3-numexpr python3-numpy python3-pandas \
                          python3-pil python3-pip python3-pytest \
                          python3-requests python3-scipy python3-skimage \
                          python3-sklearn python3-sympy python3-tables \
                          python3-tornado 

# Languages
RUN apt-get install -y -q afnix clojure elixir gdc ghc golang groovy julia \
                          lua5.4 mono-devel nim ninja-build nodejs npm pakcs \
                          rbenv rustc scala swi-prolog

# Math
RUN apt-get install -y -q coq gnuplot maxima octave pari-galpol pari-gp pi yacas

# Common libraries
RUN apt-get install -y -q bison icu-devtools libcurl4-openssl-dev libedit-dev \
                          libgdbm-dev libgomp1 libgrpc++-dev libicu-dev \
                          libncurses5-dev libomp-dev libopenblas-dev \
                          libreadline-dev libsqlite3-dev libxml2-dev \
                          libyaml-dev mpich protobuf-c-compiler \
                          protobuf-compiler-grpc systemtap-sdt-dev uuid-dev \
                          libhdf5-dev libjemalloc2

# We use jemalloc as default system-wide malloc to reduce overall memory usage
RUN echo /usr/lib/`uname -m`-linux-gnu/libjemalloc.so.2 > /etc/ld.so.preload
RUN adduser --disabled-password vxst
RUN echo "vxst ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vxst-sudo
RUN chsh -s /bin/zsh vxst

VOLUME /home

USER vxst
WORKDIR /home/vxst

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
