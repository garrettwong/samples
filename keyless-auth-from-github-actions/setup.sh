PROJECT_ID=$(gcloud config get-value project)

gcloud iam workload-identity-pools create "my-pool" --location="global" --display-name="Demo Pool"

gcloud iam workload-identity-pools providers create-oidc "my-provider" \
--project="${PROJECT_ID}" \
--location="global" \
--workload-identity-pool="my-pool" \
--display-name="Demo provider" \
--attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud" \
--issuer-uri="https://token.actions.githubusercontent.com"


gcloud iam workload-identity-pools providers  describe my-provider --location=global --workload-identity-pool=my-pool

gcloud iam service-accounts create my-service-account --project $PROJECT_ID

export WORKLOAD_IDENTITY_POOL_ID=$(gcloud iam workload-identity-pools describe "my-pool" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --format="value(name)")

gcloud iam service-accounts add-iam-policy-binding "my-service-account@${PROJECT_ID}.iam.gserviceaccount.com" \
--project="${PROJECT_ID}" \
--role="roles/iam.workloadIdentityUser" \
--member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/my-org/my-repo"
