#!/bin/bash

jq 'select(
  (.objectRef.resource=="secrets" and (.verb=="list" or .verb=="get" or .verb=="watch") and .responseStatus.code==403)
  or
  (.objectRef.resource=="pods" and .objectRef.subresource=="exec" and .verb=="get")
  or
  (.objectRef.resource=="rolebindings" and .requestObject.roleRef.name=="cluster-admin" and .verb=="create")
  or
  (.objectRef.resource=="pods" and .requestObject.spec.containers[]?.securityContext.privileged==true)
)' "$1"
