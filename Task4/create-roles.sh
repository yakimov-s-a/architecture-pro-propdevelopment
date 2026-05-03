#!/bin/bash

###
# Создаем роли.
# Кластерная роль cluster-admin существует по умолчанию.
# Для создания ролей в конкретном неймспейсе, создадим неймспейс client-system.
###

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: security-specialist
rules:
- apiGroups:
  - '*'
  resources:
  - '*'
  verbs:
  - get
  - list
  - watch
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: admin
rules:
- apiGroups:
  - '*'
  resources:
  - '*'
  verbs:
  - '*'
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
rules:
- apiGroups:
  - ""
  resources:
  - pods
  - services
  - configmaps
  - persistentvolumeclaims
  verbs:
  - '*'
- apiGroups:
  - apps
  resources:
  - deployments
  - replicasets
  - statefulsets
  - daemonsets
  verbs:
  - '*'
- apiGroups:
  - batch
  resources:
  - jobs
  - cronjobs
  verbs:
  - '*'
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: auditor
rules:
- apiGroups:
  - ""
  resources:
  - pods
  - pods/log
  verbs:
  - get
  - list
  - watch
EOF
