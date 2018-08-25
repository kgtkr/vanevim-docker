FROM ubuntu

RUN apt update
RUN apt install git -y
RUN apt install curl -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install vim -y
ENV HOME /root
WORKDIR $HOME/
RUN git clone https://github.com/Vane11ope/.files.git
WORKDIR $HOME/.files
RUN chmod -R 777 .
RUN ./link.sh
WORKDIR $HOME/
RUN mkdir .cache
RUN mkdir .cache/dein
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
RUN sh ./installer.sh .cache/dein/
RUN pip3 install neovim
RUN yes ""| vim -c q > /dev/null
WORKDIR $HOME/.cache/dein/repos/github.com/ajmwagar/vim-deus/colors
RUN cp deus.vim /usr/share/vim/vim80/colors/
WORKDIR $HOME/