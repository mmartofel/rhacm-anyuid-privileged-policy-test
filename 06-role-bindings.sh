# Apply role bindings to service accounts in the privileged namespace

oc apply -f ./role-bindings/use-anyuid-scc.yaml -n privileged-namespace
oc apply -f ./role-bindings/use-privileged-scc.yaml -n privileged-namespace
