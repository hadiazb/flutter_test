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
        Name: json["Name"],
        LastName: json["LastName"],
        Email: json["Email"],
        Phone: json["Phone"],
        Id: json["Id"],
        RegistrationDate: json["RegistrationDate"],
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
        "Name": Name,
        "LastName": LastName,
        "Phone": Phone,
        // "Id": Id == null ? null : Id,
        // "Email": Email == null ? null : Email,
        // "RegistrationDate": RegistrationDate == null ? null : RegistrationDate,
        // "ProfilePhoto": ProfilePhoto == null ? null : ProfilePhoto,
        // "IsActive": IsActive == null ? null : IsActive,
        // "InvitationCode": InvitationCode == null ? null : InvitationCode,
        // "VirtualWallet": VirtualWallet == null ? null : VirtualWallet,
        // "BirthDate": BirthDate == null ? null : BirthDate,
        // "MarketId": MarketId == null ? null : MarketId,
        // "Admin": Admin == null ? null : Admin,
        // "Address": Address == null ? null : Address,
        // "Gender": Gender == null ? null : Gender,
        // "TypeUser": TypeUser == null ? null : TypeUser,
        // "LicenseValidity": LicenseValidity == null ? null : LicenseValidity,
        // "AccountNumber": AccountNumber == null ? null : AccountNumber,
        // "Coordinator": Coordinator == null ? null : Coordinator,
        // "IdCity": IdCity == null ? null : IdCity,
        // "haveDatafono": haveDatafono == null ? null : haveDatafono,
        // "IdMarket": IdMarket == null ? null : IdMarket,
        // "Verified": Verified == null ? null : Verified,
        // "Id_Old": Id_Old == null ? null : Id_Old,
        // "TokenPush": TokenPush == null ? null : TokenPush,
        // "Longitude": Longitude == null ? null : Longitude,
        // "Latitude": Latitude == null ? null : Latitude,
        // "Instructions": Instructions == null ? null : Instructions,
        // "Password": Password == null ? null : Password,
        // "IsDeleted": IsDeleted == null ? null : IsDeleted,
      };
}
