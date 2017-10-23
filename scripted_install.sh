#!/bin/bash

sfdx force:org:create -s -a $1 -f config/project-scratch-def.json
sfdx force:source:push -u $1
sfdx force:user:permset:assign -n Recruiting -u $1
sfdx force:apex:execute -f resetDataTables.apex -u $1
sfdx force:data:tree:import -f Jobs__x.json  -u $1
sfdx force:data:tree:import -p data/HR_Job_Requisition__c-HR_Applicant__c-plan.json -u $1
sfdx force:apex:execute -f postPushSetup.apex -u $1
