class UserModel{
  String? uid;
  String? email;
  String? firstName;
  String? secondName; 

  UserModel({this.uid,this.email,this.firstName,this.secondName});

  //reciving data from server

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email:map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }
  //sending data from server

  Map<String, dynamic> tomap(){
    return{
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}