# Аудит и обеспечение соответствия политике безопасности контейнеров

**1. Установка Gatekeeper:**

```shell
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v3.22.2/deploy/gatekeeper.yaml
```

**2. Установка шаблонов и политик Gatekeeper:**

```shell
kubectl apply -f gatekeeper/constraint-templates
kubectl apply -f gatekeeper/constraints
```

**3. Создание неймспейса:**

```shell
kubectl apply -f 01-create-namespace.yaml
```

**4. Демонстрация работы PSP и Gatekeeper:**

```shell
verify/verify-admission.sh
```

**5. Применение исправленных манифестов:**

```shell
verify/validate-security.sh
```
