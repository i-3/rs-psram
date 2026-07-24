FROM espressif/idf-rust:all_latest

WORKDIR /project

COPY . .

CMD ["cargo", "build", "--release"]