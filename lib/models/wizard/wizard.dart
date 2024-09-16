import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wizardly_explorer/models/wizard/wizard_elixir/wizard_elixir.dart';

part 'wizard.freezed.dart';
part 'wizard.g.dart';

@Freezed()
class Wizard with _$Wizard {
  const factory Wizard({
    required String id,
    required String firstName,
    required String lastName,
    required List<WizardElixir> elixirs,
  }) = _Wizard;

  factory Wizard.fromJson(Map<String, dynamic> json) => _$WizardFromJson(json);
}
