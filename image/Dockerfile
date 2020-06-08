FROM ubuntu:14.04
WORKDIR /tmp

#Bug installing dependencies
RUN touch /etc/init.d/systemd-logind

RUN apt-get update && apt-get -y install wget
RUN wget https://ufpr.dl.sourceforge.net/project/powerdevs/powerdevs_amd64_981.deb -O powerdevs_amd64.deb
RUN dpkg -i /tmp/powerdevs_amd64.deb ; apt-get -yf install && dpkg -i powerdevs_amd64.deb
RUN rm powerdevs_amd64.deb


ENV DEBIAN_FRONTEND="teletype" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    QT_X11_NO_MITSHM=1


#Install scilab backdoor
RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8
RUN scilab-cli -e "atomsRepositoryDel('http://atoms.scilab.org/5.4'); atomsRepositoryAdd('http://atoms.scilab.org/5.5'); atomsInstall('BackDoor'); exit(0)"

#Fix bug on backdoor 0.2
RUN mv /usr/share/scilab/contrib/BackDoor/0.2/etc/BackDoor.start  /usr/share/scilab/contrib/BackDoor/0.2/etc/backdoor.start

#RUN wget "https://atoms.scilab.org/toolboxes/BackDoor/0.2/files/BackDoor_0.2_5.5.bin.x86_64.linux.tar.gz"
#RUN tar xvzf BackDoor_0.2_5.5.bin.x86_64.linux.tar.gz
#RUN sed -i 's/Maintainer.*/Maintainer: Federico Bergero <fedebergero@gmail.com>/'  BackDoor_0.2/DESCRIPTION
#RUN tar cvzf BackDoor_0.2_5.5.bin.x86_64.linux.tar.gz BackDoor_0.2/
#RUN scilab-cli -e "atomsSetConfig('offline','True'); atomsInstall('/tmp/BackDoor_0.2_5.5.bin.x86_64.linux.tar.gz'); exit(0)"
#RUN mv /usr/share/scilab/contrib/BackDoor/0.2/etc/BackDoor.start  /usr/share/scilab/contrib/BackDoor/0.2/etc/backdoor.start

#pmu_multicore deps
RUN apt-get -y install gdb git cmake libboost1.55-all-dev

#ssh and xeyes for testing
RUN apt-get -y install ssh x11-apps
RUN mkdir /var/run/sshd
RUN /usr/bin/ssh-keygen -A

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
