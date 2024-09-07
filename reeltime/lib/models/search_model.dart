import 'dart:convert';

import 'package:reeltime/models/result_model.dart';

class SearchModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    SearchModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    SearchModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        SearchModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory SearchModel.fromRawJson(String str) => SearchModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
