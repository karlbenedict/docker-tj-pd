FROM ubuntu:16.04

MAINTAINER Karl Benedict <kbene@unm.edu>

RUN apt-get update && \
    apt-get install -y \
            autoconf \
            automake \
            build-essential \
            curl \
            git \
            imagemagick \
            ispell \
            libdbus-1-dev \
            libgif-dev \
            libgnutls-dev \
            libgtk2.0-dev \
            libjpeg-dev \
            libmagick++-dev \
            libncurses-dev \
            libpng-dev \
            libtiff-dev \
            libx11-dev \
            libxpm-dev \
            python \
            texinfo \
            wget \
            emacs \
            elpa-markdown-mode \
            emacs-goodies-el \
            && \
    rm -rf /var/lib/apt/lists/*


# Full Pandoc & Latex Environment
RUN wget https://github.com/jgm/pandoc/releases/download/1.19.1/pandoc-1.19.1-1-amd64.deb
RUN dpkg -i pandoc-1.19.1-1-amd64.deb
RUN apt-get update && \
	apt-get purge texlive && \
	apt-get install -y --no-install-recommends \
	texlive \
	lmodern

## Taskjuggler and Ruby
RUN apt-get update && \
	apt-get purge ruby && \
	apt-get install -y --no-install-recommends \
	ruby
RUN gem install taskjuggler

#CMD ["tail", "-f", "/dev/null"]
CMD ["emacs"]