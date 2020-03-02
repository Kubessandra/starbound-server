# starbound-server
Starbound Dockerfile for server

## Run the server docker

```
docker build . -t starbound-server
docker run -p 21025:21025 -e STEAM_USERNAME="" -e STEAM_PASSWORD="" --name server-starbound starbound-server
```
