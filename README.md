# tailscale-k8s-endpoint-announcer

## Usage

### Cilium

```yaml
extraInitContainers:
  - name: tailscale-k8s-endpoint-announcer
    image: ghcr.io/0xle/tailscale-k8s-endpoint-announcer:<version>
    imagePullPolicy: IfNotPresent
    volumeMounts:
      - mountPath: /var/run/tailscale/tailscaled.sock
        name: tailscaled-socket
    env:
      - name: KUBE_NODE_NAME
        valueFrom:
          fieldRef:
            fieldPath: spec.nodeName
extraVolumes:
  - name: tailscaled-socket
    hostPath:
      path: /var/run/tailscale/tailscaled.sock
```

The Kubernetes service endpoint may need to be configured depending on the cluster setup. This is important since the
Kubernetes API endpoint may be unavailable before the Cilium agent boots up in some cases. For example,
the following environment variables can be added when using Talos with KubePrism.

```yaml
- name: KUBERNETES_SERVICE_HOST
  value: "localhost"
- name: KUBERNETES_SERVICE_PORT
  value: "7445"
```