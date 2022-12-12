class SocialUserModel{
  late String name;
  late String email;
  late String phone;
  late String uid;
  SocialUserModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.email

});
  SocialUserModel.fromjson(Map<String,dynamic>json)
  {
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uid=json['uid'];

  }
  Map<String,dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,


    };
  }
}