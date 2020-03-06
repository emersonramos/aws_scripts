#!/bin/bash
 
# Script para executar snapshot e atualizar o CA Certificate das RDSs

# inserir os nomes das RDSs separados por espaço
IDS=(rds1 rds2 rds3)
 
for id in "${IDS[@]}"; do
 echo
 echo "-------------------------------"
 echo "$id:"
 echo "Realizando o Snapshot..."
 aws rds create-db-snapshot --db-snapshot-identifier $id-bkp-rds-ca-2015 --db-instance-identifier $id --region sa-east-1 --no-verify-ssl
 echo
 echo "Realizando a alteração..."
 aws rds modify-db-instance --db-instance-identifier $id --ca-certificate-identifier rds-ca-2019 --region sa-east-1 --no-verify-ssl --apply-immediately
done
