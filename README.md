# Dockerized Jupyter

This is my take on Dockerized Jupyter.  I use it for Keras and Tensorflow projects.  It assumes notebooks are in `<current working directory>/notebooks/` and datasets are in `<current working directory>/notebooks/datasets`.

Collaboration is installed by default (via `jupyter_collaboration`)!  So if you install this on a server feel free to work it with your team.  [See `jupyter_collaboration` docs](https://jupyterlab-realtime-collaboration.readthedocs.io/en/latest/).

# Requirements

- [Install docker-ce](https://docs.docker.com/engine/install/)

- [Install nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)


# How to use it

Use `chmod +x setup.sh` to make the builds the Dockerfile in `setup/` and opens a Jupyter notebook which mounts the `notebooks/` directory for reading and writing and `notebooks/datasets/` for your data.  `notebooks/` will show up as your working directory.

`setup.sh` specifies port, app name, other fields used in `docker run`.  If you use this repo for multiple projects you will need to change the port and app name used for the running container.

Options:
- `gpu`: run the Docker image with all system GPUs attached.
- `cpu`: run the Docker image with just your CPU.
- `help`: prints a help message.


Example Usage: `./setup.sh gpu`




# Feedback

Comments, questions, and suggestions are always welcome.  Please open an issue for any of them.