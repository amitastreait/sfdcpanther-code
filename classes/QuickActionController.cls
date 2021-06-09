/**
 * @description       : 
 * @author            : Amit Singh
 * @group             : 
 * @last modified on  : 06-03-2021
 * @last modified by  : Amit Singh
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-03-2021   Amit Singh   Initial Version
**/
public with sharing class QuickActionController {
    public QuickActionController() {

    }

    @AuraEnabled
    public static void createAccount(String name, String phone, String parentRecordId){
        try {
            Account acc = new Account(Name = name, Phone = phone, ParentId = parentRecordId);
            insert acc;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
