class HospitalResponse {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  HospitalResponse(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  HospitalResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }
}

class Data {
  Summary summary;
  List<Sources> sources;
  List<Regional> regional;

  Data({this.summary, this.sources, this.regional});

  Data.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['sources'] != null) {
      sources = new List<Sources>();
      json['sources'].forEach((v) {
        sources.add(new Sources.fromJson(v));
      });
    }
    if (json['regional'] != null) {
      regional = new List<Regional>();
      json['regional'].forEach((v) {
        regional.add(new Regional.fromJson(v));
      });
    }
  }
}

class Summary {
  int ruralHospitals;
  int ruralBeds;
  int urbanHospitals;
  int urbanBeds;
  int totalHospitals;
  int totalBeds;

  Summary(
      {this.ruralHospitals,
      this.ruralBeds,
      this.urbanHospitals,
      this.urbanBeds,
      this.totalHospitals,
      this.totalBeds});

  Summary.fromJson(Map<String, dynamic> json) {
    ruralHospitals = json['ruralHospitals'];
    ruralBeds = json['ruralBeds'];
    urbanHospitals = json['urbanHospitals'];
    urbanBeds = json['urbanBeds'];
    totalHospitals = json['totalHospitals'];
    totalBeds = json['totalBeds'];
  }
}

class Sources {
  String url;
  String lastUpdated;

  Sources({this.url, this.lastUpdated});

  Sources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    lastUpdated = json['lastUpdated'];
  }
}

class Regional {
  String state;
  int ruralHospitals;
  int ruralBeds;
  int urbanHospitals;
  int urbanBeds;
  int totalHospitals;
  int totalBeds;
  String asOn;

  Regional(
      {this.state,
      this.ruralHospitals,
      this.ruralBeds,
      this.urbanHospitals,
      this.urbanBeds,
      this.totalHospitals,
      this.totalBeds,
      this.asOn});

  Regional.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    ruralHospitals = json['ruralHospitals'];
    ruralBeds = json['ruralBeds'];
    urbanHospitals = json['urbanHospitals'];
    urbanBeds = json['urbanBeds'];
    totalHospitals = json['totalHospitals'];
    totalBeds = json['totalBeds'];
    asOn = json['asOn'];
  }
}
