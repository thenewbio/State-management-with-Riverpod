import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lomj/views/components/animations/models/empty_content_animation_view.dart';

class EmptyContentAnimationWihText extends StatelessWidget {
  final String text;
  const EmptyContentAnimationWihText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white54),
          ),
          const EmptyContentAnimationView()
        ],
      ),
    );
  }
}
