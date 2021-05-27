FROM leoh0/packer-qemu

ENV PATH="/root/.cargo/bin:${PATH}"

RUN apk add --no-cache python3-dev gcc musl-dev libffi-dev openssl-dev openssh \
    && wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init \
    && chmod +x rustup-init \
    && ./rustup-init -y \
    && pip3 install --no-cache-dir cryptography \
    && rustup self uninstall -y \
    && pip3 install ansible
