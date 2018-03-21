# Use the intermediate key to create a certificate signing request (CSR). 
# The details should generally match the root CA. The Common Name, however, 
# must be different.

# $1 key filename - defaults to intermediate/private/intermediate.key.pem
key=${1:-intermediate/private/intermediate.key.pem}
# $2 configuration filename - defaults to intermediate/openssl.cfg
config=${2:-intermediate/openssl.cfg}
# $3 certificate filename - defaults to intermediate/csr/intermediate.csr.pem
filename=${3:-intermediate/csr/intermediate.csr.pem}
# changes the directory
cd ../root/ca
# Create the root certificate
openssl req -config $config -new -sha256 \
    -key $key \
    -out $filename