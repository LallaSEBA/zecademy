class Person{
  int    id;
  String name;
  String username;
  String email;
  String address;
  String phone;
  String website;
  String company;
  String? pic;

  Person({required this.name,       required this.username,     
          required this.email,      required this.address,  
          required this.phone,      required this.website, 
          required this.id,         required this.company,
          required this.pic });
  
  factory Person.fromJson(Map<String, dynamic> map) {
    var adr = map['address'];
    return Person(
      name        : map['name']??'',
      username    : "@${map['username']??''}",
      email       : map['email']??'',
      address     : adr==null
                    ? ''
                    : "${adr['street']??''} ${adr['suite']??''} ${adr['city']??''} ${adr['zipcode']??''}",
      phone       : map['phone']??'',
      website     : map['website']??'',
      id          : map['id'],
      company     : map['company']?['name'],
      pic         : map['pic'],
  );}
  
  static List<Person> peopleFromList(List<dynamic> str) => List<Person>.from(str.map((x)
                             => Person.fromJson(x as Map<String, dynamic>)));
}