/**
 * Created by gbell on 19/03/2020.
 */

@IsTest
private class WebServiceHelperTest {

    static testMethod void testGetApiSetting() {
        TestDataFactory.createB2BHubSettings('default', true);

        Map<String, String> headers = WebServiceHelper.getMuleHeaders();
        System.assertNotEquals(headers.isEmpty(), true);

        API_Setting__mdt apiSetting = WebServiceHelper.getApiSetting('Test Setting');
        System.assertEquals(apiSetting, null);

        API_Setting__mdt newSetting = (API_Setting__mdt) JSON.deserialize('{"Label": "Test' + Datetime.now().getTime() +
                '","DeveloperName" : "Test' + Datetime.now().getTime() + '", "Endpoint__c" : "http://example.com"}', API_Setting__mdt.class);
        WebServiceHelper.apiSettingMap.put(newSetting.DeveloperName, newSetting);

        apiSetting = WebServiceHelper.getApiSetting(newSetting.DeveloperName);
        System.assertNotEquals(apiSetting, null);

        Integer timeout = WebServiceHelper.getTimeout(5.0);
        System.assertEquals(timeout, 5000);
        timeout = WebServiceHelper.getTimeout(-1.0);
        System.assertEquals(timeout, null);
    }
}