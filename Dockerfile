FROM r-base:3.4.4
# Install dependencies here
COPY . /app
WORKDIR /app
CMD ["Rscript", "hello-world.R"]
