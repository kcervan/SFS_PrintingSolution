public with sharing class getPickupLabel {
    public getPickupLabel(WorkOrder workOrder) {
        // Add RMA Return Slip as attachment as a PDF
        String fileName = workOrder.WorkOrderNumber + ' - Pickup Slip.pdf';
        PageReference pdfPage = Page.WorkOrderPickupLabel; 
        pdfPage.getParameters().put('id', workOrder.Id);
        Blob pdfBlob = pdfPage.getContentAsPDF();
        //TODO Decide to create File or Not
        savePDFtoWorkOrder(pdfBlob, fileName, workOrder.Id);

    }
}