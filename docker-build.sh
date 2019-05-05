VERSION=0.0.2
DOCKER_TAG="marverlous/gta-server:$VERSION"

echo "building docker: $DOCKER_TAG"
docker build -t $DOCKER_TAG -f Dockerfile .

echo "pushing docker: $DOCKER_TAG"
docker push $DOCKER_TAG