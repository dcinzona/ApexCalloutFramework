/**
 * Created by gbell on 26/06/2019.
 */

public class WebServiceCallout {
    private static final Integer DEFAULT_TIMEOUT = 120000; // Maximum Timeout

    public String uri  {get; set;}
    public String payload {get; set;}
    public Map<String, String> headers {get; set;}
    public Integer timeout {get {return (timeout != null) ? timeout : DEFAULT_TIMEOUT; } set;}

    public WebServiceCallout(String pUri) {
        this.uri = pUri;
    }

    /**
     * Make Http GET callout.
     * @return Http Response.
     */
    public HttpResponse get() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(uri);
        request.setMethod('GET');
        request.setTimeout(timeout);

        setHeaders(request);

        return makeHttpCallout(request);
    }

    /**
     * Make Http POST callout.
     * @return Http Response.
     */
    public HttpResponse post() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(uri);
        request.setMethod('POST');
        request.setTimeout(timeout);

        setHeaders(request);
        request.setBody(payload);

        return makeHttpCallout(request);
    }

    /**
     * Make Http PUT callout.
     * @return Http Response.
     */
    public HttpResponse put() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(uri);
        request.setMethod('PUT');
        request.setTimeout(timeout);

        setHeaders(request);
        request.setBody(payload);

        return makeHttpCallout(request);
    }

    /**
     * Make Http DELETE callout.
     * @return Http Response.
     */
    public HttpResponse del() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(uri);
        request.setMethod('DELETE');
        request.setTimeout(timeout);

        setHeaders(request);
        return makeHttpCallout(request);
    }

    /**
     * Set Http Request headers.
     * @param request Http Request.
     */
    private void setHeaders(HttpRequest request) {
        if (headers != null && !headers.isEmpty()) {
            for (String hKey : headers.keySet()) {
                request.setHeader(hKey, headers.get(hKey));
            }
        }
        if (String.isBlank(request.getHeader('Content-Type'))) {
            request.setHeader('Content-Type', 'application/json');
        }
    }

    /**
     * Make the Http callout.
     * @param request Http Request.
     * @return Http Response.
     */
    private HttpResponse makeHttpCallout(HttpRequest request) {
        HttpResponse response;
        try {
            //System.debug(LoggingLevel.INFO, 'WebServiceCallout - Request Endpoint: ' + request.getEndpoint());
            //System.debug(LoggingLevel.INFO, 'WebServiceCallout - Request Method: ' + request.getMethod());
            //System.debug(LoggingLevel.INFO, 'WebServiceCallout - Request Body: ' + request.getBody());

            response = new Http().send(request);

            System.debug(LoggingLevel.INFO, 'WebServiceCallout - Response Status: ' + response.getStatus());
            System.debug(LoggingLevel.INFO, 'WebServiceCallout - Response Status Code: ' + response.getStatusCode());
            System.debug(LoggingLevel.INFO, 'WebServiceCallout - Response Body: ' + response.getBody());

        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, 'WebServiceCallout - Exception: ' + ex.getMessage());
            response = new HttpResponse();
            response.setStatus(ex.getMessage());
            response.setStatusCode(400);
        }
        //System.debug(LoggingLevel.INFO, 'Http Response: ' + response);

        return response;
    }
}