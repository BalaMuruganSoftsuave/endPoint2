class CharterList {
  List<CharterListResponseData>? data;
  String? errorFlag;
  String? message;

  CharterList({this.data, this.errorFlag, this.message});

  CharterList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CharterListResponseData>[];
      json['data'].forEach((v) {
        data!.add(CharterListResponseData.fromJson(v));
      });
    }
    errorFlag = json['error_flag'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error_flag'] = errorFlag;
    data['message'] = message;
    return data;
  }
}

class CharterListResponseData {
  String? chartererId;
  String? chartererName;
  String? tier;

  CharterListResponseData({this.chartererId, this.chartererName, this.tier});

  CharterListResponseData.fromJson(Map<String, dynamic> json) {
    chartererId = json['chartererId'];
    chartererName = json['chartererName'];
    tier = json['Tier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chartererId'] = chartererId;
    data['chartererName'] = chartererName;
    data['Tier'] = tier;
    return data;
  }
}
