# check if all arguments passed to the script
if [ $# -ne 3 ]; then
    echo "Usage: $0 <your_username> <your_token> <your_repository>"
    exit 1
fi

# bind argument to variable
username=$1
token=$2
repository=$3

# build image
docker build --build-arg NODE_ENV=production -t item-app:v1 .

# list all image
docker images

# prepare the tag for the github packages
docker tag item-app:v1 ghcr.io/$username/$repository/item-app:v1

# login to github packages
docker login ghcr.io -u $username -p $token

# push image to github packages
docker push ghcr.io/$username/$repository/item-app:v1

