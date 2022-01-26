/**
 * Created by gbell on 27/06/2019.
 */

@IsTest
public class WebServiceCalloutTest {
    static String mockResponse = '{"status": "successful"}';

    static testMethod void get_ShouldMakeGETRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, mockResponse));

        WebServiceCallout service = new WebServiceCallout('');

        Test.startTest();

        HttpResponse res = service.get();

        Test.stopTest();

        String actualValue = res.getBody();
        System.assertEquals(actualValue, mockResponse);
        System.assertEquals(200, res.getStatusCode());
    }

    static testMethod void post_ShouldMakePOSTRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, mockResponse));

        WebServiceCallout service = new WebServiceCallout('');
        service.payload = '';
        service.headers = new Map<String, String> { 'Accept' => 'application/json'};

        Test.startTest();

        HttpResponse res = service.post();

        Test.stopTest();

        String actualValue = res.getBody();
        System.assertEquals(actualValue, mockResponse);
        System.assertEquals(200, res.getStatusCode());
    }

    static testMethod void put_ShouldMakePUTRequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, mockResponse));

        WebServiceCallout service = new WebServiceCallout('');
        service.payload = '';

        Test.startTest();

        HttpResponse res = service.put();

        Test.stopTest();

        String actualValue = res.getBody();
        System.assertEquals(actualValue, mockResponse);
        System.assertEquals(200, res.getStatusCode());
    }

    static testMethod void delete_ShouldMakeDELETERequest() {
        Test.setMock(HttpCalloutMock.class, new WebServiceCalloutMock(200, mockResponse));

        WebServiceCallout service = new WebServiceCallout('');

        Test.startTest();

        HttpResponse res = service.del();

        Test.stopTest();

        String actualValue = res.getBody();
        System.assertEquals(actualValue, mockResponse);
        System.assertEquals(200, res.getStatusCode());
    }

    static testMethod void testInvalidRequest() {
        WebServiceCallout service = new WebServiceCallout('/');
        service.payload = '';
        try { service.post(); }
        catch (Exception e) { System.debug(e.getStackTraceString()); }
    }
}