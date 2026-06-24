class LandMarkResponse {
  final List<Landmark> landmarks;

  const LandMarkResponse({required this.landmarks});
  factory LandMarkResponse.fromJson(Map<String, dynamic> json) {
    final listData = json['landmarks'] ?? json['data'];
    return LandMarkResponse(
      landmarks:
          (listData as List?)
              ?.map((e) => Landmark.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class Landmark {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descAr;
  final String descEn;
  final double lat;
  final double lng;
  final String address;
  final String addressEn;
  final Category category;
  final List<LandmarkImage> images;
  final List<WorkingHour> workingHours;

  Landmark({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descAr,
    required this.descEn,
    required this.lat,
    required this.lng,
    required this.address,
    required this.addressEn,
    required this.category,
    required this.images,
    required this.workingHours,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      descAr: json['desc_ar'] ?? '',
      descEn: json['desc_en'] ?? '',
      lat: double.tryParse(json['lat']?.toString() ?? '') ?? 0.0,
      lng: double.tryParse(json['lng']?.toString() ?? '') ?? 0.0,
      address: json['address'] ?? '',
      addressEn: json['address_en'] ?? '',
      category: Category.fromJson(json['category'] ?? {}),
      images:
          (json['images'] as List?)
              ?.map((e) => LandmarkImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workingHours:
          (json['workinghours'] as List?)
              ?.map((e) => WorkingHour.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class Category {
  final int id;
  final String nameAr;
  final String nameEn;

  Category({required this.id, required this.nameAr, required this.nameEn});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }
}

class LandmarkImage {
  final String image;

  LandmarkImage({required this.image});

  factory LandmarkImage.fromJson(Map<String, dynamic> json) {
    return LandmarkImage(image: json['image'] ?? '');
  }
}

class WorkingHour {
  final String day;
  final String openTime;
  final String closeTime;

  WorkingHour({
    required this.day,
    required this.openTime,
    required this.closeTime,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) {
    return WorkingHour(
      day: json['day'] ?? '',
      openTime: json['open_time'] ?? '',
      closeTime: json['close_time'] ?? '',
    );
  }
}
