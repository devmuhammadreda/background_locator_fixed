import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('background_locator_2');

  setUp(() {
    // Use the recommended approach for setting a mock method call handler
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    // Use the recommended approach for clearing the mock method call handler
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('Test method call handler', () async {
    // Your test logic here
    final result = await channel.invokeMethod('someMethod');
    expect(result, '42');
  });
}
