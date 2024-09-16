// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSpellsHash() => r'bd6174e541d4f7edb59416a58629e94fb9fc292a';

/// See also [getSpells].
@ProviderFor(getSpells)
final getSpellsProvider = AutoDisposeFutureProvider<List<Spell>>.internal(
  getSpells,
  name: r'getSpellsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSpellsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSpellsRef = AutoDisposeFutureProviderRef<List<Spell>>;
String _$getSpellByIdHash() => r'624db88e54cb13bc761620173852dcea2ee9469e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getSpellById].
@ProviderFor(getSpellById)
const getSpellByIdProvider = GetSpellByIdFamily();

/// See also [getSpellById].
class GetSpellByIdFamily extends Family<AsyncValue<Spell>> {
  /// See also [getSpellById].
  const GetSpellByIdFamily();

  /// See also [getSpellById].
  GetSpellByIdProvider call(
    String spellId,
  ) {
    return GetSpellByIdProvider(
      spellId,
    );
  }

  @override
  GetSpellByIdProvider getProviderOverride(
    covariant GetSpellByIdProvider provider,
  ) {
    return call(
      provider.spellId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getSpellByIdProvider';
}

/// See also [getSpellById].
class GetSpellByIdProvider extends AutoDisposeFutureProvider<Spell> {
  /// See also [getSpellById].
  GetSpellByIdProvider(
    String spellId,
  ) : this._internal(
          (ref) => getSpellById(
            ref as GetSpellByIdRef,
            spellId,
          ),
          from: getSpellByIdProvider,
          name: r'getSpellByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSpellByIdHash,
          dependencies: GetSpellByIdFamily._dependencies,
          allTransitiveDependencies:
              GetSpellByIdFamily._allTransitiveDependencies,
          spellId: spellId,
        );

  GetSpellByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.spellId,
  }) : super.internal();

  final String spellId;

  @override
  Override overrideWith(
    FutureOr<Spell> Function(GetSpellByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSpellByIdProvider._internal(
        (ref) => create(ref as GetSpellByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        spellId: spellId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Spell> createElement() {
    return _GetSpellByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSpellByIdProvider && other.spellId == spellId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, spellId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSpellByIdRef on AutoDisposeFutureProviderRef<Spell> {
  /// The parameter `spellId` of this provider.
  String get spellId;
}

class _GetSpellByIdProviderElement
    extends AutoDisposeFutureProviderElement<Spell> with GetSpellByIdRef {
  _GetSpellByIdProviderElement(super.provider);

  @override
  String get spellId => (origin as GetSpellByIdProvider).spellId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
