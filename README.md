# perl-docker-devenv
Docker development environment for the latest version of Perl, using plenv, cpanm and Perl::LanguageServer for remote development.

# How to use


1. Build the local image, or pull from docker hub.

```
docker build -t <tag_name> .
```


```
docker pull darthjedi/perl-docker-env:version
```

2. Run the image.

```
docker run -td <image_name> 
```

or

```
LOCAL_PROJ_DIR=(your_project_dir) && docker compose up -d
```

3. Attach VS Code to the running image (install perl Language Server & Debugger Extension if interested).

> NOTE: If you don't use the compose file, Remember containers are ephemeral, make sure that your source code is stored in a repo outside of the container.
