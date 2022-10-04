import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_courier/src/flutter_gojek_courier_method_channel.dart';

void main() {
  MethodChannelFlutterGojekCourier platform =
      MethodChannelFlutterGojekCourier();
  const MethodChannel channel = MethodChannel('gojek_courier');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
