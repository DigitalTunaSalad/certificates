# $1 key filename
# $2 configuration filename
# $3 certificate filename

# check for filename
if [[ -z "$1" ]]; then
  echo "Key is not defined, using default:  root/ca/private/ca.key.pem"
  $1 = private/ca.key.pem  
fi
# check for configuration filename
if [[ -z "$2" ]]; then
  echo "Configuration is not defined, using default: root/ca/openssl.cfg"
  $2 = openssl.cfg  
fi
# check for certificate filename.
if [[ -z "$3" ]]; then
  echo "Name is not defined, using default: root/ca/certs/ca.cert.pem"
  $3 = certs/ca.cert.pem  
fi
cd ../root/ca
# Create the root certificate
openssl req -config $2 \
    -key $1 \
    -new -509 -days 7300 -sha256 -extensions v3_ca \
    -out $3
chmod 444 $3
# Verify the root certificate
openssl x509 -noout -text -in $3
cd ../../scripts