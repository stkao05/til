# Docker


`Dockerfile`
It describes how the image should be built. 

__Build__
To actually build an image (assume your current directly contains the image)
```
docker build -t {IMAGE_NAME} {CONTEXT_PATH}
```

CONTEXT_PATH: more like a search path. If you reference any file in your `Dockerfile`, the file needed to be within the context.






# Dockerfile cache layer

Visit the [documentation](https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/) to see a graphic showing the various layers involved with Docker. Commands in your Dockerfile will create new layers. When possible, docker will try to use an existing cached layer if it’s possible. You should try to take advantage of layers as much as possible by organizing your commands in a specific order. We’ll get into that order in a second for dealing with node modules in your application.





# Building Efficient Dockerfiles - Node.js

[Ref](http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/)

Use the following code snippet (or a variation) after all your app dependencies but before you ADD your app code to the container… this way you don’t rebuild your modules each time you re-build your container. If your package.json file changes then your modules will be rebuilt. See this gist for a full example.

Add this to your Dockerfile, after your deps, but before your app code.
```
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/
```