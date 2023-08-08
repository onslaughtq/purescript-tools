# Purescript Tools

This repository has a workflow defined that will build and push amd64 and arm64
images to Github Container Registry.

# How to build and test locally

* Use `./build-image.sh build-local` on your machine to build a local image
  for testing. As you make changes locally the images will be tagged with
  `-uncommitted` on the end rather than the commit SHA.

* Update the base tag in `./build-image.sh` as necessary to reflect changes
  in the base image or GHC version included in the image.
