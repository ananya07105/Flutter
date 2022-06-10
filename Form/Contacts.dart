class Contacts{
  String? name;
   String? phone;
   String? area;
 String? address;
   String? city;
   String? state;
   int?  zip;
   String?  email;
   String? dob;

  Contacts({this.name, this.phone, this.area, this.address, this.city, this.state, this.zip, this.email, this.dob});

  Contacts.fromMap(Map<String, dynamic> item):
        name=item["Name"], phone= item["Phone"], area=item["Area"], address=item["Address"], city=item["City"],
        state=item["State"],zip=item["Zip"],email=item["Email"],dob=item["Birthday"];

  Map<String, Object> toMap(){
    return {'Name':name??"" ,'Phone': phone??"",'Area':area??"",'Address':address??"",'City':city??"",'State':state??"",
      'Zip':zip??0,'Email':email??"",'dob':dob??0};
  }
}