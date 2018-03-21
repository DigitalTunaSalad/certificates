# $1 key filename
# $2 configuration filename
# $3 certificate filename
key=${1:-private/ca.key.pem}
config=${2:-openssl.cfg}
filename=${3:-certs/ca.cert.pem}
cd ../root/ca
# Create the root certificate
openssl req -config $config \
    -key $key \
    -new -x509 -days 7300 -sha256 -extensions v3_ca \
    -out $filename
chmod 444 $filename
# Verify the root certificate
openssl x509 -noout -text -in $filename
cd ../../scripts