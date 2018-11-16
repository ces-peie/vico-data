# This will start an RStudio Server environment with R 3.4.4 and tidyverse
# pre-installed. The environment will be accessible thru a web browser at the
# following address http://localhost:8787. Use rstudio/pass to login.

docker run \
  --rm \
  -e PASSWORD=pass \
  -p 8787:8787 \
  rocker/tidyverse:3.4.4
