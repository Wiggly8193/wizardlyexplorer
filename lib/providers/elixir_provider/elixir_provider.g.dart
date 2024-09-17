// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elixir_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getElixirsHash() => r'425630a4fb094d3c937abea02788477f5b1fd420';

/// See also [getElixirs].
@ProviderFor(getElixirs)
final getElixirsProvider = AutoDisposeFutureProvider<List<Elixirs>>.internal(
  getElixirs,
  name: r'getElixirsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getElixirsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetElixirsRef = AutoDisposeFutureProviderRef<List<Elixirs>>;
String _$getElixirsByIdHash() => r'70d67a412bde9abf1abe5d09f097bb2226a56d18';

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

/// See also [getElixirsById].
@ProviderFor(getElixirsById)
const getElixirsByIdProvider = GetElixirsByIdFamily();

/// See also [getElixirsById].
class GetElixirsByIdFamily extends Family<AsyncValue<Elixirs>> {
  /// See also [getElixirsById].
  const GetElixirsByIdFamily();

  /// See also [getElixirsById].
  GetElixirsByIdProvider call(
    String elixirId,
  ) {
    return GetElixirsByIdProvider(
      elixirId,
    );
  }

  @override
  GetElixirsByIdProvider getProviderOverride(
    covariant GetElixirsByIdProvider provider,
  ) {
    return call(
      provider.elixirId,
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
  String? get name => r'getElixirsByIdProvider';
}

/// See also [getElixirsById].
class GetElixirsByIdProvider extends AutoDisposeFutureProvider<Elixirs> {
  /// See also [getElixirsById].
  GetElixirsByIdProvider(
    String elixirId,
  ) : this._internal(
          (ref) => getElixirsById(
            ref as GetElixirsByIdRef,
            elixirId,
          ),
          from: getElixirsByIdProvider,
          name: r'getElixirsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getElixirsByIdHash,
          dependencies: GetElixirsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetElixirsByIdFamily._allTransitiveDependencies,
          elixirId: elixirId,
        );

  GetElixirsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elixirId,
  }) : super.internal();

  final String elixirId;

  @override
  Override overrideWith(
    FutureOr<Elixirs> Function(GetElixirsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetElixirsByIdProvider._internal(
        (ref) => create(ref as GetElixirsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elixirId: elixirId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Elixirs> createElement() {
    return _GetElixirsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetElixirsByIdProvider && other.elixirId == elixirId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elixirId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetElixirsByIdRef on AutoDisposeFutureProviderRef<Elixirs> {
  /// The parameter `elixirId` of this provider.
  String get elixirId;
}

class _GetElixirsByIdProviderElement
    extends AutoDisposeFutureProviderElement<Elixirs> with GetElixirsByIdRef {
  _GetElixirsByIdProviderElement(super.provider);

  @override
  String get elixirId => (origin as GetElixirsByIdProvider).elixirId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
