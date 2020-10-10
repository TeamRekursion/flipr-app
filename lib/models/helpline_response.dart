class HelplineResponse {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  HelplineResponse(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  HelplineResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }
}

class Data {
  Contacts contacts;

  Data({this.contacts});

  Data.fromJson(Map<String, dynamic> json) {
    contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
  }
}

class Contacts {
  Primary primary;
  List<Regional> regional;

  Contacts({this.primary, this.regional});

  Contacts.fromJson(Map<String, dynamic> json) {
    primary =
        json['primary'] != null ? new Primary.fromJson(json['primary']) : null;
    if (json['regional'] != null) {
      regional = new List<Regional>();
      json['regional'].forEach((v) {
        regional.add(new Regional.fromJson(v));
      });
    }
  }
}

class Primary {
  String number;
  String numberTollfree;
  String email;
  String twitter;
  String facebook;
  List<String> media;

  Primary(
      {this.number,
      this.numberTollfree,
      this.email,
      this.twitter,
      this.facebook,
      this.media});

  Primary.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberTollfree = json['number-tollfree'];
    email = json['email'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    media = json['media'].cast<String>();
  }
}

class Regional {
  String loc;
  String number;

  Regional({this.loc, this.number});

  Regional.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    number = json['number'];
  }
}
