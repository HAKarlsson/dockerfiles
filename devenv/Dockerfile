FROM hakarlsson/riscv-picolibc:latest

# Update environment
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get install -y vim make git curl srecord man

# Setup user
RUN useradd -d /home/me me
USER me
WORKDIR /home/me

# Bash
COPY --chown=me bashrc .bashrc

# Vim
COPY --chown=me vimrc .vimrc
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +PlugUpdate +qa

COPY --chown=me --chmod=755 startup.sh .startup.sh

CMD ["/home/me/.startup.sh"]
