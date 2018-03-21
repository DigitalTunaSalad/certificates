echo "Creating intermediate folder structure"

cd ../root/ca
# creates the intermediate folder
mkdir intermediate
# change the directory to /root/ca/intermediate
cd intermediate
# directory for certificates
mkdir certs crl csr newcerts private
# changes the rights of the private key folder (owner can read, write and execute)
# chmod 700 private
# creates a new index file if it dosn't exist
test -f index.txt || touch index.txt
# Seeds the serial file if no serial file exist
test -f serial || echo 1000 > serial
# Add a crlnumber file to the intermediate CA directory tree. crlnumber is used to keep track of certificate revocation lists.
test -f crlnumber || echo 1000 > crlnumber

# downloads the config if it doesn't exist
if [ -f "openssl.cfg" ]; then 
    echo "/root/ca/intermediate/openssl.cfg already exists..." 
else
    echo "Downloading /root/ca/intermediate/openssl.cfg..."
    curl -o openssl.cfg https://gist.githubusercontent.com/DigitalTunaSalad/f1d5a844b521035b914cca95b1b6b806/raw/57fab78963e74f4251085cb1c73ecaed826c27a7/openssl.cfg
    echo "Download complete"
fi