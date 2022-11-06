class Data {
  String uid;
  String email;
  String name;

  Data({
    required this.uid,
    required this.email,  
    required this.name,

  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,

    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }
}