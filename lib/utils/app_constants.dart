class AppConstants {
  static const String appName = 'DBFood';
  static const int appVersion = 1;
  //https://youtu.be/HCUZ91NVnaM learn here how to set up google map api key
  static const String mapAPIKey="your google map api key";
  static const String storePreference='Cart-list';
  static const String cartHistoryList='Cart-history-list';
  //your base url
  //https://youtu.be/DjXS9W1HD9U here how to set up the admin panel
  static const String baseUrl = 'http://mvs.bslmeiyu.com';
  static const String registerUri = '/api/v1/auth/register';
  static const String loginUri = '/api/v1/auth/login';
  static const String tokenUri = '/api/v1/customer/cm-firebase-token';
  static const String topic = 'all_zone_customer';
  static const String zoneId = 'zoneId';
  static const String uploadsUrl =baseUrl+'/uploads/';

  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String userCountryCode = 'user_country_code';
  static const String customerInfoUri = '/api/v1/customer/info';
  static const String addressListUri = '/api/v1/customer/address/list';
  static const String zoneUri = '/api/v1/config/get-zone-id';
  static const String removeAddressUri = '/api/v1/customer/address/delete?address_id=';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';
  static const String placeDetailsUri = '/api/v1/config/place-api-details';
  static const String placeOrderUri = '/api/v1/customer/order/place';
  static const String geocodeUri = '/api/v1/config/geocode-api';

  static const String popularProductUri = '/api/v1/products/popular';
  static const String token = 'dbshop_token';
  static const String recommendedProductUri = '/api/v1/products/recommended';
  static const String recommendedProductUriTest = '/api/v1/products/test';
  static const String orderListUri = '/api/v1/customer/order/list';
  static const String orderCancelUri = '/api/v1/customer/order/cancel';
  static const String codSwitchUri = '/api/v1/customer/order/payment-method';
  static const String orderDetailsUri = '/api/v1/customer/order/details?order_id=';
  static const String trackUri = '/api/v1/customer/order/track?order_id=';

}