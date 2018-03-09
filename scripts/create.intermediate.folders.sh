echo "Creating intermediate folder structure"

cd ..
mkdir /root/ca/intermediate
# change the directory to /root/ca/intermediate
cd root/ca/intermediate
# directory for certificates
mkdir certs crl csr newcerts private
# changes the rights of the private key folder (owner can read, write and execute)
chmod 700 private
# creates a new index file if it dosn't exist
test -f index.txt || touch index.txt
# Seeds the serial file if no serial file exist
test -f serial || echo 1000 > serial
# Add a crlnumber file to the intermediate CA directory tree. crlnumber is used to keep track of certificate revocation lists.
test -f crlnumber || echo 1000 > crlnumber