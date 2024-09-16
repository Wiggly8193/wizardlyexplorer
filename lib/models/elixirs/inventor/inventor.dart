import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventor.freezed.dart';
part 'inventor.g.dart';

@Freezed()
class Inventor with _$Inventor {
  const factory Inventor({
    required String id,
    required String firstName,
    required String lastName,
  }) = _Inventor;

  factory Inventor.fromJson(Map<String, dynamic> json) =>
      _$InventorFromJson(json);
}
