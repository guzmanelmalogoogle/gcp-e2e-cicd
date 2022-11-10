# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID="guzmanelmalo-test1"
# Test cluster
echo "creating testcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "testcluster" \
--region "europe-west1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/main" \
--subnetwork "projects/$PROJECT_ID/regions/europe-west1/subnetworks/main" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Staging cluster
echo "creating stagingcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "stagingcluster" \
--region "europe-west1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/main" \
--subnetwork "projects/$PROJECT_ID/regions/europe-west1/subnetworks/main" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Prod cluster
echo "creating prodcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "prodcluster" \
--region "europe-west1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/main" \
--subnetwork "projects/$PROJECT_ID/regions/europe-west1/subnetworks/main" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
echo "Creating clusters! Check the UI for progress"
