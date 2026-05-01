#!/bin/bash

###
# Создаем пользователей.
# В реальной системе потребуется сгенерировать подписанный сертификат для каждого пользователя.
# Для сокращения скрипта, создадим пользователей в виде сервисных аккаунтов.
###

kubectl create serviceaccount bob -n default
kubectl create serviceaccount john -n default
