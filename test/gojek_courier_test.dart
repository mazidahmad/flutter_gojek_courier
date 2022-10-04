import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_courier/flutter_gojek_courier.dart';
import 'package:gojek_courier/src/flutter_gojek_courier_platform_interface.dart';
import 'package:gojek_courier/src/flutter_gojek_courier_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGojekCourierPlatform
    with MockPlatformInterfaceMixin
    implements FlutterGojekCourierPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> connect({required MqttConnectOption option}) {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<void> initialise({required Courier courier}) {
    // TODO: implement initialise
    throw UnimplementedError();
  }

  @override
  // TODO: implement receiveDataStream
  Stream get receiveDataStream => throw UnimplementedError();

  @override
  Future<void> send(String topic, String msg, [QoS qoS = QoS.ZERO]) {
    // TODO: implement send
    throw UnimplementedError();
  }

  @override
  Future<void> sendUint8List(String topic, Uint8List msg,
      [QoS qoS = QoS.ZERO]) {
    // TODO: implement sendUint8List
    throw UnimplementedError();
  }

  @override
  Future<void> subscribe(String topic, [QoS qoS = QoS.ZERO]) {
    // TODO: implement subscribe
    throw UnimplementedError();
  }

  @override
  Future<void> unsubscribe(String topic) {
    // TODO: implement unsubscribe
    throw UnimplementedError();
  }
}

void main() {
  final FlutterGojekCourierPlatform initialPlatform =
      FlutterGojekCourierPlatform.instance;

  test('$MethodChannelFlutterGojekCourier is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterGojekCourier>());
  });

  test('getPlatformVersion', () async {
    FlutterGojekCourier gojekCourierPlugin = FlutterGojekCourier();
    MockGojekCourierPlatform fakePlatform = MockGojekCourierPlatform();
    FlutterGojekCourierPlatform.instance = fakePlatform;

    expect(await gojekCourierPlugin.getPlatformVersion(), '42');
  });
}
