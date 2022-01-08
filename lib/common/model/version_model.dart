class VersionAppModel {
  int? iD;
  String? version;
  bool? obligatory;
  int? type;
  String? dateCreate;

  VersionAppModel(
      {this.iD, this.version, this.obligatory, this.type, this.dateCreate});

  VersionAppModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    version = json['Version'];
    obligatory = json['Obligatory'];
    type = json['Type'];
    dateCreate = json['DateCreate'];
  }
}
