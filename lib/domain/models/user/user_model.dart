// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

class User {
  User(
      {this.Id,
      this.Name,
      this.LastName,
      this.Email,
      this.RegistrationDate,
      this.Phone,
      this.ProfilePhoto,
      this.IsActive,
      this.InvitationCode,
      this.VirtualWallet,
      this.BirthDate,
      this.MarketId,
      this.Admin,
      this.Address,
      this.Gender,
      this.TypeUser,
      this.LicenseValidity,
      this.AccountNumber,
      this.Coordinator,
      this.IdCity,
      this.haveDatafono,
      this.IdMarket,
      this.Verified,
      this.Id_Old,
      this.TokenPush,
      this.Longitude,
      this.Latitude,
      this.Instructions,
      this.Password,
      this.IsDeleted});

  int? Id;
  String? Name;
  String? LastName;
  String? Email;
  String? RegistrationDate;
  String? Phone;
  String? ProfilePhoto;
  bool? IsActive;
  String? InvitationCode;
  int? VirtualWallet;
  String? BirthDate;
  int? MarketId;
  bool? Admin;
  String? Address;
  int? Gender;
  int? TypeUser;
  String? LicenseValidity;
  String? AccountNumber;
  String? Coordinator;
  int? IdCity;
  bool? haveDatafono;
  String? IdMarket;
  bool? Verified;
  String? Id_Old;
  String? TokenPush;
  String? Longitude;
  String? Latitude;
  String? Instructions;
  String? Password;
  bool? IsDeleted;
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        Id: json["Id"],
        Name: json["Name"],
        LastName: json["LastName"],
        Email: json["Email"],
        RegistrationDate: json["RegistrationDate"],
        Phone: json["Phone"],
        ProfilePhoto: json["ProfilePhoto"],
        IsActive: json["IsActive"],
        InvitationCode: json["InvitationCode"],
        VirtualWallet: json["VirtualWallet"],
        BirthDate: json["BirthDate"],
        MarketId: json["MarketId"],
        Admin: json["Admin"],
        Address: json["Address"],
        Gender: json["Gender"],
        TypeUser: json["TypeUser"],
        LicenseValidity: json["LicenseValidity"],
        AccountNumber: json["AccountNumber"],
        Coordinator: json["Coordinator"],
        IdCity: json["IdCity"],
        haveDatafono: json["haveDatafono"],
        IdMarket: json["IdMarket"],
        Verified: json["Verified"],
        Id_Old: json["Id_Old"],
        TokenPush: json["TokenPush"],
        Longitude: json["Longitude"],
        Latitude: json["Latitude"],
        Instructions: json["Instructions"],
        Password: json["Password"],
        IsDeleted: json["IsDeleted"],
      );

  Map<String, dynamic> toMap() => {
        "Id": Id,
        "Name": Name,
        "LastName": LastName,
        "Email": Email,
        "RegistrationDate": RegistrationDate,
        "Phone": Phone,
        "ProfilePhoto": ProfilePhoto,
        "IsActive": IsActive,
        "InvitationCode": InvitationCode,
        "VirtualWallet": VirtualWallet,
        "BirthDate": BirthDate,
        "MarketId": MarketId,
        "Admin": Admin,
        "Address": Address,
        "Gender": Gender,
        "TypeUser": TypeUser,
        "LicenseValidity": LicenseValidity,
        "AccountNumber": AccountNumber,
        "Coordinator": Coordinator,
        "IdCity": IdCity,
        "haveDatafono": haveDatafono,
        "IdMarket": IdMarket,
        "Verified": Verified,
        "Id_Old": Id_Old,
        "TokenPush": TokenPush,
        "Longitude": Longitude,
        "Latitude": Latitude,
        "Instructions": Instructions,
        "Password": Password,
        "IsDeleted": IsDeleted,
      };
}
