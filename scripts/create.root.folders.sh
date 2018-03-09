# see https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html
# Create folder structure
echo "Creating root folder structure"
cd ..
# root directory
if test -d root/ca then
    echo "root/ca already exists..."
else
    echo "Creating root/ca..."
    mkdir root/ca
    echo "root/ca created"
fi
# change the directory to root/ca
cd root/ca
# directory for certificates
if test -d certs then
    echo "root/ca/certs already exists..."
else
    echo "Creating root/ca/certs..."
    mkdir certs
    echo "root/ca/certs created"
fi 
# directory for lol
if test -d crl then
   echo "root/ca/crl already exists..." 
else
    echo "Creating root/ca/certs..."
    mkdir crl
    echo "root/ca/certs created"
fi
# directory for new certificates
if test -d newcerts then
    echo "root/ca/newcerts already exists..." 
else
    echo "Creating root/ca/newcerts..."
    mkdir newcerts
    echo "root/ca/newcerts created"

fi
# directory for private keys
if test -d private then
    echo "root/ca/private already exists..." 
else
    echo "Creating root/ca/private..."
    mkdir private
    echo "root/ca/private created"
    # changes the rights of the private key folder (owner can read, write and execute)
    chmod 700 private
fi
# creates a new index file if it dosn't exist
test -f index.txt || touch index.txt
# Seeds the serial file if no serial file exist
test -f serial || echo 1000 > serial
# downloads the config if it doesn't exist
if test -f openssl.cfg then 
    echo "root/ca/openssl.cfg already exists..." 
else
    echo "Downloading root/ca/openssl.cfg..."
    curl -o openssl.cfg https://gist.githubusercontent.com/DigitalTunaSalad/57a710bea63632b53dd15ef463ac97d7/raw/0c75e36642bc907634ba559168d18a7de2eebf37/openssl.cfg
    echo "Download complete"
fi

echo "Remember to modify the /root/ca/openssl.cfg file."

cd scripts