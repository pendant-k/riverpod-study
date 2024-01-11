import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CustomObserver extends ProviderObserver {
  // public variable of class
  static var logger = Logger();

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.d('''
{
  "provider": "${provider.name ?? provider.runtimeType} is initialized",
  "value exposed": "$value"
}
''');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.d('''
{
  "provider": "${provider.name ?? provider.runtimeType} disposed"
}
''');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d('''
{
  "provider": "${provider.name ?? provider.runtimeType} updated",
  "previous value": "$previousValue",
  "new value": "$newValue"
}
''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
