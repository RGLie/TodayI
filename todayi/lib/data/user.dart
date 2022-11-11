class TUser {
  String uid;
  String email;
  String name;

  TUser({
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

  factory TUser.fromMap(Map<String, dynamic>? map) {
    return TUser(
      uid: map!['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
      };
}