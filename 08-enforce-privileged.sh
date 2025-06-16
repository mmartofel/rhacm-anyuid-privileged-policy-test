# This script sets the Pod Security Admission policy to enforce privileged mode

oc label ns privileged-namespace pod-security.kubernetes.io/enforce=privileged