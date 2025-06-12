# Create two new service accounts in the "privileged-namespace" project

oc create sa privileged-sa -n privileged-namespace
oc create sa anyuid-sa -n privileged-namespace
