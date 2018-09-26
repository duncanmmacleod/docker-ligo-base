FROM centos:centos7

LABEL name="LIGO Base Enterprise Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      date="20180926" \
      support="Reference Platform with testing LSC Software"

# download and install standard repositories with LSCSoft Testing enabled
RUN rpm -ivh http://software.ligo.org/lscsoft/scientific/7/x86_64/production/lscsoft-production-config-1.3-1.el7.noarch.rpm && \
    rpm -ivh http://software.ligo.org/lscsoft/scientific/7/x86_64/production/lscsoft-testing-config-1.3-1.el7.noarch.rpm && \
    rpm -ivh https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && \
    yum clean all && yum makecache

# configure extra repositories
RUN yum -y install \
      bash-completion \
      yum-priorities \
      lscsoft-backports-config \
      lscsoft-epel-config \
      lscsoft-grid-config \
      lscsoft-ius-config && \
    yum clean all
