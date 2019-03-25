FROM bitwalker/alpine-elixir:1.8.1

# Set exposed ports
EXPOSE 5000
ENV PORT=5000

ENV MIX_ENV=prod

# Copy our files over
COPY . .

RUN rm -Rf _build && \
    mix deps.get && \
    mix release.init && \
    mix release

RUN APP_NAME="dnd_5e_tools" && \
    RELEASE_DIR=`ls -d _build/prod/rel/$APP_NAME/releases/*/` && \
    mkdir /export && \
    tar -xf "$RELEASE_DIR/$APP_NAME.tar.gz" -C /export
