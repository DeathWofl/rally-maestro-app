import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:maestros/services/reg_tiempos_service.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  String qrResult = '';
  QRViewController _controller;

  void _onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrResult = scanData;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrkey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Scan Result: $qrResult',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: OutlineButton(
                      onPressed: () => RegTiemposService.validate(context, qrResult),
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Color.fromRGBO(50, 104, 214, 1),
                          width: 3,
                          style: BorderStyle.solid
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(FontAwesome.cloud_upload, color: Color.fromRGBO(50, 104, 214, 1), size: 30),
                          ),
                          Text(
                            'Enviar',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
