# param
if [[ -z "$1" ]]; then
  echo "Name is not defined, using default: ca.key.pem"
  $1 = ca.key.pem  
fi
cd ../root/ca
openssl genrsa -aes256 -out private/$1 4096
chmod 400 private/$1
cd ../../scripts