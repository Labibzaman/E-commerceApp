class CreateProfile_params {
  final String firstName;
  final String CustomerAddress;
  final String mobile;
  final String city;
  final String Shipping;
  final String state;
  final String postal;
  final String country;


  CreateProfile_params( {
    required this.firstName,
    required this.CustomerAddress,
    required this.mobile,
    required this.city,
    required this.Shipping,
    required this.state,
    required this.postal,
    required this.country,
    });


Map<String,dynamic> toJson ()=>
    {
      "cus_name": firstName,
      "cus_add": CustomerAddress,
      "cus_city": city,
      "cus_state": state,
      "cus_postcode": postal,
      "cus_country": country,
      "cus_phone": mobile,
      "cus_fax": "01785388919",
      "ship_name": firstName,
      "ship_add": CustomerAddress,
      "ship_city": city,
      "ship_state": state,
      "ship_postcode": postal,
      "ship_country": country,
      "ship_phone": mobile
    };
}