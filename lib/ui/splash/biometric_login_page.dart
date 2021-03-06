import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../controller/auth_controller.dart';

class BioMetricLoginPage extends StatefulWidget {
  const BioMetricLoginPage({Key? key}) : super(key: key);

  @override
  _BioMetricLoginPageState createState() => _BioMetricLoginPageState();
}

class _BioMetricLoginPageState extends State<BioMetricLoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      if (authenticated) {
        AuthController.authMeCompleter.complete(authenticated);
        return;
      }
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      log("PlatformException", error: e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      if (authenticated) {
        AuthController.authMeCompleter.complete(authenticated);
        return;
      }
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      log("PlatformException", error: e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_supportState == _SupportState.unknown)
            const CircularProgressIndicator()
          else if (_supportState == _SupportState.supported)
            const Text('This device supports biometrics auth')
          else
            const Text('This device not supports biometrics auth'),
          const Divider(height: 100),
          Text('Current State: $_authorized\n'),
          if (_isAuthenticating)
            ElevatedButton(
              onPressed: _cancelAuthentication,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text('Cancel Authentication'),
                  Icon(Icons.cancel),
                ],
              ),
            )
          else
            Column(
              children: <Widget>[
                ElevatedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text('Authenticate'),
                      Icon(Icons.perm_device_information),
                    ],
                  ),
                  onPressed: _authenticate,
                ),
                ElevatedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(_isAuthenticating
                          ? 'Cancel'
                          : 'Authenticate: biometrics only'),
                      const Icon(Icons.fingerprint),
                    ],
                  ),
                  onPressed: _authenticateWithBiometrics,
                ),
              ],
            ),
          if (_supportState == _SupportState.unsupported)
            ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_isAuthenticating ? 'Cancel' : 'Continue to app'),
                  const Icon(Icons.arrow_right_alt),
                ],
              ),
              onPressed: () {
                AuthController.authMeCompleter.complete(true);
              },
            ),
        ],
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
