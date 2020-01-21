# Docker Slate Docs

This is a dockerfile to easily and quickly build or preview Slate API Docs Files. This builds upon the Dockerfile from the slatedocs wiki by adding a retrieval step to clone the latest master branch from GitHub instead of copying locally.

https://github.com/slatedocs/slate

## Build

```
docker build -t slatedocs .
```

## Development

Assumes the API's index.html.md exists in `$PWD/index.html.md`

```
docker run --rm -p 4567:4567 -v $PWD/index.html.md:/usr/src/app/source/index.html.md slatedocs
```

## Static Build

Assumes the API's index.html.md exists in `$PWD/index.html.md`

```
docker run --rm -v $PWD/index.html.md:/usr/src/app/source/index.html.md -w /usr/src/app/source -v $PWD/build:/usr/src/app/build slatedocs bundle exec middleman build --clean
```