@isTest
public class MockHttpResponseGenerator implements HttpCalloutMock {
    
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        String endpoint = req.getEndpoint();

        if (endpoint.contains('123456')) {
            res.setStatusCode(200);
            res.setBody('{"status":"Em andamento"}');
        } 
        else if (endpoint.contains('falha')) {
            res.setStatusCode(500);
            res.setBody('{"error":"Erro interno"}');
        } 
        else if (endpoint.contains('formatoInvalido')) {
            res.setStatusCode(200);
            res.setBody('Resposta invalida');
        } 
        else {
            res.setStatusCode(200);
            res.setBody('{"status":"Desconhecido"}');
        }

        return res;
    }
}