# Example of a Rust project with multiple services using a common base

The goal here was to build a common Rust library for multiple back-end Rust services without having ot compile and build all the base dependencies everytime a new service is built.

To prevent this to happen a Rust base image is created in the folder [base](./base) as an `rlib`library (more details [here](https://doc.rust-lang.org/1.0.0/rustc/metadata/loader/#rlibs-and-dylibs)).
Then this library is used in a new service using the following `rustc` command:

```console
rustc src/main.rs \
    -L dependency=${DEPS_FOLDER} \
    --extern foundations=${RLIB_FILE} \
    --out-dir='target/release' \
    --crate-name="service_x" \
    -C debuginfo=0 -C opt-level=3
```

To test this repository launch:

```console
./build.sh
```

This creates 3 images:
 - base/rust
 - service_1
 - service_2
