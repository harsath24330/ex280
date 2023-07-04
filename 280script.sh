oc new-project bluewills
oc new-app --name rocky --docker-image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc rocky 
oc adm taint node master03 oselabs:NoSchedule
oc new-project area51
oc new-app --name oxcart --docker-image quay.io/redhattraining/hello-world-nginx:v1.0
oc expose svc oxcart
oc new-project lerna
oc new-app --name hydra --docker-image quay.io/redhattraining/hello-world-nginx:v1.0 -n lerna
oc expose svc hydra
oc new-project gru
oc new-app --name scala --docker-image quay.io/redhattraining/hello-world-nginx:v1.0 -n gru
oc expose svc scala
oc new-project math
oc new-app --name qed --docker-image registry.redhat.io/rhel8/mysql-80:1 -n math
oc expose svc qed
oc new-project apples
oc new-app --name oranges --docker-image quay.io/redhattraining/gitlab-ce:8.4.3-ce.0
oc patch svc oranges -p '{"spec":{"selector":{"deployment":"orange"}}}'
oc expose svc oranges
oc label node master01 env=prod
oc label node master02 env=prod
oc label node master03 env=prod
oc new-project path-finder
oc new-app --name voyager --docker-image quay.io/redhattraining/hello-world-nginx:v1.0 -n path-finder
oc expose svc voyager
oc patch deployment voyager -p  '{"spec":{"template":{"spec":{"nodeSelector":{"env":"dev"}}}}}'
oc get deployment voyager -o yaml > voyager.yaml
oc delete deployment voyager
oc create -f voyager.yaml
oc new-project atlas
oc create deployment mercury --image quay.io/redhattraining/hello-world-nginx:v1.0 --dry-run=client -o yaml > mercury.yaml
#oc expose svc mercury
echo "completed"
