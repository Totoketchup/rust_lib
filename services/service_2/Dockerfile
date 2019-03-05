###############
## service 2 ##
###############
FROM base/rust as with_tests

ENV SERVICE_DIR ${ROOT_DIR}/services/service_2
WORKDIR ${SERVICE_DIR}

COPY Cargo.toml Cargo.lock ./
RUN cargo fetch

COPY ./src ./src

RUN rustc src/main.rs \
    -L dependency=${DEPS_FOLDER} \
    --extern foundations=${RLIB_FILE} \
    --crate-name="service_2" \
    -C debuginfo=0 -C opt-level=3

FROM debian:jessie-slim as deploy

ENV ROOT_DIR /app
ENV SERVICE_DIR ${ROOT_DIR}/services/service_2
WORKDIR ${SERVICE_DIR}

COPY --from=with_tests ${SERVICE_DIR}/service_2 ./service_2

CMD [ "./service_2" ]
