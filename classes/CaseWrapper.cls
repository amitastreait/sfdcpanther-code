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