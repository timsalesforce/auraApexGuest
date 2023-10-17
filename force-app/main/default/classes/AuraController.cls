public without sharing class AuraController {
    @AuraEnabled(cacheable = true)
    public static CustomObject1__c[] getCustomObjects() {
        try {
            CustomObject1__c[] cos = [select Id, Name from CustomObject1__c];
            return cos;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}