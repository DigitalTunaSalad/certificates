cd ..
export CERTIFICATES_HOME=$PWD
cd scripts
./create.intermediate.folders.sh &&
./create.intermediate.key.sh &&
./create.intermediate.csr.sh &&
./create.intermediate.certificate.sh