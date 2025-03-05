import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  _ExperienceWidgetState createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        StatItem(
          imagePath: 'assets/images/user_image.png',
          value: '2,000+',
          label: 'patients',
        ),
        StatItem(
          imagePath: 'assets/images/medal_image.png',
          value: '10+',
          label: 'experience',
        ),
        StatItem(
          imagePath: 'assets/images/star_image.png',
          value: '5',
          label: 'rating',
        ),
        StatItem(
          imagePath: 'assets/images/messages.png',
          value: '1,872+',
          label: 'reviews',
        ),
      ],
    );
  }
}

class StatItem extends StatefulWidget {
  final String imagePath;
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.imagePath,
    required this.value,
    required this.label,
  });

  @override
  _StatItemState createState() => _StatItemState();
}

class _StatItemState extends State<StatItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFFF3F4F6),
          child: Image.asset(widget.imagePath, width: 24, height: 24),
        ),
        const SizedBox(height: 5),
        Text(widget.value, style: AppTypography.bodySSemiBold),
        const SizedBox(height: 5),
        Text(widget.label,
            style: AppTypography.bodySRegular
                .copyWith(color: const Color(0xFF6B7280))),
      ],
    );
  }
}
