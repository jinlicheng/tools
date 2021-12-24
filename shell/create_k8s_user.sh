#!/usr/bin/env bash

(umask 077;openssl genrsa -out dev.key 2048)
openssl req -new -key dev.key -out dev.csr -subj "/O=devops/CN=dev"
openssl  x509 -req -in dev.csr -CA kube-ca.pem -CAkey kube-ca-key.pem -CAcreateserial -out dev.crt -days 365
kubectl config set-cluster devops --server=https://10.20.21.12:6443 --certificate-authority=kube-ca.pem --embed-certs=true --kubeconfig=./dev.conf
kubectl config set-credentials dev --client-certificate=dev.crt --client-key=dev.key --embed-certs=true --kubeconfig=./dev.conf
kubectl config set-context dev@devops --cluster=devops --user=dev --kubeconfig=./dev.conf
kubectl config use-context dev@devops  --kubeconfig=./dev.conf
kubectl config view  --kubeconfig=./dev.conf

cat >role.yaml <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pods-reader
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - get
  - list
  - watch
EOF

cat >test-pods-reader.yaml <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cbmljs-pods-reader
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: pods-reader
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: dev
EOF

cat > cluster-reader.yaml <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-reader
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - get
  - list
  - watch
EOF

cat > cbmljs-read-all-pod.yaml <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: billy-read-all-pods
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-reader
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: dev
EOF
