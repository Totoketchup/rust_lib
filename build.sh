echo "**** Building base image ****"
docker build -t base/rust base 

echo "**** Building service 1 from base ****"
docker build -t service_1 services/service_1

echo "**** Building service 2 from base ****"
docker build -t service_2 services/service_2
