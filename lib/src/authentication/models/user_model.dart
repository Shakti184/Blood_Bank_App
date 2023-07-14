class UserModel{
  final String? id;
  final String fullName;
  final String bloodGroup;
  final String mobileNum;

  const UserModel({
    this.id,
    required this.bloodGroup,
    required this.fullName,
    required this.mobileNum,
  });
  toJson(){
    return{
      "FullName":fullName,
      "BloodGroup":bloodGroup,
      "MoblieNum":mobileNum,
    };
  }
}