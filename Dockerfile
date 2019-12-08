FROM	archlinux/base:latest

ENV		TERM=xterm

# Updating repositories, install few packages, download strap.sh, grant execution rights, run
RUN		/bin/pacman -Syu --noconfirm && \
		/bin/pacman -Sy --noconfirm grep which man iputils expect && \
		/bin/curl -O https://blackarch.org/strap.sh && \
		/bin/chmod +x strap.sh

# Executing strap.sh
RUN		./strap.sh

# Dirty way to install packages
ADD blackarchinstall.sh /

# Installing all blackarch packages
RUN chmod +x blackarchinstall.sh && ./blackarchinstall.sh
