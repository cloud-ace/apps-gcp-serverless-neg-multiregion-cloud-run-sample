#!/bin/bash

## Delete load balancing resources
gcloud compute forwarding-rules delete print-zone-fw-rules --global --quiet
gcloud compute target-http-proxies delete print-zone-target-http-proxy --quiet
gcloud compute url-maps delete print-zone-lb --quiet
gcloud compute backend-services delete print-zone-service --global --quiet
gcloud beta compute network-endpoint-groups delete print-zone-tokyo --region=asia-northeast1  --quiet
gcloud beta compute network-endpoint-groups delete print-zone-osaka --region=asia-northeast2  --quiet

## Delete Cloud Run services
gcloud run services delete print-zone-tokyo --platform=managed --region=asia-northeast1 --quiet
gcloud run services delete print-zone-osaka --platform=managed --region=asia-northeast2 --quiet
