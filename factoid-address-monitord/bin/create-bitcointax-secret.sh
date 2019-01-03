#!/usr/bin/env bash

set -xe

while [[ "$#" > 0 ]]; do case $1 in
  --secret) secret="${2}"; shift;;
  --secret-name) secret_name="${2}"; shift;;
  -h|--help) echo "${0} --secret <secret> [--secret-name <secret_name>]"; exit 0;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ -z "$secret" ]; then echo "--secret is required" && exit 1; fi

if [ -z "$secret_name" ]; then secret_name="factoid-address-monitord-secret"; fi

kubectl create secret generic \
  ${secret_name} \
  --from-literal="bitcoinTaxSecret=${secret}"
