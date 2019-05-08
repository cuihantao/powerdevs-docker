docker run -it --rm \
    --workdir=$HOME \
    --user=$(id -u):$(id -g) \
    --env="HOME" \
    --env="DISPLAY" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume=/home/$USER/dockerhome:/$HOME \
    --volume=$XAUTHORITY:/home/$USER/.Xauthority \
    --cap-add=SYS_PTRACE \
    --security-opt seccomp=unconfined \
    xvan/powerdevs:r981 \
    /opt/powerdevs/bin/run.sh
