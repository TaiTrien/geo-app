import 'package:flutter/material.dart';
import 'package:geo_app/variants/variants.dart';
import 'package:geo_app/widgets/loading.dart';

class PageWrapper extends StatelessWidget {
  final Widget body;
  final Function? onBack;
  final bool? loading;
  final Widget? fab;
  final bool hasAppBar;
  final String? title;
  const PageWrapper({
    super.key,
    required this.body,
    this.onBack,
    this.loading,
    this.fab,
    this.hasAppBar = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: hasAppBar
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Text(title ?? ''),
              leading: (onBack != null && loading != false)
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => onBack!(),
                    )
                  : null,
              actions: const [
                CircleAvatar(
                  backgroundImage: AssetImage(Drawables.avatar),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: loading == true ? const Loading() : body,
      ),
      floatingActionButton: fab,
    );
  }
}
