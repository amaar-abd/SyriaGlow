import 'package:flutter/material.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/assistant_view_bdoy.dart';

class AssistantView extends StatelessWidget {
  const AssistantView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AssistantViewBdoy()),) ;
  }
}