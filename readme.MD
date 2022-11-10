# Network Traffic Test

This is intended to see if we can generate tooling/configuration that enables operators to view the status of network traffic encryption under the hood of istio.

## Prerequisites

This harness requires the following:

* Kind
* istioctl
* kubectl

## Cluster Contents

| Component | Purpose |
| ---- | ---- |
| Kind | Provides the underlying K8s cluster |
| Istio | Provides the basic service mesh | 
| PostgreSQL | Provides a database |
| Argus Retriever | RESTful Service pulling data from PostgreSQL |
| Inspector | Pod Containing dev tools |

## Test Methods

### TCP Connection Encryption

Since the Argus Retriever allows us to get/place entries within the PostgreSQL database, these two items (while in the service mesh) should be interacting with TCP connections.

Adding tcpdump to the retriever should be easy enough.

### HTTP Connection Encryption

Using the Inspector pod to cUrl the Argus Retriever's endpoints (also while in the service mesh) should allow a tool like tcp dump to indicate whether http traffic is encrypted or not.


## Usage

TBD


