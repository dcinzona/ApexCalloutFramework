/**
 * Created by gbell on 27/06/2019.
 */

public without sharing class WebServiceHandler {

    /**
     * Overload method for httpGetCallout.
     */
    public static String httpGetCallout(String endpointURI) {
        return httpGetCallout(endpointURI, null, null);
    }
    public static String httpGetCallout(String endpointURI, Integer timeout) {
        return httpGetCallout(endpointURI, null, timeout);
    }
    public static String httpGetCallout(String endpointURI, Map<String, String> headers) {
        return httpGetCallout(endpointURI, headers, null);
    }

    /**
     * The method to handle all GET callout.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static String httpGetCallout(String endpointURI, Map<String, String> headers, Integer timeout) {
        return getResponseBody(httpGetCalloutWithResponse(endpointURI, headers, timeout));
    }

    /**
     * Overload method for httpGetCalloutWithResponse.
     */
    public static HttpResponse httpGetCalloutWithResponse(String endpointURI) {
        return httpGetCalloutWithResponse(endpointURI, null, null);
    }
    public static HttpResponse httpGetCalloutWithResponse(String endpointURI, Integer timeout) {
        return httpGetCalloutWithResponse(endpointURI, null, timeout);
    }
    public static HttpResponse httpGetCalloutWithResponse(String endpointURI, Map<String, String> headers) {
        return httpGetCalloutWithResponse(endpointURI, headers, null);
    }

    /**
     * The method to handle GET callout, which requires info from response header and body.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param timeout The request timeout.
     * @return the HttpResponse
     */
    public static HttpResponse httpGetCalloutWithResponse(String endpointURI, Map<String, String> headers, Integer timeout) {
        System.debug('WebServiceHandler.httpGetCalloutWithResponse - URI: ' + endpointURI);
        System.debug('WebServiceHandler.httpGetCalloutWithResponse - headers: ' + headers);

        WebServiceCallout service = new WebServiceCallout(endpointURI);
        service.headers = headers;
        service.timeout = timeout;

        return service.get();
    }


    /**
     * Overload method for httpPostCallout and httpPostCalloutWithResponse.
     */
    public static String httpPostCallout(String endpointURI, String requestBody) {
        return httpPostCallout(endpointURI, null, requestBody);
    }
    public static String httpPostCallout(String endpointURI, String requestBody, Integer timeout) {
        return httpPostCallout(endpointURI, null, requestBody, timeout);
    }
    public static String httpPostCallout(String endpointURI, Map<String, String> headers, String requestBody) {
        return httpPostCallout(endpointURI, headers, requestBody, null);
    }

    /**
     * Method to handle POST callouts.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param requestBody The request body.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static String httpPostCallout(String endpointURI, Map<String, String> headers, String requestBody, Integer timeout) {
        return getResponseBody(httpPostCalloutWithResponse(endpointURI, headers, requestBody, timeout));
    }

    /**
     * Overload method for httpPostCalloutWithResponse.
     */
    public static HttpResponse httpPostCalloutWithResponse(String endpointURI, String requestBody) {
        return httpPostCalloutWithResponse(endpointURI, null, requestBody);
    }
    public static HttpResponse httpPostCalloutWithResponse(String endpointURI, String requestBody, Integer timeout) {
        return httpPostCalloutWithResponse(endpointURI, null, requestBody, timeout);
    }
    public static HttpResponse httpPostCalloutWithResponse(String endpointURI, Map<String, String> headers, String requestBody) {
        return httpPostCalloutWithResponse(endpointURI, headers, requestBody, null);
    }

    /**
     * The method to handle POST callout, which requires info from response header and body.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param requestBody The request body.
     * @param timeout The request timeout.
     * @return the HttpResponse
     */
    public static HttpResponse httpPostCalloutWithResponse(String endpointURI, Map<String, String> headers, String requestBody, Integer timeout) {
        System.debug('WebServiceHandler.httpPostCalloutWithResponse - URI: ' + endpointURI);
        System.debug('WebServiceHandler.httpPostCalloutWithResponse - Headers: ' + headers);
        System.debug('WebServiceHandler.httpPostCalloutWithResponse - Body: ' + requestBody);

        WebServiceCallout service = new WebServiceCallout(endpointURI);
        service.headers = headers;
        service.payload = requestBody;
        service.timeout = timeout;

        return service.post();
    }

    /**
    * Overload method for httpPutCallout.
    */
    public static String httpPutCallout(String endpointURI, String requestBody) {
        return httpPutCallout(endpointURI, null, requestBody);
    }
    public static String httpPutCallout(String endpointURI, String requestBody, Integer timeout) {
        return httpPutCallout(endpointURI, null, requestBody, timeout);
    }
    public static String httpPutCallout(String endpointURI, Map<String, String> headers, String requestBody) {
        return httpPutCallout(endpointURI, headers, requestBody, null);
    }

    /**
     * The method to handle all PUT callout.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param requestBody The request body.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static String httpPutCallout(String endpointURI, Map<String, String> headers, String requestBody, Integer timeout) {
        return getResponseBody(httpPutCalloutWithResponse(endpointURI, headers, requestBody, timeout));
    }

    /**
     * Overload method for httpPutCalloutWithResponse.
     */
    public static HttpResponse httpPutCalloutWithResponse(String endpointURI, String requestBody) {
        return httpPutCalloutWithResponse(endpointURI, null, requestBody);
    }
    public static HttpResponse httpPutCalloutWithResponse(String endpointURI, String requestBody, Integer timeout) {
        return httpPutCalloutWithResponse(endpointURI, null, requestBody, timeout);
    }
    public static HttpResponse httpPutCalloutWithResponse(String endpointURI, Map<String, String> headers, String requestBody) {
        return httpPutCalloutWithResponse(endpointURI, headers, requestBody, null);
    }

    /**
     * The method to handle PUT callout, which requires info from response header and body.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param requestBody The request body.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static HttpResponse httpPutCalloutWithResponse(String endpointURI, Map<String, String> headers, String requestBody, Integer timeout) {
        System.debug('WebServiceHandler.httpPutCalloutWithResponse - URI: ' + endpointURI);
        System.debug('WebServiceHandler.httpPutCalloutWithResponse - headers: ' + headers);
        System.debug('WebServiceHandler.httpPutCalloutWithResponse - Body: ' + requestBody);

        WebServiceCallout service = new WebServiceCallout(endpointURI);
        service.headers = headers;
        service.payload = requestBody;
        service.timeout = timeout;

        return service.put();
    }

    /**
     * Overload method for httpDeleteCallout.
     */
    public static String httpDeleteCallout(String endpointURI) {
        return httpDeleteCallout(endpointURI, null, null);
    }
    public static String httpDeleteCallout(String endpointURI, Integer timeout) {
        return httpDeleteCallout(endpointURI, null, timeout);
    }
    public static String httpDeleteCallout(String endpointURI, Map<String, String> headers) {
        return httpDeleteCallout(endpointURI, headers, null);
    }

    /**
     * The method to handle all DELETE callout.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static String httpDeleteCallout(String endpointURI, Map<String, String> headers, Integer timeout) {
        return getResponseBody(httpDeleteCalloutWithResponse(endpointURI, headers, timeout));
    }

    /**
     * Overload method for httpDeleteCallout.
     */
    public static HttpResponse httpDeleteCalloutWithResponse(String endpointURI) {
        return httpDeleteCalloutWithResponse(endpointURI, null, null);
    }
    public static HttpResponse httpDeleteCalloutWithResponse(String endpointURI, Integer timeout) {
        return httpDeleteCalloutWithResponse(endpointURI, null, timeout);
    }
    public static HttpResponse httpDeleteCalloutWithResponse(String endpointURI, Map<String, String> headers) {
        return httpDeleteCalloutWithResponse(endpointURI, headers, null);
    }

    /**
     * The method to handle DELETE callout, which requires info from response header and body.
     * @param endpointURI The end point URI ('http/www.webserivce/search', '/account').
     * @param headers The request header map.
     * @param timeout The request timeout.
     * @return the response body.
     */
    public static HttpResponse httpDeleteCalloutWithResponse(String endpointURI, Map<String, String> headers, Integer timeout) {
        System.debug('WebServiceHandler.httpDeleteCalloutWithResponse - URI: ' + endpointURI);
        System.debug('WebServiceHandler.httpDeleteCalloutWithResponse - headers: ' + headers);

        WebServiceCallout service = new WebServiceCallout(endpointURI);
        service.headers = headers;
        service.timeout = timeout;

        return service.del();
    }

    /**
     * This method builds the request URL based on URL and parameters.
     * @param endpointURL the endpoint Uri (http://test.com).
     * @param parameters the url parameters map.
     * @return the full URL.
     */
    public static String buildRequestURI(String endpointURL, Map<String, Object> parameters) {
        String url = String.isBlank(endpointURL) ?  '' : endpointURL;
        String queryStr = UrlUtil.buildQueryString(parameters);
        if (String.isNotBlank(queryStr)) {
            url += '?' + queryStr;
        }

        return url;
    }

    /**
     * Get the response body from HttpResponse.
     * @param response Http response.
     * @return The response body.
     */
    public static String getResponseBody(HttpResponse response) {
        String responseStr = '';
        if (response != null) {
            responseStr = String.isNotBlank(response.getBody()) ? response.getBody() : ('{"statusCode": "' + response.getStatusCode() + '", "status": "' + response.getStatus() + '"}');
        }
        return responseStr;
    }
}