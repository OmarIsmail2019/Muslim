class DetailsModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;

  DetailsModel(
      {this.sectionId,
        this.count,
        this.description,
        this.reference,
        this.content});

  DetailsModel.fromJson(Map<String,dynamic>json){
    sectionId=json['section_id'];
    count=json['count'];
    description=json['description'];
    reference=json['reference'];
    content=json['content'];
  }
}