This repo is used to create a docker image containing arm64 binaries of `purs`
(the purescript compiler) and `spago` (a build tool for purescript).

The tag or branch you want to build must be set in their build scripts.

Note that spago's has its own version number separate from purs so if you're
upgrading then you must manually verfiy the version of purs and spago you want
and make sure they work together. Generally you probably want the latest
released version of each.

This repository is typically used for simply providing these binaries inside of
a docker image that can be used inside a project-specific docker image which
needs an arm64 version.

Once the build scripts have the appropriate versions in them then you should be
able to produce the needed docker image with `docker build .`

After that you can tag it or push it to whereever you need.

Typically that will be `flipstone/purescript-arm64:<purs version>`

e.g.

```
docker build . -t flipstone/purescript-arm64:0.15.4
docker push
```
