tag: terminal
and tag: user.kubectl
-

cube namespace:
    "kubens "
    key(enter)

cube context:
    "kubectx "
    key(enter)

cube watch logs:
    "kubectl logs -f "

cube check all:
    "kubectl get pod -A"
    key(enter)

cube check:
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
