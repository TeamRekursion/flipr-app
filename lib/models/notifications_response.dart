class NotificationsResponse {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  NotificationsResponse(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }
}

class Data {
  List<Notifications> notifications;

  Data({this.notifications});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
  }
}

class Notifications {
  String title;
  String link;

  Notifications({this.title, this.link});

  Notifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
  }
}
