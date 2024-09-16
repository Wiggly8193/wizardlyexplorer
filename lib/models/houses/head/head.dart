import 'package:freezed_annotation/freezed_annotation.dart';

part 'head.freezed.dart';
part 'head.g.dart';

@Freezed()
class Head with _$Head {
  const factory Head({
    required String id,
    required String firstName,
    required String lastName,
  }) = _Head;

  factory Head.fromJson(Map<String, dynamic> json) => _$HeadFromJson(json);
}
