import 'package:freezed_annotation/freezed_annotation.dart';

part 'wizard_elixir.freezed.dart';
part 'wizard_elixir.g.dart';

@freezed
class WizardElixir with _$WizardElixir {
  const factory WizardElixir({
    required String id,
    required String name,
  }) = _WizardElixir;

  factory WizardElixir.fromJson(Map<String, dynamic> json) =>
      _$WizardElixirFromJson(json);
}
