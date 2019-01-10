# 集群搭建方法

## 参考文章

https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/configuration.md#docker

## reference

```shell
docker pull swaggerapi/swagger-ui
docker run -p 80:8080 swaggerapi/swagger-ui
```

Will start nginx with swagger-ui on port 80.

Or you can provide your own swagger.json on your host

```shell
docker run -p 80:8080 -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
```

The base URL of the web application can be changed by specifying the BASE_URL environment variable:

```shell
docker run -p 80:8080 -e BASE_URL=/swagger -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
```

This will serve Swagger UI at /swagger instead of /.

```
-e API_URL=http://generator.swagger.io/api/swagger.json
```
