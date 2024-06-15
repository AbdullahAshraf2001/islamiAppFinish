class RadioModel {
  RadioModel({
    List<Radio>? radios,
  }) : _radios = radios;

  RadioModel.fromJson(dynamic json) {
    if (json['radios'] != null) {
      _radios = [];
      json['radios'].forEach((v) {
        _radios?.add(Radio.fromJson(v));
      });
    }
  }

  List<Radio>? _radios;

  RadioModel copyWith({
    List<Radio>? radios,
  }) {
    return RadioModel(
      radios: radios ?? _radios,
    );
  }

  List<Radio>? get radios => _radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_radios != null) {
      map['radios'] = _radios?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Radio {
  Radio({
    num? id,
    String? name,
    String? url,
    String? recentDate,
  });

  Radio.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
    _recentDate = json['recentDate'];
  }

  num? _id;
  String? _name;
  String? _url;
  String? _recentDate;

  num? get id => _id;
  String? get name => _name;
  String? get url => _url;
  String? get recentDate => _recentDate;

  Radio copyWith({
    num? id,
    String? name,
    String? url,
    String? recentDate,
  }) {
    return Radio(
      id: id ?? _id,
      name: name ?? _name,
      url: url ?? _url,
      recentDate: recentDate ?? _recentDate,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    map['recentDate'] = _recentDate;
    return map;
  }
}
