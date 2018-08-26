FROM ubuntu

RUN apt update \
 && apt install -y \
    curl \
    git \
    python3 \
    python3-pip \
    vim

RUN useradd -m vim
USER vim
ENV HOME /home/vim

RUN cd $HOME \
 && git clone https://github.com/Vane11ope/.files.git \
 && cd $HOME/.files \
 && chmod -R 777 . \
 && ./link.sh \
 && cd $HOME/ \
 && mkdir .cache \
 && mkdir .cache/dein \
 && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
 && sh ./installer.sh .cache/dein/ \
 && pip3 install neovim \
 && yes ""| vim -c q > /dev/null

USER root
RUN cd $HOME/.cache/dein/repos/github.com/ajmwagar/vim-deus/colors \
 && cp deus.vim /usr/share/vim/vim80/colors/

USER vim
RUN cd $HOME/ \
 && mkdir workdir

WORKDIR $HOME/workdir
