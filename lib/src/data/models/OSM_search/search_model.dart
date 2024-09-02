import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class OSMSearch with _$OSMSearch {
  const factory OSMSearch(
      {required int? place_id,
      required String? licence,
      required String? osm_type,
      required int? osm_id,
      required String? lat,
      required String? lon,
      required String? type,
      required int? place_rank,
      required double? importance,
      required String? addresstype,
      required String? name,
      required String? display_name,
      required List<String>? boundingbox}) = _OSMSearch;

  factory OSMSearch.fromJson(Map<String, dynamic> json) =>
      _$OSMSearchFromJson(json);
}
