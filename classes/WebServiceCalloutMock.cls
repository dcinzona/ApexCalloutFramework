/**
 * Created by gbell on 26/06/2019.
 */
@IsTest
public class WebServiceCalloutMock implements HttpCalloutMock {

    private Integer statusCode;
    private String responseBody;
    private Map<String, String> responseHeaders;

    public WebServiceCalloutMock(Integer statusCode, String jsonString) {
        this.statusCode = statusCode;
        this.responseBody  = jsonString;
    }

    public WebServiceCalloutMock(Integer statusCode, String jsonString, Map<String, String> responseHeaders) {
        this.statusCode = statusCode;
        this.responseBody  = jsonString;
        this.responseHeaders = responseHeaders;
    }

    public HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();

        res.setHeader('Content-Type', 'application/json');
        if (responseHeaders != null) {
            for (String key : responseHeaders.keySet()) {
                res.setHeader(key, responseHeaders.get(key));
            }
        }

        res.setBody((responseBody == null) ? '' : responseBody);
        res.setStatusCode((statusCode == null) ? 200 : statusCode);

        return res;
    }
}