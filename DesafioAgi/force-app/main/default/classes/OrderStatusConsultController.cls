public with sharing class OrderStatusConsultController {

    @InvocableMethod(label='Consultar Status do Pedido')
    public static List<BotResponse> getOrderStatus(List<BotRequest> aLstRequests) {
        List<BotResponse> lLstlResponses = new List<BotResponse>();
        BotRequest lRequest = aLstRequests[0];

        BotResponse lResponse = new BotResponse();
        String lStatus = new OrderStatusConsultService().getOrderStatus(lRequest.orderNumber);
        lResponse.status = lStatus;
        lLstlResponses.add(lResponse);

        return lLstlResponses;
    }
}