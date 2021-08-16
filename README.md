# Demo app for https://github.com/spring-projects/spring-session/issues/1791
## Build & Deploy

```docker run --name demo-redis -p 6379:6379 -d redis```

```./gradlew clean build```

```java -jar build/libs/demo.jar``` 

## Steps to reproduce

- Go to http://localhost:8080/login in your browser and login with credentials `demo/password`
- Repeat authentication process **multiple times**
- Then go to redis-cli and see the content of the index

```SMEMBERS spring:session:index:org.springframework.session.FindByIndexNameSessionRepository.PRINCIPAL_NAME_INDEX_NAME:demo```

There should be multiple values in the set.

- Wait about 30 seconds and see that only the most recent entry is cleared

Note that in the case when `NullAuthenticatedSessionStrategy` is applied in `SecurityConfig` 
there's only one entry stored in the index and it is cleared after 30 seconds. 
