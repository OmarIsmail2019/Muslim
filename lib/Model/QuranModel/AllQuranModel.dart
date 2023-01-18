class AllQuran {
  int? code;
  String? status;
  DataQuran? data;

  AllQuran.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataQuran.fromJson(json['data']) : null;
  }

}

class DataQuran {
  List<SurahsOfQuranModel>? surahs;

  DataQuran.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = <SurahsOfQuranModel>[];
      json['surahs'].forEach((v) {
        surahs?.add(SurahsOfQuranModel.fromJson(v));
      });
    }
  }
}

class SurahsOfQuranModel {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  SurahsOfQuranModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
  }

}

class Ayahs {
  int? number;
  String? audio;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  dynamic sajda;

  Ayahs(
      {required this.number,
        this.audio,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    audio = json['audio'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

}
