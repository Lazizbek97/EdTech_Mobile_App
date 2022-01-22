class ModelUdemy {
  String? url;
  String? title;
  String? description;
  List<String>? category;
  String? thumbnail;
  String? whatYouWillLearn;
  String? originalPrice;
  String? couponCode;
  String? lastUpdated;

  ModelUdemy(
      {this.url,
      this.title,
      this.description,
      this.category,
      this.thumbnail,
      this.whatYouWillLearn,
      this.originalPrice,
      this.couponCode,
      this.lastUpdated});

  ModelUdemy.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    description = json['description'];
    category = json['category'].cast<String>();
    thumbnail = json['thumbnail'];
    whatYouWillLearn = json['what_you_will_learn'];
    originalPrice = json['original_price'];
    couponCode = json['coupon_code'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['what_you_will_learn'] = this.whatYouWillLearn;
    data['original_price'] = this.originalPrice;
    data['coupon_code'] = this.couponCode;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
