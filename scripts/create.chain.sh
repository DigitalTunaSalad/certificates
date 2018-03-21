$intermediate
$ca
$chain
# To create the CA certificate chain, concatenate the intermediate and root certificates together. 
# We will use this file later to verify certificates signed by the intermediate CA.
cat intermediate/certs/intermediate.cert.pem \
      certs/ca.cert.pem > intermediate/certs/ca-chain.cert.pem
chmod 444 intermediate/certs/ca-chain.cert.pem