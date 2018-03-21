cd ..
export CERTIFICATES_HOME=$PWD
cd scripts
./create.root.folders.sh &&
./create.root.key.sh &&
./create.root.certificate.sh