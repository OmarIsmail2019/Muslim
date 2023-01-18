class AzkarDataItem {
  int? id;
  String? name;

  AzkarDataItem({this.id, this.name});

  AzkarDataItem.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
  }

}





