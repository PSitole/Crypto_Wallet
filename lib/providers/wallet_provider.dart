import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Token {
  final String symbol;
  final String address;

  Token({required this.symbol, required this.address});
}

class WalletProvider extends ChangeNotifier {
  late Web3Client _client;
  late EthereumAddress _walletAddress;
  late EtherAmount balance;
  List<Token> tokens = [];

  // ignore: prefer_typing_uninitialized_variables
  var qrController;

  WalletProvider() {

    balance = EtherAmount.zero();
    initializeWallet();
    fetchTokens();
  
  }

  Future<void> initializeWallet() async {
    const apiUrl ='https://rinkeby.infura.io/v3/Y020fb32e26544c5c83494d9d9b7b029f';
    _client = Web3Client(apiUrl, http.Client());
    _walletAddress = EthereumAddress.fromHex('0xDE9aeFbD9ecE410453bb8b20FE6d412b2ab52705');
    balance = await _client.getBalance(_walletAddress);
    fetchBalance();
  }

  Future<void> fetchBalance() async {
    balance = await _client.getBalance(_walletAddress);
    notifyListeners();
  }


  Future<void> fetchTokens() async {
    final url =
        'https://api.etherscan.io/api?module=account&action=tokenlist&address=${_walletAddress.hex}&apikey=QGXS1BN5VKBH4TJISM8TDS89ESRJ29H5CF';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['status'] == '1') {
      final tokenList = data['result'] as List<dynamic>;
      tokens = tokenList
          .map((tokenData) => Token(
                symbol: tokenData['symbol'],
                address: tokenData['contractAddress'],
              ))
          .toList();
    }

    notifyListeners();
  }

  Future<void> scanAddress(BuildContext context) async {
    final qrKey = GlobalKey();
    String scannedCode = '';

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    controller.scannedDataStream.listen((scanData) {
                      if (scannedCode.isEmpty) {
                        scannedCode = scanData.code!;
                        Navigator.pop(context, scannedCode);
                      }
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
    qrController.dispose();
  }
}
