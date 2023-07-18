public static void savePdfToWorkOrder(Blob pdfBlob, String fileName, Id workOrderId) {
            if (pdfBlob != null && fileName != null && workOrderId != null) {
                // Create a ContentVersion record for the PDF file
                ContentVersion contentVersion = new ContentVersion();
                contentVersion.Title = fileName;
                contentVersion.PathOnClient = fileName;
                contentVersion.VersionData = pdfBlob;
                contentVersion.Origin = 'H'; // H for internal users, C for external users
                insert contentVersion;
        
                // Link the ContentVersion to the work order using a ContentDocumentLink record
                Id contentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
        
                ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
                contentDocumentLink.ContentDocumentId = contentDocumentId;
                contentDocumentLink.LinkedEntityId = workOrderId; // Work order Id
                contentDocumentLink.ShareType = 'V'; // V for Viewer, C for Collaborator, I for Inferred
                contentDocumentLink.Visibility = 'AllUsers';
                insert contentDocumentLink;
            }
        }