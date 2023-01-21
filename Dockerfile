#FROM centos:8.1.1911
FROM fedora:38

ARG UID=1000
ARG GID=1000
ARG HOME=/dropbox

#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install \
	python3 \
	wget \
	mesa-libglapi \
	libXext \
	libXdamage \
	libxshmfence \
	libXxf86vm

RUN groupadd -g ${UID} dropbox && \
	useradd -u ${UID} -g ${GID} -d ${HOME} dropbox

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN chmod 0755 /tini
#RUN gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
# && gpg --batch --verify /tini.asc /tini

USER ${UID}
WORKDIR ${HOME}

RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - && \
		wget -nv -O dropbox-cli https://linux.dropbox.com/packages/dropbox.py && \
		chmod 755 dropbox-cli

VOLUME ["${HOME}/Dropbox"]
VOLUME ["${HOME}/.dropbox"]

EXPOSE 17500

ENTRYPOINT ["/tini", "-g", "--"]
CMD ["/dropbox/.dropbox-dist/dropboxd"]
