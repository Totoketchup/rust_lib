#####################
## base Rust image ##
#####################
FROM rust:1.32.0

# Create an use a specific directory for the app
ENV ROOT_DIR /app
ENV APP_DIR ${ROOT_DIR}/base/foundations

WORKDIR ${APP_DIR}

COPY ./foundations/Cargo.toml ./foundations/Cargo.lock ./
RUN mkdir ./src && touch ./src/lib.rs
RUN cargo fetch

COPY ./foundations/src ./src

RUN cargo build --release

ENV DEPS_FOLDER ${APP_DIR}/target/release/deps
ENV RLIB_FILE ${APP_DIR}/target/release/libfoundations.rlib