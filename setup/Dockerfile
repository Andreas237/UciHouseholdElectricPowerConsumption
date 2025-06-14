FROM nvcr.io/nvidia/tensorflow:23.09-tf2-py3

WORKDIR /work

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY requirements.txt .


# RUN apt update && apt upgrade -y \
#     && apt install -y python3-pip curl ffmpeg libsm6 libxext6  \
#     && python3 -m pip install --upgrade pip \
#     && echo python3 --version && \
#     python3 -m pip install --root-user-action ignore -r requirements.txt \
#     && python3 -m pip install \
#     --root-user-action ignore \
#     --extra-index-url=https://pypi.nvidia.com \
#     cudf-cu12==23.12.* dask-cudf-cu12==23.12.* cuml-cu12==23.12.* \
#     cugraph-cu12==23.12.* cuspatial-cu12==23.12.* cuproj-cu12==23.12.* \
#     cuxfilter-cu12==23.12.* cucim-cu12==23.12.* pylibraft-cu12==23.12.* \
#     raft-dask-cu12==23.12.* \
#     && python3 -m pip install --upgrade jupyterlab \
#     && mkdir -p /work/datasets

RUN apt update && apt upgrade -y \
    && apt install -y python3-pip curl ffmpeg libsm6 libxext6  \
    && python3 -m pip install --upgrade pip \
    && echo python3 --version \
    && uv pip install --system -r requirements.txt \
    && uv pip install --system --allow-insecure-host pypi.nvidia.com \
    --root-user-action ignore \
    --extra-index-url=https://pypi.nvidia.com \
    cudf-cu12==23.12.* dask-cudf-cu12==23.12.* cuml-cu12==23.12.* \
    cugraph-cu12==23.12.* cuspatial-cu12==23.12.* cuproj-cu12==23.12.* \
    cuxfilter-cu12==23.12.* cucim-cu12==23.12.* pylibraft-cu12==23.12.* \
    raft-dask-cu12==23.12.* \
    && uv pip install --system --upgrade jupyterlab \
    && mkdir -p /work/datasets