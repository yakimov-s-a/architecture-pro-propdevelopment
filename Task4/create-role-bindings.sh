#!/bin/bash

###
# Создаем привязки пользователей к ролям.
# Для демонстрации создадим неймспейсы client-system и tenant-system.
###

kubectl create namespace client-system
kubectl create namespace tenant-system

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: security-specialists
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: security-specialist
subjects:
- kind: ServiceAccount
  name: bob
  namespace: default
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: developers
  namespace: client-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: developer
subjects:
- kind: ServiceAccount
  name: john
  namespace: default
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: auditors
  namespace: tenant-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: auditor
subjects:
- kind: ServiceAccount
  name: john
  namespace: default
EOF
