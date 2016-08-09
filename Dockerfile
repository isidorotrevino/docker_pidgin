FROM ubuntu:14.04 

# docker run -d --device /dev/snd \ 
# -v /tmp/.X11-unix:/tmp/.X11-unix \ 
# -e DISPLAY=unix$DISPLAY \ 
# thshaw/pidgin 

MAINTAINER isidoro.trevino

RUN sudo apt-get update && sudo apt-get install -y software-properties-common 

RUN sudo add-apt-repository -y ppa:pidgin-developers/ppa && \
	sudo add-apt-repository -y ppa:whatsapp-purple/ppa && \
	sudo add-apt-repository -y ppa:nilarimogard/webupd8 
RUN sudo apt-get update && \
	sudo apt-get install -y pidgin wget \
	libgcrypt20-dev libpurple-dev libwebp-dev gettext telegram-purple pidgin-whatsapp pidgin-skypeweb purple-skypeweb && \
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_$(lsb_release -rs)/ /' >> /etc/apt/sources.list.d/jgeboski.list" && \
	cd /tmp && wget  http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_$(lsb_release -rs)/Release.key && \
	sudo apt-key add - < Release.key && \
	sudo apt-get update && \
	sudo apt-get install -y purple-facebook

#&& \
#	cd /tmp && \
#	git clone --recursive https://github.com/majn/telegram-purple && \
#    cd telegram-purple && \
#	./configure && \
#    make && \
#    sudo make install && \
	
	


ENTRYPOINT ["pidgin"]
