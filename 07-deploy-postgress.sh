# Deploy a PostgreSQL database using a kustomization.yaml file
# Inside this pod Postgress is ran as root user:
#
# # id
# uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video)

oc apply -k ./alpine-postgres -n privileged-namespace
