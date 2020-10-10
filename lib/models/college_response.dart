class CollegeResponse {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  CollegeResponse(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  CollegeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }
}

class Data {
  List<MedicalColleges> medicalColleges;
  List<String> sources;

  Data({this.medicalColleges, this.sources});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['medicalColleges'] != null) {
      medicalColleges = new List<MedicalColleges>();
      json['medicalColleges'].forEach((v) {
        medicalColleges.add(new MedicalColleges.fromJson(v));
      });
    }
    sources = json['sources'].cast<String>();
  }
}

class MedicalColleges {
  String state;
  String name;
  String city;
  String ownership;
  int admissionCapacity;
  int hospitalBeds;

  MedicalColleges(
      {this.state,
      this.name,
      this.city,
      this.ownership,
      this.admissionCapacity,
      this.hospitalBeds});

  MedicalColleges.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    name = json['name'];
    city = json['city'];
    ownership = json['ownership'];
    admissionCapacity = json['admissionCapacity'];
    hospitalBeds = json['hospitalBeds'];
  }
}
