name=${1:-ca.key.pem}
cd ../root/ca
openssl genrsa -aes256 -out private/$name 4096
chmod 400 private/$name
cd ../../scripts