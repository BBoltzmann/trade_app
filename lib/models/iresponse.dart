class IResponse<T> {
  int statusCode;
  String token, message, uuid;
  T data;
  bool success, isProfileCompleted;
  Meta meta;

  IResponse(
      {this.data,
      this.token,
      this.message,
      this.uuid,
      this.isProfileCompleted,
      this.success,
      this.statusCode});

  IResponse.fromJson(Map<String, dynamic> json, {T data}) {
    this.data = data;
    message = json['message'];
    success = json['success'];
    token = json['token'];
    uuid = json['userId'];
    isProfileCompleted = json['isProfileCompleted'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["data"] = data;
    map["token"] = token;
    map["message"] = message;
    map["userId"] = uuid;
    map["success"] = success;
    map["isProfileCompleted"] = isProfileCompleted;
    map["status_code"] = statusCode;
    return map;
  }

  @override
  String toString() {
    var map = this.toMap();
    return map.toString();
  }
}

class Meta {
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  String next;
  String previous;

  Meta({
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.next,
    this.previous,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}
