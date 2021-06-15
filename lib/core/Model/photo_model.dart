class PhotoModel {
  PhotoModel({
    this.id,
    this.photo,
    this.v,
  });

  String? id;
  String? photo;
  int? v;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        id: json["_id"],
        photo: json["photo"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "photo": photo,
        "__v": v,
      };
  static List<PhotoModel> fromJsonList(List list) {
    return list.map((item) => PhotoModel.fromJson(item)).toList();
  }
}
