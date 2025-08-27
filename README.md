# Zero-Code Instrumentation

## 1. WordPress Zero-Code Instrumentation

> This use case involves deploying WordPress on a Kubernetes (K8s) platform. When installing the WordPress Helm chart, the default image does not include OpenTelemetry instrumentation. While it is possible to install the required components inside pods, this approach is not ideal for automated deployments. Building a WordPress image with built-in OpenTelemetry support enables fully automated deployment workflows.

* **Platform:** Kubernetes, Docker
* **Deployment:** GitHub Actions, GitLab CI/CD, Local


### 1.1 Required Environment Variables

```bash
CI_REGISTRY="docker.io"                             # Docker registry domain
CI_REGISTRY_IMAGE="your-repository"                 # Docker repository name
CI_REGISTRY_USER="your-username"                    # Registry username
CI_REGISTRY_PASSWORD="your-password"                # Registry password
OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4318" # OpenTelemetry endpoint URL

# Note: IMAGE_TAG is usually set automatically to the commit SHA in GitHub and GitLab pipelines.
# For local deployments, you may need to set IMAGE_TAG manually.
```


### 1.2 Secrets Configuration for GitHub Actions and GitLab CI/CD

Ensure the above environment variables, especially sensitive credentials, are configured as secret variables in your pipeline settings.


### 1.3 Local Deployment

Run the following script to deploy locally:

```bash
./local.sh
```

---