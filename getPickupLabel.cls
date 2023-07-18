private static void getPickupLabel(WorkOrder workOrder){
            // Add Pickup label Return Slip as attachment as a PDF
            String fileName = workOrder.WorkOrderNumber + ' - Pickup Slip.pdf';
            PageReference pdfPage = Page.WorkOrderPickupLabel; // Visualforce Page
            pdfPage.getParameters().put('id', workOrder.Id);
            Blob pdfBlob = pdfPage.getContentAsPDF();
            //TODO Decide to create File or Not
            savePdfToReturnOrder(pdfBlob, fileName, workOrder.Id);
            

        }