import 'package:flutter/material.dart';
import 'package:geo_app/widgets/loading.dart';

class PageWrapper extends StatelessWidget {
  final Widget body;
  final Function? onBack;
  final bool? loading;
  const PageWrapper({super.key, required this.body, this.onBack, this.loading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (onBack != null && loading != true)
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
        child: loading == true
            ? const Loading()
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: body,
              ),
      ),
    );
  }
}
