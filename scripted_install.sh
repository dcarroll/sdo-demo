#!/bin/bash

sfdx force:org:create -s -a dxsdo -f config/project-scratch-def.json
sfdx force:source:push
sfdx force:user:permset:assign -n Recruiting
sfdx force:apex:execute -f resetDataTables.apex
sfdx force:data:tree:import -p data/HR_Job_Requisition__c-HR_Applicant__c-plan.json
sfdx force:apex:execute -f postPushSetup.apex