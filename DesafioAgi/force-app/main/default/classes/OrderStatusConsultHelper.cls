public with sharing class OrderStatusConsultHelper {
    
    public String verifyStatusNumber(string aRequest) {
        String lReturn = aRequest;
        if (String.isBlank(lReturn)) {
            return '';
        }
        if (lReturn != '123456') {
            return 'Não encontrado';
        }
        
        return lReturn;
    }
}