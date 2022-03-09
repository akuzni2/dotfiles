tag: terminal
and tag: user.kubectl
-

cube watch logs:
    "kubectl logs -f "

cube pod:
    "kubectl get pod "
    key(enter)

cube watch pod:
    "kubectl get pod --watch"
    key(enter)

cube get (deploy | deployments):
    "kubectl get deployments"
    key(enter)

cube get (deploy | deployments):
    "kubectl get deployments"
    key(enter)

cube restart (deploy | deployments):
    "kubectl rollout restart deployment "
