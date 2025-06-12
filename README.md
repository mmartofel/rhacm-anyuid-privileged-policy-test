# rhacm-anyuid-privileged-policy-test

Purpose is to deponstrate how anyuid container images can be run.
Publicly available Postgres image from Dockerhub can easily demonstrate it.

Just run the scripts as they are numbered:

```
./00-namespace.sh
./01-enforce-privileged.sh
./02-service-account.sh
./03-role-bindings.sh
./04-deploy-postgress.sh
```



