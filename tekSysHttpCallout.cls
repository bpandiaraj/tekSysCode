public class tekSysHttpCallout {
    
    public static String getArgs(Integer id)
    {
        String sArgs = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
                
        if (response.getStatusCode() == 200) 
        {
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Deserializes  JSON string 
            Map<string,object> argsJson = (map<string,object>) results.get('args');
            System.debug('Args:' + argsJson );
            sArgs = string.valueof(argsJson.get('foo1'));
            System.debug('sArgs = ' + sArgs );
            sArgs = string.valueof(argsJson.get('foo2'));
            System.debug('sArgs = ' + sArgs );
        }
        return sArgs ;

    }
    
    
    
}