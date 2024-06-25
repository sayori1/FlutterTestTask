import 'dart:convert';

class GetCitiesBody {
  String keyword;

  GetCitiesBody({
    required this.keyword,
  });

  
  Map<String, dynamic> toApi() {
    return toMap();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'keyword': keyword,
    };
  }

  factory GetCitiesBody.fromMap(Map<String, dynamic> map) {
    return GetCitiesBody(
      keyword: map['keyword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCitiesBody.fromJson(String source) => GetCitiesBody.fromMap(json.decode(source) as Map<String, dynamic>);
}
