// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_family_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoDisposeFamilyHash() => r'6ba7d13b737d180c1e61e2926982330e4c115e12';

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

/// See also [autoDisposeFamily].
@ProviderFor(autoDisposeFamily)
const autoDisposeFamilyProvider = AutoDisposeFamilyFamily();

/// See also [autoDisposeFamily].
class AutoDisposeFamilyFamily extends Family<String> {
  /// See also [autoDisposeFamily].
  const AutoDisposeFamilyFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'autoDisposeFamilyProvider';

  /// See also [autoDisposeFamily].
  AutoDisposeFamilyProvider call({
    required String there,
  }) {
    return AutoDisposeFamilyProvider(
      there: there,
    );
  }

  @visibleForOverriding
  @override
  AutoDisposeFamilyProvider getProviderOverride(
    covariant AutoDisposeFamilyProvider provider,
  ) {
    return call(
      there: provider.there,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(String Function(AutoDisposeFamilyRef ref) create) {
    return _$AutoDisposeFamilyFamilyOverride(this, create);
  }
}

class _$AutoDisposeFamilyFamilyOverride implements FamilyOverride<String> {
  _$AutoDisposeFamilyFamilyOverride(this.overriddenFamily, this.create);

  final String Function(AutoDisposeFamilyRef ref) create;

  @override
  final AutoDisposeFamilyFamily overriddenFamily;

  @override
  AutoDisposeFamilyProvider getProviderOverride(
    covariant AutoDisposeFamilyProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [autoDisposeFamily].
class AutoDisposeFamilyProvider extends AutoDisposeProvider<String> {
  /// See also [autoDisposeFamily].
  AutoDisposeFamilyProvider({
    required String there,
  }) : this._internal(
          (ref) => autoDisposeFamily(
            ref as AutoDisposeFamilyRef,
            there: there,
          ),
          from: autoDisposeFamilyProvider,
          name: r'autoDisposeFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoDisposeFamilyHash,
          dependencies: AutoDisposeFamilyFamily._dependencies,
          allTransitiveDependencies:
              AutoDisposeFamilyFamily._allTransitiveDependencies,
          there: there,
        );

  AutoDisposeFamilyProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.there,
  }) : super.internal();

  final String there;

  @override
  Override overrideWith(
    String Function(AutoDisposeFamilyRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoDisposeFamilyProvider._internal(
        (ref) => create(ref as AutoDisposeFamilyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        there: there,
      ),
    );
  }

  @override
  ({
    String there,
  }) get argument {
    return (there: there,);
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AutoDisposeFamilyProviderElement(this);
  }

  AutoDisposeFamilyProvider _copyWith(
    String Function(AutoDisposeFamilyRef ref) create,
  ) {
    return AutoDisposeFamilyProvider._internal(
      (ref) => create(ref as AutoDisposeFamilyRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      there: there,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AutoDisposeFamilyProvider && other.there == there;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, there.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoDisposeFamilyRef on AutoDisposeProviderRef<String> {
  /// The parameter `there` of this provider.
  String get there;
}

class _AutoDisposeFamilyProviderElement
    extends AutoDisposeProviderElement<String> with AutoDisposeFamilyRef {
  _AutoDisposeFamilyProviderElement(super.provider);

  @override
  String get there => (origin as AutoDisposeFamilyProvider).there;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
