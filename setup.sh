#!/bin/bash


help() {
    echo
    echo
    echo "This program starts a Docker container with a Jupyter server. Run with: "
    echo
    echo "    >> setup.sh [cpu | gpu] "
    echo
    echo "'cpu' option uses only CPUs"
    echo "'GPU' option attaches all GPUs"
    echo
    echo
}


run() {
    echo "run function received argument '$1'"
    NAME=$(cat setup/DOCKER_IMAGE_NAME)
    APP_NAME=datascience
    NB_LOCATION_HOST=./notebooks/
    DATASETS_PATH_HOST=${NB_LOCATION_HOST}/datasets/
    CONTAINER_WORKDIR=/work
    CONTAINER_DATADIR=${CONTAINER_WORKDIR}/datasets/
    export JUPYTER_PORT=8888


    if [[ "$1" == "cpu" ]]; then
        printf "Running CPU only container\n"
        docker run \
        --name ${APP_NAME} \
        --shm-size=1G \
        --ipc=host \
        --ulimit memlock=-1 \
        -it \
        -p ${JUPYTER_PORT}:${JUPYTER_PORT} \
        -v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
        --rm \
        ${NAME} jupyter-lab --allow-root --ip 0.0.0.0 --port=${JUPYTER_PORT} --no-browser ${CONTAINER_WORKDIR} --allow-root
    


    elif [[ $1 == "gpu" ]]; then
    printf "Running GPU enabled container\n"
    docker run \
    --name ${APP_NAME} \
    --privileged \
    --gpus all \
    --shm-size=1G \
    --ipc=host \
    --ulimit memlock=-1 \
    -it \
    -p ${JUPYTER_PORT}:${JUPYTER_PORT} \
    -v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
    --rm \
    ${NAME} jupyter lab --allow-root --ip 0.0.0.0 --port=${JUPYTER_PORT} --no-browser \
    --ServerApp.password='' \
    --ServerApp.disable_check_xsrf=True ${CONTAINER_WORKDIR}

    else
    echo "Received $1"
    echo 'Use "gpu" to use a GPU accelerated container with only Tensorflow'
    echo 'Use "deepsig" to use a CPU only container with the libraries needed for the DeepSig workbook'
    fi
}



if [[ "$1" == "help" ]]; then
    help
    exit 0;
fi



pushd setup/
current_dir=`pwd`
./build.sh
popd
run $1