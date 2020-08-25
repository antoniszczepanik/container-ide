FROM ubuntu:20.04

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux


RUN apt-get update \
    && apt-get -y install \
    git \
    vim-gtk3 \
    xclip \
    tmux \
    htop \
    curl \
    docker \
    zsh \
    locales \
    python3-pip \
    awscli

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# antigen to manage zsh plugins
RUN curl -L git.io/antigen > /bin/antigen.zsh

# starship prompt
RUN curl -fsSL https://starship.rs/install.sh | bash -s -- --yes

# lazydocker
RUN curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN mkdir -p ~/.vim/colors
COPY .vimrc /root/

RUN vim +BundleInstall +qall


COPY .zshrc /root/
RUN /bin/zsh -c "source /root/.zshrc" 

COPY .tmux.conf /root/
# Install Tmux Plugin Manager & plugins
RUN git clone https://github.com/tmux-plugins/tpm root/.tmux/plugins/tpm

COPY starship.toml /root/.config/
COPY todo.sh /bin/


WORKDIR /home
ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]
