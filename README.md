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