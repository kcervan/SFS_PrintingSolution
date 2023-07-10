private static void getRMASlip(Shipment shipment){
            // Add RMA Return Slip as attachment as a PDF
            String fileName = shipment.ReturnOrder.ReturnOrderNumber + ' - RMA Slip.pdf';
            PageReference pdfPage = Page.ReturnAuthorizationSlip; // Replace 'RMASlip' with the name of your Visualforce page
            pdfPage.getParameters().put('id', shipment.ReturnOrderId);
            Blob pdfBlob = pdfPage.getContentAsPDF();
            //TODO Decide to create File or Not
            savePdfToReturnOrder(pdfBlob, fileName, shipment.ReturnOrderId);
            

        }





public static void savePdfToReturnOrder(Blob pdfBlob, String fileName, Id returnOrderId) {
            if (pdfBlob != null && fileName != null && returnOrderId != null) {
                // Create a ContentVersion record for the PDF file
                ContentVersion contentVersion = new ContentVersion();
                contentVersion.Title = fileName;
                contentVersion.PathOnClient = fileName;
                contentVersion.VersionData = pdfBlob;
                contentVersion.Origin = 'H'; // H for internal users, C for external users
                insert contentVersion;
        
                // Link the ContentVersion to the return order using a ContentDocumentLink record
                Id contentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
        
                ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
                contentDocumentLink.ContentDocumentId = contentDocumentId;
                contentDocumentLink.LinkedEntityId = returnOrderId; // Return order Id
                contentDocumentLink.ShareType = 'V'; // V for Viewer, C for Collaborator, I for Inferred
                contentDocumentLink.Visibility = 'AllUsers';
                insert contentDocumentLink;
            }
        }