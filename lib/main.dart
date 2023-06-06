import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:crypto_wallet/screens/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WalletProvider(),
      child: MaterialApp(
        title: 'Crypto Wallet',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const WalletScreen(),
      ),
    );
  }
}
