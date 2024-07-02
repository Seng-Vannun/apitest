class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? contactNumber;
  String? dob;
  String? email;
  String? profilePicture;
  int? status;

  UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.contactNumber,
      this.dob,
      this.email,
      this.profilePicture,
      this.status});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    contactNumber = json['contactNumber'];
    dob = json['dob'];
    email = json['email'];
    profilePicture = json['profile_Picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['contactNumber'] = this.contactNumber;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['profile_Picture'] = this.profilePicture;
    data['status'] = this.status;
    return data;
  }
}
