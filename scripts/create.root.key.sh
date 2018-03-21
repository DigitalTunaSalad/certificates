name=${1:-ca.key.pem}
cd ../root/ca
export RANDFILE="$PWD/private/.rnd"
openssl genrsa -aes256 -out private/$name 4096
chmod 400 private/$name