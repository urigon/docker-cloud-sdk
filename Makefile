# Usage: https://hub.docker.com/r/google/cloud-sdk/
# 手順:
#   1: make pull - Cloud SDKをPullします
#   2: make auth - ステップに従ってGoogleアカウントで認証を行います
#   3. make gcloud CMD="compute instances list --project $PROJECT_ID
#      - CMD に gcloud 以下のコマンドを入れてコマンド実行を行います

.PHONY: pull
pull:
	docker pull google/cloud-sdk:latest

.PHONY: auth
auth:
	docker run -ti --name gcloud-config google/cloud-sdk gcloud auth login

.PHONY: gcloud
gcloud:
	docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gcloud ${CMD}
