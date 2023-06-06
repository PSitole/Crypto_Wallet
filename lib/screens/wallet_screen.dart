import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Wallet'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Balance: ${walletProvider.balance} ETH'),
          ElevatedButton(
            onPressed: () => walletProvider.fetchBalance(),
            child: const Text('Refresh Balance'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => walletProvider.scanAddress(context),
            child: const Text('Scan Address'),
          ),
          const SizedBox(height: 16),
          const Text('Token List:'),
          Expanded(
            child: ListView.builder(
              itemCount: walletProvider.tokens.length,
              itemBuilder: (context, index) {
                final token = walletProvider.tokens[index];
                return ListTile(
                  title: Text(token.symbol),
                  subtitle: Text(token.address),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
