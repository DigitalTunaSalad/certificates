# $1 csr filename - defaults to intermediate/csr/intermediate.csr.pem
csr=${1:-intermediate/csr/intermediate.csr.pem}
# $2 configuration filename - defaults to openssl.cfg
config=${2:-openssl.cfg}
# $3 certificate filename - defaults to intermediate/certs/intermediate.cert.pem
filename=${3:-intermediate/certs/intermediate.cert.pem}
# $4 the ca filename - defaults to certs/ca.cert.pem
ca=${4:-certs/ca.cert.pem}
# change directory
cd ../root/ca
# To create an intermediate certificate, use the root CA with the v3_intermediate_ca extension to sign the intermediate CSR. 
# The intermediate certificate should be valid for a shorter period than the root certificate. Ten years would be reasonable.
openssl ca -config $config -extensions v3_intermediate_ca \
      -days 3650 -notext -md sha256 \
      -in $csr \
      -out $filename

chmod 444 $filename
# As we did for the root certificate, check that the details of the intermediate certificate are correct.
openssl x509 -noout -text \
      -in $filename
# Verify the intermediate certificate against the root certificate. An OK indicates that the chain of trust is intact.
openssl verify -CAfile $ca \
      $filename
