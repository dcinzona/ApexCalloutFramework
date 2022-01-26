/**
 * Created by gbell on 27/06/2019.
 */

@IsTest
private class WebServiceHandlerTest {

    static testMethod void httpGetCallout_ShouldMakeRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, '{}'));

        Test.startTest();

        String response = WebServiceHandler.httpGetCallout('/account/123456');

        Test.stopTest();

        System.assert(String.isNotBlank(response));

        WebServiceHandler.httpGetCallout('/account/123456', 10);
        WebServiceHandler.httpGetCallout('/account/123456', new Map<String, String>());
        WebServiceHandler.httpGetCalloutWithResponse('/account/123456');
        WebServiceHandler.httpGetCalloutWithResponse('/account/123456', 10);
        WebServiceHandler.httpGetCalloutWithResponse('/account/123456', new Map<String, String>());
    }

    static testMethod void httpPostCallout_ShouldMakeRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, '{}'));

        Test.startTest();

        String response = WebServiceHandler.httpPostCallout('/account', '{}');

        Test.stopTest();

        System.assert(String.isNotBlank(response));

        WebServiceHandler.httpPostCallout('/account', '{}', 10);
        WebServiceHandler.httpPostCalloutWithResponse('/account', '{}');
        WebServiceHandler.httpPostCalloutWithResponse('/account', '{}', 10);
    }

    static testMethod void httpPutCallout_ShouldMakeRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, '{}'));

        Test.startTest();

        String response = WebServiceHandler.httpPutCallout('/account/123456', '{}');

        Test.stopTest();

        System.assert(String.isNotBlank(response));

        WebServiceHandler.httpPutCallout('/account/123456', '{}', 10);
        WebServiceHandler.httpPutCalloutWithResponse('/account/123456', '{}');
        WebServiceHandler.httpPutCalloutWithResponse('/account/123456', '{}', 10);
    }

    static testMethod void httpDeleteCallout_ShouldMakeRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, '{}'));

        Map<String, Object> parameters = new Map<String, Object>();
        parameters.put('id', '12345');

        Test.startTest();

        String endpoint = WebServiceHandler.buildRequestURI('/account', parameters);
        String response = WebServiceHandler.httpDeleteCallout(endpoint);

        Test.stopTest();

        System.assert(String.isNotBlank(response));

        WebServiceHandler.httpDeleteCallout(endpoint, 10);
        WebServiceHandler.httpDeleteCallout(endpoint, new Map<String, String>());
        WebServiceHandler.httpDeleteCalloutWithResponse(endpoint);
        WebServiceHandler.httpDeleteCalloutWithResponse(endpoint, 10);
        WebServiceHandler.httpDeleteCalloutWithResponse(endpoint, new Map<String, String>());
    }
}