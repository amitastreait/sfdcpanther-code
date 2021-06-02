public with sharing class CloseCaseController {
    
    @AuraEnabled(cacheable=true)
    public static List<CaseWrapper> getClosedCases(){

        List<CaseWrapper> caseList = new List<CaseWrapper>();
        try {
            for(Case caseRecord : [SELECT Id, CaseNumber, Subject, Status FROM Case Where Status != 'Closed' Limit 10]){
                CaseWrapper wrapper = new CaseWrapper(caseRecord);
                caseList.add(wrapper);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return caseList;
    }

    @AuraEnabled
    public static void claseSelectedCases(String caseString){
        try {
            List<CaseWrapper> caseList = (List<CaseWrapper>)JSON.deserialize(caseString, List<CaseWrapper>.class);
            List<Case> caseToUpdate = new List<Case>();
            for(CaseWrapper wrapper : caseList){
                if(wrapper.isSelected == true){
                    Case caseRecord = wrapper.caseRecord;
                    caseRecord.Status = 'Closed';
                    caseToUpdate.add(caseRecord);
                }
            }
            update caseToUpdate;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class CaseWrapper {
        @AuraEnabled
        public Case caseRecord    { get; set; }
        @AuraEnabled
        public Boolean isSelected { get; set; }

        public CaseWrapper(Case caseRecord){
            this.isSelected = false;
            this.caseRecord = caseRecord;
        }
    }

}
