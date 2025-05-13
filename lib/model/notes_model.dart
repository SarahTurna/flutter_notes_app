class MNotes {
  String? id;
  String? userId;
  String? title;
  String? description;
  String? createdAt;

  MNotes({this.id, this.userId, this.title, this.description, this.createdAt});

  //======convert map from note ============
  factory MNotes.fromMap(Map<String, dynamic> map) {
    return MNotes(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      description: map['description'],
      createdAt: map['created_at'],
    );
  }

  //=========convert note to map======
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'created_at': createdAt,
    };
  }
}
