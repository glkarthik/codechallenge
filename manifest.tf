resource "kubectl_manifest" "deployment" {
  yaml_body = <<-EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld
spec:
  replicas: 2
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: dockerhubkarthik/hello
        ports:
          - name: localhost
            containerPort: 8080
        resources:
          limits:
            cpu: 500m
          requests:
            cpu: 200m
EOF
}

resource "kubectl_manifest" "service" {
  yaml_body = <<-EOF
apiVersion: v1
kind: Service
metadata:
  name: public-loadbalancer
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
spec:
  type: LoadBalancer
  selector:
    app: helloworld
  ports:
    - protocol: TCP
      port: 80
      targetPort: localhost
EOF
}

resource "kubectl_manifest" "hpa" {
  yaml_body = <<-EOF
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler 
metadata: 
  name: helloworld-hpa 
spec: 
  maxReplicas: 5 
  minReplicas: 1 
  scaleTargetRef: 
    apiVersion: app/v1 
    kind: Deployment 
    name: helloworld 
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
EOF
}
