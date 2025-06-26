@isTest
private class OrderStatusConsultControllerTest {

    @isTest
    static void testGetOrderStatus_success() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        BotRequest req = new BotRequest();
        req.orderNumber = '123456';

        Test.startTest();
        List<BotResponse> responses = OrderStatusConsultController.getOrderStatus(new List<BotRequest>{ req });
        Test.stopTest();

        System.assertEquals(1, responses.size());
        System.assertEquals('Em andamento', responses[0].status);
    }

    @isTest
    static void testGetOrderStatus_notFoundByHelper() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        BotRequest req = new BotRequest();
        req.orderNumber = '000000';

        Test.startTest();
        List<BotResponse> responses = OrderStatusConsultController.getOrderStatus(new List<BotRequest>{ req });
        Test.stopTest();

        System.assertEquals(1, responses.size());
        System.assertEquals('Não encontrado', responses[0].status);
    }


    @isTest
    static void testGetOrderStatus_blankOrderNumber() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String expetionMessage;
        BotRequest req = new BotRequest();
        req.orderNumber = '';
        List<BotRequest> requests = new List<BotRequest>{ req };

        Test.startTest();
        List<BotResponse> responses;
        try {
            responses = OrderStatusConsultController.getOrderStatus(requests);
        } catch (OrderStatusException e) {
            expetionMessage = e.getMessage();
        }
        Test.stopTest();

        System.assert(responses[0].status == 'Erro ao consultar pedido: Numero de pedido nao pode estar em branco.');
    }

    @isTest
    static void testGetOrderStatus_apiThrowsError() {
        // GIVEN
        BotRequest req = new BotRequest();
        req.orderNumber = 'falha';
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('falha');
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String expetionMessage;
        // WHEN
        Test.startTest();
        try {
            List<BotResponse> responses = OrderStatusConsultController.getOrderStatus(new List<BotRequest>{req});
        } catch (Exception e) {
            expetionMessage = e.getMessage();
        }
        Test.stopTest();

        System.assert(expetionMessage == null);
    }

}

