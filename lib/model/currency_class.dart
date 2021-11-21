class Currency {
  Currency({
    required this.currencydata,
  });
  late final Currencydata currencydata;

  factory Currency.fromJson(Map<String, dynamic> json, String currencyLabel) {
    return Currency(currencydata: Currencydata.fromJson(json[currencyLabel]));
    //o problema é que a String vem com nome que varia conforme a moeda
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currencydata'] = currencydata.toJson();
    return _data;
  }
}

class Currencydata {
  Currencydata({
    required this.code,
    required this.codein,
    required this.name,
    required this.high,
    required this.low,
    required this.varBid,
    required this.pctChange,
    required this.bid,
    required this.ask,
    required this.timestamp,
    required this.createDate,
  });
  late final String code;
  late final String codein;
  late final String name;
  late final String high;
  late final String low;
  late final String varBid;
  late final String pctChange;
  late final String bid;
  late final String ask;
  late final String timestamp;
  late final String createDate;

  factory Currencydata.fromJson(Map<String, dynamic> json) {
    return Currencydata(
        code: json['code'],
        codein: json['codein'],
        name: json['name'],
        high: json['high'],
        low: json['low'],
        varBid: json['varBid'],
        pctChange: json['pctChange'],
        bid: json['bid'],
        ask: json['ask'],
        timestamp: json['timestamp'],
        createDate: json['create_date']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['codein'] = codein;
    _data['name'] = name;
    _data['high'] = high;
    _data['low'] = low;
    _data['varBid'] = varBid;
    _data['pctChange'] = pctChange;
    _data['bid'] = bid;
    _data['ask'] = ask;
    _data['timestamp'] = timestamp;
    _data['create_date'] = createDate;
    return _data;
  }
}
