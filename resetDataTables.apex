List<HR_Applicant__c> apps = [Select Id From HR_Applicant__c];
delete apps;

List<HR_Job_Requisition__c> jrs = [Select Id From HR_Job_Requisition__c];
delete jrs;