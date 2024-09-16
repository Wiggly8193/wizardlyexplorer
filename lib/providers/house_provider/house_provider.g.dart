// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHousesHash() => r'af2e738f3ae8873cdd6f5629fb1a5a3a52664a79';

/// See also [getHouses].
@ProviderFor(getHouses)
final getHousesProvider = AutoDisposeFutureProvider<List<Houses>>.internal(
  getHouses,
  name: r'getHousesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getHousesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHousesRef = AutoDisposeFutureProviderRef<List<Houses>>;
String _$getHousesByIdHash() => r'364820db468850729eb96e13304f03e12fc7c6d4';

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

/// See also [getHousesById].
@ProviderFor(getHousesById)
const getHousesByIdProvider = GetHousesByIdFamily();

/// See also [getHousesById].
class GetHousesByIdFamily extends Family<AsyncValue<Houses>> {
  /// See also [getHousesById].
  const GetHousesByIdFamily();

  /// See also [getHousesById].
  GetHousesByIdProvider call(
    String houseId,
  ) {
    return GetHousesByIdProvider(
      houseId,
    );
  }

  @override
  GetHousesByIdProvider getProviderOverride(
    covariant GetHousesByIdProvider provider,
  ) {
    return call(
      provider.houseId,
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
  String? get name => r'getHousesByIdProvider';
}

/// See also [getHousesById].
class GetHousesByIdProvider extends AutoDisposeFutureProvider<Houses> {
  /// See also [getHousesById].
  GetHousesByIdProvider(
    String houseId,
  ) : this._internal(
          (ref) => getHousesById(
            ref as GetHousesByIdRef,
            houseId,
          ),
          from: getHousesByIdProvider,
          name: r'getHousesByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHousesByIdHash,
          dependencies: GetHousesByIdFamily._dependencies,
          allTransitiveDependencies:
              GetHousesByIdFamily._allTransitiveDependencies,
          houseId: houseId,
        );

  GetHousesByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.houseId,
  }) : super.internal();

  final String houseId;

  @override
  Override overrideWith(
    FutureOr<Houses> Function(GetHousesByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHousesByIdProvider._internal(
        (ref) => create(ref as GetHousesByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        houseId: houseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Houses> createElement() {
    return _GetHousesByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHousesByIdProvider && other.houseId == houseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, houseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetHousesByIdRef on AutoDisposeFutureProviderRef<Houses> {
  /// The parameter `houseId` of this provider.
  String get houseId;
}

class _GetHousesByIdProviderElement
    extends AutoDisposeFutureProviderElement<Houses> with GetHousesByIdRef {
  _GetHousesByIdProviderElement(super.provider);

  @override
  String get houseId => (origin as GetHousesByIdProvider).houseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
