public with sharing class RecordViewerController {
    @AuraEnabled(cacheable=true)
    public static List<RecordWrapper> getRecords(String objectName) {
        String soql;
        if (objectName == 'Account') {
            soql = 'SELECT Id, Name, Owner.Name, CreatedBy.Name, LastModifiedBy.Name, CreatedDate, LastModifiedDate, Website FROM Account ORDER BY LastModifiedDate DESC LIMIT 20';
        } else if (objectName == 'Contact') {
            soql = 'SELECT Id, Name, Owner.Name, CreatedBy.Name, LastModifiedBy.Name, CreatedDate, LastModifiedDate, Phone FROM Contact ORDER BY LastModifiedDate DESC LIMIT 20';
        } else if (objectName == 'Opportunity') {
            soql = 'SELECT Id, Name, Owner.Name, CreatedBy.Name, LastModifiedBy.Name, CreatedDate, LastModifiedDate, Amount FROM Opportunity ORDER BY LastModifiedDate DESC LIMIT 20';
        } else {
            return new List<RecordWrapper>();
        }

        List<SObject> records = Database.query(soql);
        List<RecordWrapper> wrappers = new List<RecordWrapper>();
        for (SObject rec : records) {
            Boolean access = rec.getSObjectType().getDescribe().isAccessible();
            wrappers.add(new RecordWrapper(rec, access));
        }
        return wrappers;
    }

    public class RecordWrapper {	
        @AuraEnabled public String Id;
        @AuraEnabled public String Name;
        @AuraEnabled public String OwnerName;
        @AuraEnabled public String CreatedByName;
        @AuraEnabled public String LastModifiedByName;
        @AuraEnabled public String CreatedDate;
        @AuraEnabled public String LastModifiedDate;
        @AuraEnabled public String Website;
        @AuraEnabled public String Phone;
        @AuraEnabled public String Amount;
        @AuraEnabled public Boolean hasAccess;

        public RecordWrapper(SObject rec, Boolean access) {
            this.Id = (String) rec.get('Id');
            this.Name = (String) rec.get('Name');
            this.OwnerName = rec.getSObject('Owner') != null ? (String)rec.getSObject('Owner').get('Name') : null;
            this.CreatedByName = rec.getSObject('CreatedBy') != null ? (String)rec.getSObject('CreatedBy').get('Name') : null;
            this.LastModifiedByName = rec.getSObject('LastModifiedBy') != null ? (String)rec.getSObject('LastModifiedBy').get('Name') : null;
            this.CreatedDate = String.valueOf(rec.get('CreatedDate'));
            this.LastModifiedDate = String.valueOf(rec.get('LastModifiedDate'));
            this.Website = (rec.getSObjectType().getDescribe().getName() == 'Account') ? (String) rec.get('Website') : null;
            this.Phone = (rec.getSObjectType().getDescribe().getName() == 'Contact') ? (String) rec.get('Phone') : null;
            this.Amount = (rec.getSObjectType().getDescribe().getName() == 'Opportunity') ? String.valueOf(rec.get('Amount')) : null;
            this.hasAccess = access;
        }
    }
}