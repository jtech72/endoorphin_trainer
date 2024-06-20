import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uni_links2/uni_links.dart';
import '../utils/exports.dart';
class DeepLinkController extends GetxController {
  final initialURI = Rxn<Uri>();
  final currentURI = Rxn<Uri>();
  final error = Rxn<Object>();
  bool _initialURILinkHandled = false;
  StreamSubscription? _streamSubscription;
  @override
  void onInit() {
    super.onInit();
    _initURIHandler();
    _incomingLinkHandler();
  }

  Future<void> _initURIHandler() async {
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      try {
        final initialURI = await getInitialUri();
        if (initialURI != null) {
          log("Initial URI received: $initialURI");
          this.initialURI.value = initialURI;
          _handleIncomingLink(initialURI);
        } else {
          log("Null Initial URI received");
        }
      } on PlatformException {
        log("Failed to receive initial uri");
      } on FormatException catch (err) {
        log('Malformed Initial URI received');
        error.value = err;
      }
    }
  }

  void _incomingLinkHandler() {
    if (!kIsWeb) {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        log('Received URI: $uri');
        currentURI.value = uri;
        error.value = null;
        _handleIncomingLink(uri);
      }, onError: (Object err) {
        log('Error occurred: $err');
        currentURI.value = null;
        error.value = err is FormatException ? err : null;
      });
    }
  }

  void _handleIncomingLink(Uri? uri) {
    if (uri != null) {
      // Add your navigation logic here based on the URI
      final path = uri.path;
      if (path == "/forgotPassword") {
        Get.toNamed("/forgotPassword");
      }
      // Add more routes as necessary
    }
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }
}