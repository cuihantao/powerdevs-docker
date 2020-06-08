docker run -d -p 3322:22  \
    --env="HOME" \
    --env="DISPLAY" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume=/home/$USER/dockerhome:/$HOME \
    --cap-add=SYS_PTRACE \
    xvan/powerdevs:r981 \
#    bash
#    /opt/powerdevs/bin/run.sh
