name=${1:-ca.key.pem}
cd ../root/ca
export RANDFILE="$PWD/private/.rnd"
openssl genrsa -aes256 -out intermediate/private/$name 4096
chmod 400 intermediate/private/$name