import 'dart:convert';

import 'package:reeltime/models/result_model.dart';

class MovieByGenreModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    MovieByGenreModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    MovieByGenreModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        MovieByGenreModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory MovieByGenreModel.fromRawJson(String str) => MovieByGenreModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieByGenreModel.fromJson(Map<String, dynamic> json) => MovieByGenreModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}
