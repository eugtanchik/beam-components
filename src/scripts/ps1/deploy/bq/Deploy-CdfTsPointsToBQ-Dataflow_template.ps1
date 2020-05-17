. $PSScriptRoot'\..\..\variables.ps1'
. $PSScriptRoot'\..\base-config.ps1'
$postfix = Get-Postfix

mvn compile exec:java -D exec.mainClass=com.cognite.sa.beam.bq.CdfTsPointsBQ -D exec.args="--project=$gcpProject --runner=DataFlowRunner --gcpTempLocation=gs://$gcpBucketPrefix$postfix/temp --stagingLocation=$gcpBucketPrefix$postfix/template-stage/cdf-ts-points-bq --region=europe-west1 --templateLocation=$gcpBucketPrefix$postfix/template/bq/cdf-ts-points-bq --experiments=shuffle_mode=service --numWorkers=10 --maxNumWorkers=20 --experiments=enable_stackdriver_agent_metrics"