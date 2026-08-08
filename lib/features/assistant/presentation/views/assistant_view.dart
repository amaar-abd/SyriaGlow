import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/assistant_view_bdoy.dart';

class AssistantView extends StatelessWidget {
  const AssistantView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(body: const SafeArea(child: AssistantViewBdoy())),
    );
  }
}
