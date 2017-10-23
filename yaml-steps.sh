!#/bin/bash

sfdx force:org:create -s -a dxsdo -f config/project-scratch-def.json
sfdx force:source:push
sfdx force:user:permset:assign -n Recruiting
sfdx force:apex:execute -f resetDataTables.apex
sfdx force:data:tree:import -p data/HR_Job_Requisition__c-HR_Applicant__c-plan.json
sfdx force:apex:execute -f postPushSetup.apex

sfdx force:package2:version:create -d force-app/ -v DX-SDO -w 10
# need to get the package version id

sfdx force:org:create -a subscriber -f config/project-scratch-def.json
sfdx force:package:install -i 05i1I000000CaRCQA0 -u subscriber
