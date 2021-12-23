import 'dart:convert';

AstrologerModel astrologerModelFromJson(String str) =>
    AstrologerModel.fromJson(json.decode(str));

String astrologerModelToJson(AstrologerModel data) =>
    json.encode(data.toJson());

class AstrologerModel {
  AstrologerModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  var httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<Astrologer>? data;

  factory AstrologerModel.fromJson(Map<String, dynamic> json) =>
      AstrologerModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<Astrologer>.from(json["data"].map((x) => Astrologer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Astrologer {
  Astrologer({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
  });

  var id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  dynamic profliePicUrl;
  var experience;
  List<Language>? languages;
  var minimumCallDuration;
  var minimumCallDurationCharges;
  var additionalPerMinuteCharges;
  bool? isAvailable;
  double? rating;
  List<Skill>? skills;
  bool? isOnCall;
  var freeMinutes;
  var additionalMinute;
  Images? images;
  Availability? availability;

  factory Astrologer.fromJson(Map<String, dynamic> json) => Astrologer(
        id: json["id"],
        urlSlug: json["urlSlug"],

        
        namePrefix: json["namePrefix"] == null ? null : json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"] == null ? null : json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: json["availability"] == null
            ? null
            : Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix == null ? null : namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe == null ? null : aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating == null ? null : rating,
        "skills": List<dynamic>.from(skills!.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images!.toJson(),
        "availability": availability == null ? null : availability!.toJson(),
      };
}

class Availability {
  Availability({
    this.days,
    this.slot,
  });

  List<String>? days;
  Slot? slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days!.map((x) => x)),
        "slot": slot!.toJson(),
      };
}

class Slot {
  Slot({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });

  String? toFormat;
  String? fromFormat;
  String? from;
  String? to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    this.small,
    this.large,
    this.medium,
  });

  Large? small;
  Large? large;
  Large? medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small!.toJson(),
        "large": large!.toJson(),
        "medium": medium!.toJson(),
      };
}

class Large {
  Large({
    this.imageUrl,
    this.id,
  });

  String? imageUrl;
  var id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "id": id == null ? null : id,
      };
}

class Language {
  Language({
    this.id,
    this.name,
  });

  var id;
  String? name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    this.id,
    this.name,
    this.description,
  });

  var id;
  String? name;
  String? description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
