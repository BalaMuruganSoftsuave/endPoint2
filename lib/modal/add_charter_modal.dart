class AddCharter {
  String? name;
  String? email;
  String? address1;
  String? address2;
  String? state;
  String? city;
  String? country;
  String? website;
  String? contactPerson;
  String? phoneNumber;

  AddCharter(
      {this.name,
        this.email,
        this.address1,
        this.address2,
        this.state,
        this.city,
        this.country,
        this.website,
        this.contactPerson,
        this.phoneNumber});

  AddCharter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    website = json['website'];
    contactPerson = json['contactPerson'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['address1'] = address1;
    data['address2'] = address2;
    data['state'] = state;
    data['city'] = city;
    data['country'] = country;
    data['website'] = website;
    data['contactPerson'] = contactPerson;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}