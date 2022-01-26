/**
 * Created by gbell on 19/03/2020.
 */

public without sharing class WebServiceHelper {

    @TestVisible
    private static Map<String, API_Setting__mdt> apiSettingMap = new Map<String, API_Setting__mdt>();

    public static Map<String, String> getMuleHeaders() {
        B2B_Hub_Settings__c settings = B2B_Hub_Settings__c.getInstance();
        return new Map<String, String> {
            'Content-Type' => 'application/json;charset=UTF-8',
            'client_id' => (settings != null && String.isNotBlank(settings.API_Client_ID__c)) ? settings.API_Client_ID__c : '',
            'client_secret' => (settings != null && String.isNotBlank(settings.API_Client_Secret__c)) ? settings.API_Client_Secret__c : ''
        };
    }

    public static API_Setting__mdt getApiSetting(String settingName) {
        if (settingName != null && !apiSettingMap.containsKey(settingName)) {
            buildApiSettingMap(settingName);
        }
        return (settingName != null && apiSettingMap.containsKey(settingName)) ? apiSettingMap.get(settingName) : null;
    }

    //Convert seconds Value of Timeout to milliseconds
    public static Integer getTimeout(Decimal seconds) {
        return (seconds != null && seconds > 0) ? (seconds > 120 ? 120 : Integer.valueOf(seconds)) * 1000 : null;
    }

    private static void buildApiSettingMap(String settingName) {
        settingName = (settingName != null) ? (settingName.split('_')[0] + '%') : '%';
        for (API_Setting__mdt apiSetting : [SELECT Id, QualifiedApiName, Endpoint__c, Timeout__c, Active__c
                FROM API_Setting__mdt WHERE Active__c = TRUE AND QualifiedApiName LIKE :settingName LIMIT 100]) {
            apiSettingMap.put(apiSetting.QualifiedApiName, apiSetting);
        }
    }

}