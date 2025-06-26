public with sharing class OrderStatusConsultService {
    
    public String getOrderStatus(string aRequest) {
        String lReturn = new OrderStatusConsultHelper().verifyStatusNumber(aRequest);
        return (lReturn != aRequest ? lReturn : new OrderStatusConsultApi().getOrderStatus(aRequest));
    }
}