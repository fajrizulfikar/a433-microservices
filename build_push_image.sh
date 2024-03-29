# check if all arguments passed to the script
if [ $# -ne 2 ]; then
    echo "Usage: $0 <your_username> <your_token>"
    exit 1
fi

# bind argument to variable
username=$1
token=$2

# build image
docker build -t order-service:latest .

# prepare the tag for the github packages
docker tag order-service:latest ghcr.io/$username/order-service:latest

# login to github packages
echo $token | docker login ghcr.io -u $username --password-stdin

# push image to github packages
docker push ghcr.io/$username/order-service:latest