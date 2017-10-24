#!/bin/bash

cp -r ~/Documents/Projects/SFDX/certs certs
sfdx force:org:create -s -a $1 -f config/project-scratch-def.json
sfdx force:source:push
sfdx force:user:permset:assign -n Recruiting
sfdx force:apex:execute -f scripts/resetDataTables.apex
sfdx force:data:tree:import -f data/Jobs__c.json 
sfdx force:data:tree:import -p data/HR_Job_Requisition__c-HR_Applicant__c-plan.json
sfdx force:apex:execute -f scripts/postPushSetup.apex
