# Note: please replace the host first
# To use sslip.io: https://sslip.io/
# To get your public IP: curl ipinfo.io/ip

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: kube-explorer
  namespace: kube-system
  labels:
    app: kube-explorer
  annotations:
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: kube-explorer
    nginx.ingress.kubernetes.io/auth-realm: 'Authentication Required - kube-explorer'
spec:
  rules:
  - host: "${MY_IP}.sslip.io"
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kube-explorer
            port:
              number: 8989
