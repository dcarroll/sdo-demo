String id = System.UserInfo.getUserId();
List<HR_Job_Requisition__c> jrs = [Select Id, HR_Contact__c, HR_Hiring_Manager__c From HR_Job_Requisition__c];
for (HR_Job_Requisition__c j : jrs) {
    j.HR_Hiring_Manager__c = id;
    j.HR_Contact__c = id;
}
update jrs;
List<HR_Applicant__c> aps = [Select Id, HR_Contact__c, HR_Hiring_Manager__c From HR_Applicant__c];
for (HR_Applicant__c a : aps) {
    a.HR_Hiring_Manager__c = id;
    a.HR_Contact__c = id;
}
update aps;
