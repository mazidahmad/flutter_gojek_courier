import 'dart:typed_data';

import 'package:flutter_gojek_courier/src/model/courier.dart';
import 'package:flutter_gojek_courier/src/model/mqtt_connect_option.dart';
import 'package:flutter_gojek_courier/src/model/mqtt_event.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_gojek_courier_method_channel.dart';

abstract class FlutterGojekCourierPlatform extends PlatformInterface
    implements FlutterGojekCourierBehaviour {
  /// Constructs a GojekCourierPlatform.
  FlutterGojekCourierPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterGojekCourierPlatform _instance =
      MethodChannelFlutterGojekCourier();

  /// The default instance of [FlutterGojekCourierPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterGojekCourier].
  static FlutterGojekCourierPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterGojekCourierPlatform] when
  /// they register themselves.
  static set instance(FlutterGojekCourierPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

abstract class FlutterGojekCourierBehaviour {
  Future<String?> getPlatformVersion();
  Stream get receiveDataStream;

  Future<void> initialise({required Courier courier});
  Future<void> connect({required MqttConnectOption option});
  Future<void> subscribe(String topic, [QoS qoS = QoS.ZERO]);
  Future<void> unsubscribe(String topic);
  Future<void> disconnect();
  Future<void> send(String topic, String msg, [QoS qoS = QoS.ZERO]);
  Future<void> sendUint8List(String topic, Uint8List msg, [QoS qoS = QoS.ZERO]);
}
