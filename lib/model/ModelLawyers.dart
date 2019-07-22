class ModelLawyers {
  String user_id;
  String Office;
  String city;
  String officename;
  String work_fields;
  String address_info;
  String pdf_docs;
  String profile_photo = 'assets/images/icon.png';
  String cover_photo = 'assets/images/icon.png';

  ModelLawyers(
      {this.user_id,
      this.Office,
      this.city,
      this.officename,
      this.work_fields,
      this.address_info,
      this.pdf_docs,
      this.profile_photo,
      this.cover_photo});

  factory ModelLawyers.fromJson(Map<String, dynamic> json) {
    return ModelLawyers(
      user_id: json['user_id'] as String,
      Office: json['Office'] as String,
      city: json['city'] as String,
      officename: json['officename'] as String,
      work_fields: json['work_fields'] as String,
      address_info: json['address_info'] as String,
      pdf_docs: json['pdf_docs'] as String,
      profile_photo: json['profile_photo'] as String,
      cover_photo: json['cover_photo'] as String,
    );
  }
}
