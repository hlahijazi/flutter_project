class task{
  final int id;
  final String title;
  final String description;
  task({this.id,this.title, this.description});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title': title,
      'description': description,
    };
  }
}