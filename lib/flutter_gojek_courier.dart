export 'package:flutter_gojek_courier/src/model/courier.dart';
export 'package:flutter_gojek_courier/src/model/active_net_info.dart';
export 'package:flutter_gojek_courier/src/model/adaptive_keep_alive_config.dart';
export 'package:flutter_gojek_courier/src/model/auth_failure_handler.dart';
export 'package:flutter_gojek_courier/src/model/connect_retry_time_policy.dart';
export 'package:flutter_gojek_courier/src/model/connect_timeout_policy.dart';
export 'package:flutter_gojek_courier/src/model/connection_info.dart';
export 'package:flutter_gojek_courier/src/model/courier_configuration.dart';
export 'package:flutter_gojek_courier/src/model/event_handler.dart';
export 'package:flutter_gojek_courier/src/model/experiment_config.dart';
export 'package:flutter_gojek_courier/src/model/logger.dart';
export 'package:flutter_gojek_courier/src/model/mqtt_client.dart';
export 'package:flutter_gojek_courier/src/model/mqtt_configuration.dart';
export 'package:flutter_gojek_courier/src/model/mqtt_event.dart';
export 'package:flutter_gojek_courier/src/model/mqtt_interceptor.dart';
export 'package:flutter_gojek_courier/src/model/server_uri.dart';
export 'package:flutter_gojek_courier/src/model/work_manager_ping_sender_config.dart';
export 'package:flutter_gojek_courier/src/model/mqtt_connect_option.dart';
export 'package:flutter_gojek_courier/src/model/keep_alive.dart';

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_gojek_courier/src/flutter_gojek_courier_method_channel.dart';

import 'flutter_gojek_courier.dart';
import 'src/flutter_gojek_courier_platform_interface.dart';

class FlutterGojekCourier implements FlutterGojekCourierBehaviour {
  FlutterGojekCourierPlatform create() {
    return MethodChannelFlutterGojekCourier();
  }

  _GojekCourierManualInstance withInstance(
      FlutterGojekCourierPlatform instance) {
    return _GojekCourierManualInstance(instance);
  }

  Future<String?> getPlatformVersion() {
    return FlutterGojekCourierPlatform.instance.getPlatformVersion();
  }

  @override
  Future<void> connect({required MqttConnectOption option}) {
    return FlutterGojekCourierPlatform.instance.connect(option: option);
  }

  @override
  Future<void> initialise({required Courier courier}) {
    return FlutterGojekCourierPlatform.instance.initialise(courier: courier);
  }

  @override
  Stream get receiveDataStream =>
      FlutterGojekCourierPlatform.instance.receiveDataStream;

  @override
  Future<void> subscribe(String topic, [QoS qoS = QoS.ZERO]) {
    return FlutterGojekCourierPlatform.instance.subscribe(topic, qoS);
  }

  @override
  Future<void> unsubscribe(String topic) {
    return FlutterGojekCourierPlatform.instance.unsubscribe(topic);
  }

  @override
  Future<void> disconnect() {
    return FlutterGojekCourierPlatform.instance.disconnect();
  }

  @override
  Future<void> send(String topic, String msg, [QoS qoS = QoS.ZERO]) {
    return FlutterGojekCourierPlatform.instance.send(topic, msg, qoS);
  }

  @override
  Future<void> sendUint8List(String topic, Uint8List msg,
      [QoS qoS = QoS.ZERO]) {
    return FlutterGojekCourierPlatform.instance.sendUint8List(topic, msg, qoS);
  }
}

class _GojekCourierManualInstance {
  FlutterGojekCourierPlatform instance;

  _GojekCourierManualInstance(this.instance);

  Future<String?> getPlatformVersion() {
    return instance.getPlatformVersion();
  }

  @override
  Future<void> connect({required MqttConnectOption option}) {
    return instance.connect(option: option);
  }

  @override
  Future<void> initialise({required Courier courier}) {
    return instance.initialise(courier: courier);
  }

  @override
  Stream get receiveDataStream => instance.receiveDataStream;

  @override
  Future<void> subscribe(String topic, [QoS qoS = QoS.ZERO]) {
    return instance.subscribe(topic, qoS);
  }

  @override
  Future<void> unsubscribe(String topic) {
    return instance.unsubscribe(topic);
  }

  @override
  Future<void> disconnect() {
    return instance.disconnect();
  }

  @override
  Future<void> send(String topic, String msg, [QoS qoS = QoS.ZERO]) {
    return instance.send(topic, msg, qoS);
  }

  @override
  Future<void> sendUint8List(String topic, Uint8List msg,
      [QoS qoS = QoS.ZERO]) {
    return instance.sendUint8List(topic, msg, qoS);
  }
}

// Logger, ios unavailable
// authfail, ios unavailable
// some event is different between android and ios