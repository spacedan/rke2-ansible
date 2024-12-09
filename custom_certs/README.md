# Custom CA Certs for RKE2

This guide explains how to generate and deploy certs from a Custom CA for use in the RKE2 cluster.

* At minimum, you will need a root-ca.pem and a root-ca.key 
* With these items, Use the script at utils/generate-custom-ca-certs.sh to create the other necessary certs.
