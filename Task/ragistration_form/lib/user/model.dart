
class Model
{
  int? id;
  String url;

  Model({this.id,required this.url});

  factory Model.formMap(Map<String,dynamic> json) =>
      Model(id: json["id"],url: json["url"]);

  Map<String,dynamic> toMap() =>{
    "id":id,
    "url":url,
  };
}