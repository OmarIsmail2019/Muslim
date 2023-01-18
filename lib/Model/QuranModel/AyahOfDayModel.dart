class AyahOfDayModel{
  String? arText;
  int? surNumber;

  AyahOfDayModel.fromJson(Map<String,dynamic>json){
    arText=json['data'][0]['text'];
    surNumber=json['data'][2]['numberInSurah'];
  }
}