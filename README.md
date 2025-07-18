# Running anyuid Container Images on OpenShift

This repository demonstrates how to run container images that require the `anyuid` Security Context Constraint (SCC)—such as the official Postgres image from Docker Hub—on OpenShift. It also shows how to detect these containers and associated service accounts that could allow for malicious behavior.

## Overview

By default, OpenShift restricts containers from running as the root user. This example shows how to configure a namespace and service accounts to allow running a PostgreSQL container as root using the `anyuid` SCC. Additionally, it provides policies to detect and audit such configurations for improved security posture.

## Prerequisites

- Access to an OpenShift cluster with cluster-admin privileges.
- install Red Hat Advanced Cluster Management for Kubernetes operator
- `oc` or `kubectl` CLI tools installed and configured.

## Quick Start

### 1. Set Up Security Policies

First, set up Red Hat Advanced Cluster Management for Kubernetes, from the start you will not see any policies.

![screenshot](images/1.png)

then run first 3 scripts to install the required Gatekeeper operator (which could be a showcase how to enforce operator existance at the clusters) and detection policies:

```sh
./01-install-gatekeeper-operator-policy.sh
./02-detect-anyuid-rolebinding-policy.sh
./03-detect-root-user-pods-policy.sh
```

after a while you will see three new policies not reporting any violations

![screenshot](images/2.png)

### 2. Deploy a Privileged PostgreSQL Pod

Next, create a new namespace and configure it to run a privileged Postgres pod:

```sh
./04-namespace.sh
./05-service-account.sh
./06-role-bindings.sh
./07-deploy-postgress.sh
```

after some time policies start to display violations at the cluster you installed postgres on, inspect details at RHACM console

![screenshot](images/3.png)

![screenshot](images/4.png)

![screenshot](images/5.png)

Then once you delete whole 'privileged-namespace' policy violations will be gone.

## Repository Structure

- [`alpine-postgres/`](alpine-postgres/deployment.yaml): Kubernetes manifests for the PostgreSQL deployment.
- [`role-bindings/`](role-bindings/use-anyuid-scc.yaml): Role bindings for SCCs.
- [`default-service-account/`](default-service-account/anyuid-add-to-default-sa.sh): Scripts to modify the default service account instead of dedicated service account

## Security Notes

- **Running containers as root is discouraged** unless absolutely necessary. Always prefer the least privilege principle.
- The provided detection policies help you audit and monitor for risky configurations, such as service accounts or pods that can run as root.
- Regularly review and update your security policies to match your organization’s compliance requirements.

## Troubleshooting

- Ensure all prerequisites are met and that you have the necessary permissions.
- If policies are not being enforced or detected, verify that Gatekeeper and ACM are properly installed and running.
- Check the logs of the Gatekeeper and ACM controllers for more details.

## Contributing

Contributions and suggestions are welcome! Please open an issue or submit a pull request.

## License

This repository is licensed under the MIT License.



