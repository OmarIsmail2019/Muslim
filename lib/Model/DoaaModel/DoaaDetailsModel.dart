class DoaaDetailsModel {
  int? id_doaa;
  String? category;
  String? zekr;

  DoaaDetailsModel({this.id_doaa, this.category, this.zekr});

  DoaaDetailsModel.fromJson(Map<String, dynamic> json) {
    id_doaa = json['id_doaa'];
    category = json['category'];
    zekr = json['zekr'];
  }
}
