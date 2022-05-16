#FROM centos:7
FROM centos/systemd

LABEL maintainer="Jeff Geerling"
ENV container=docker

ENV pip_packages "ansible"

RUN yum -y update; yum clean all
RUN yum -y install sudo

#RUN echo "myproxy" >> /etc/yum.conf
#RUN yum -y install firewalld
# yum clean all; systemctl enable firewall.service

# Install systemd -- See https://hub.docker.com/_/centos/
#RUN yum -y update; yum clean all; \
#(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;
#
## Install requirements.
#RUN yum makecache fast \
# && yum -y install deltarpm epel-release initscripts \
# && yum -y update \
# && yum -y install \
#      sudo \
#      which \
#      python-pip \
# && yum clean all
#
## Upgrade Pip so cryptography package works.
#RUN python -m pip install --upgrade pip==20.3.4
#
## Install Ansible via Pip.
##RUN pip install $pip_packages
##
### Disable requiretty.
##RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers
##
### Install Ansible inventory file.
##RUN mkdir -p /etc/ansible
##RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
#RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

#VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
#["/usr/lib/systemd/systemd"]