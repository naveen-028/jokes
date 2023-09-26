class HomeScreenModel {
  String? joke;

  HomeScreenModel({this.joke});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    joke = json['joke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['joke'] = joke;
    return data;
  }
}
