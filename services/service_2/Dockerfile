###############
## service 2 ##
###############
FROM base/rust

ENV SERVICE_DIR ${ROOT_DIR}/services/service_2
WORKDIR ${SERVICE_DIR}

COPY Cargo.toml Cargo.lock ./
RUN cargo fetch

COPY ./src ./src

RUN rustc src/main.rs \
    -L dependency="../../base/foundations/target/release/deps" \
    --extern foundations="../../base/foundations/target/release/libfoundations.rlib" \
    --out-dir='target/release' \
    --crate-name="service_2" \
    -C debuginfo=0 -C opt-level=3

CMD [ "./target/release/service_2" ]
