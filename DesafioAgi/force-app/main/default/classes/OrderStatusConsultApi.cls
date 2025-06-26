public with sharing class OrderStatusConsultApi {
    private static final String LOGISTICS_API_URL = 'https://agichallenge.free.beeceptor.com/order-status/';

    /**
     * Consulta o status de um pedido via API externa.
     *
     * @param aOrderNumber O número do pedido
     * @return Status retornado pela API externa mockada
     */
    public String getOrderStatus(String aOrderNumber) {
        if (String.isBlank(aOrderNumber)) {
            this.logError('Exception while validating fields', 'Blank orderNumber');
            throw new OrderStatusException('Numero de pedido nao pode estar em branco.');
        }

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(LOGISTICS_API_URL + aOrderNumber);
        request.setMethod('GET');

        try {
            HttpResponse response = http.send(request);
            String body = response.getBody();

            Map<String, Object> lMapResult = (Map<String, Object>) JSON.deserializeUntyped(body);
            return (String) lMapResult.get('status');
        } 
        catch (Exception e) {
            this.logError('Exception while calling logistics API', e.getMessage());
            throw new OrderStatusException('Error while calling logistics API: ' + e.getMessage());
        }
    }

    private void logError(String aMessage, String aDetails) {
        OrderStatusLog__c lLog = new OrderStatusLog__c();
        lLog.Message__c = aMessage;
        lLog.Details__c = aDetails;
        insert lLog;
    }
}