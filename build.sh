echo "**** Building base image ****"
docker build -t base/rust base 

echo "**** Building service 1 from base ****"
docker build -t service_1:latest services/service_1

echo "**** Building service 2 from base ****"
docker build -t service_2:latest services/service_2
