# Example App

Test Next.js app with our Docker config.

### Building Docker Image

```shell
docker build . --no-cache -f Dockerfile -t example/client --build-arg PORT=1337
```
