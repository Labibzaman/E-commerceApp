import 'package:flutter/material.dart';

import '../../utility/appcolors.dart';

class homeCategoryandSeeText extends StatelessWidget {
  const homeCategoryandSeeText({
    super.key, required this.title,  required this.onTapSeeAll,
  });
final String title;
final VoidCallback onTapSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text(
            'See All',
            style: TextStyle(
                color: AppColors.primaryColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
