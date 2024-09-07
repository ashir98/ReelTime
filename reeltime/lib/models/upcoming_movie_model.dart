import 'dart:convert';

import 'package:reeltime/models/result_model.dart';

class MovieModel {
    Dates dates;
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    MovieModel({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    MovieModel copyWith({
        Dates? dates,
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        MovieModel(
            dates: dates ?? this.dates,
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory MovieModel.fromRawJson(String str) => MovieModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    Dates copyWith({
        DateTime? maximum,
        DateTime? minimum,
    }) => 
        Dates(
            maximum: maximum ?? this.maximum,
            minimum: minimum ?? this.minimum,
        );

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
