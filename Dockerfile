FROM centos:8
MAINTAINER Seth Ryder <seth@sethryder.com>

RUN yum install -y yum-utils epel-release rpm-build rpm-sign redhat-rpm-config rpmdevtools createrepo pinentry make && \
  yum clean all
RUN sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/CentOS-PowerTools.repo
RUN echo '%_topdir /rpmbuild' > /root/.rpmmacros

WORKDIR /rpmbuild

ADD bin/build-spec /usr/local/bin/build-spec
