class CreateProfile_params {
  final String firstName;
  final String lastName;
  final String mobile;
  final String city;
  final String Shipping;


  CreateProfile_params({required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.city,
    required this.Shipping,
    });


Map<String,dynamic> toJson ()=>
    {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "city": city,
      "shippingAddress": Shipping
    };
}