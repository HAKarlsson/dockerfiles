FROM hakarlsson/riscv-picolibc:latest AS devenv

# Update environment
RUN apt-get update\
 && apt-get upgrade -y\
 && apt-get install -y vim-gtk3 make git curl srecord man clang clang-format iproute2 xclip bash-completion evince texlive-full\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Bash
COPY bashrc .bashrc

# Clang format
COPY clang-format .clang-format

# Vim
COPY vimrc .vimrc
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
 && vim +PlugUpdate +qa

COPY startup.sh .startup.sh

ENTRYPOINT ["bash", "/root/.startup.sh"]
