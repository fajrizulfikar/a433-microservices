# check if all arguments passed to the script
if [ $# -ne 4 ]; then
    echo "Usage: $0 <db_host> <your_username> <your_token> <your_repository>"
    exit 1
fi

# bind argument to variable
db_host=$1
username=$2
token=$3
repository=$4

# build image
docker build --build-arg NODE_ENV=production --build-arg DB_HOST=$db_host -t item-app:v1 .

# list all image
docker images

# prepare the tag for the github packages
docker tag item-app:v1 ghcr.io/$username/$repository/item-app:v1

# login to github packages
docker login ghcr.io -u $username -p $token

# push image to github packages
docker push ghcr.io/$username/$repository/item-app:v1

