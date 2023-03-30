import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget body;
  final Function? onBack;
  const PageWrapper({super.key, required this.body, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onBack != null
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => onBack!(),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: body,
        ),
      ),
    );
  }
}
