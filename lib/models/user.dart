import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart';

@JsonSerializable()
class User {
        @JsonKey(name: 'user_id')
   int? userId;
   @JsonKey(name: 'user_name')
   String? userName;
   String? password;
   String? email;
  @JsonKey(name: 'full_name')
   String? fullName;
   String? address;
  @JsonKey(name: 'contact_no1')
   String? contactNo1;
  @JsonKey(name: 'contact_no2')
   String? contactNo2;
  @JsonKey(name: 'registration_date')
   String? registrationDate;
  @JsonKey(name: 'last_login')
   String? lastLogin;
   String? role;
  @JsonKey(name: 'identity_no')
   String? identityNo;
   String? occupation;
  @JsonKey(name: 'commercial_name')
   String? commercialName;
  @JsonKey(name: 'commercial_id')
   String? commercialID;
  @JsonKey(name: 'company_size')
   String? companySize;
  @JsonKey(name: 'manager_id')
   int? managerId;
   bool? isActive;

  User(
      {
      this.userId,
      this.userName,
      this.password,
      this.email,
      this.fullName,
      this.address,
      this.contactNo1,
      this.contactNo2,
      this.registrationDate,
      this.lastLogin,
      this.role,
      this.identityNo,
      this.managerId,
      this.occupation,
      this.commercialID,
      this.commercialName,
      this.companySize,
      this.isActive,
      });

  // factory User.fromJson(Map<String, dynamic> json) =>
  //     _$UserFromJson(json);

  // Map<String, dynamic> toJson() => _$UserToJson(this);
}
