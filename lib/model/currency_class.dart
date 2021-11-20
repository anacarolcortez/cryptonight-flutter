class Currency {
  Currency({
    required this.cripto,
  });
  late final Cripto cripto;

  Currency.fromJson(Map<String, dynamic> json) {
    cripto = Cripto.fromJson(json['Cripto']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Cripto'] = cripto.toJson();
    return _data;
  }
}

class Cripto {
  Cripto({
    required this.code,
    required this.name,
    required this.pctChange,
    required this.bid,
  });

  late final String code;
  late final String name;
  late final String pctChange;
  late final String bid;

  Cripto.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    pctChange = json['pctChange'];
    bid = json['bid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['name'] = name;
    _data['pctChange'] = pctChange;
    _data['bid'] = bid;
    return _data;
  }
}
