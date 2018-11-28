FROM rocker/binder:3.5.1

## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

RUN python3 -m venv ${VENV_DIR} && \
  pip3 install matplotlib==3.0.2

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
