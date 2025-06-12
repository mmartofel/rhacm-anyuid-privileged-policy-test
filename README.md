# Running anyuid Container Images on OpenShift

This repository demonstrates how to run container images that require anyuid (such as the official Postgres image from Docker Hub) on OpenShift.

## Overview

By default, OpenShift restricts containers from running as the root user. This example shows how to configure a namespace and service accounts to allow running a PostgreSQL container as root using the `anyuid` Security Context Constraint (SCC).

## Quick Start

Run the following scripts in order:

```sh
./00-namespace.sh             # Create the privileged namespace
./01-enforce-privileged.sh    # Enforce privileged Pod Security Admission policy
./02-service-account.sh       # Create service accounts
./03-role-bindings.sh         # Apply role bindings for SCCs
./04-deploy-postgress.sh      # Deploy PostgreSQL using anyuid
```

## Files

- [`alpine-postgres/`](alpine-postgres/deployment.yaml): Kubernetes manifests for the PostgreSQL deployment.
- [`role-bindings/`](role-bindings/use-anyuid-scc.yaml): Role bindings for SCCs.
- [`default-service-account/`](default-service-account/anyuid-add-to-default-sa.sh): Scripts to modify the default service account.

## Notes

- The deployment runs the Postgres container as root (see comments in [`04-deploy-postgress.sh`](04-deploy-postgress.sh)).
- Make sure you have cluster-admin privileges to apply SCCs and role bindings.



