import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class ExperienceWidget extends StatefulWidget {
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
          icon: Icons.people_alt_sharp,
          value: '2,000+',
          label: 'patients',
        ),
        StatItem(
          icon: Icons.emoji_events_rounded,
          value: '10+',
          label: 'experience',
        ),
        StatItem(
          icon: Icons.star,
          value: '5',
          label: 'rating',
        ),
        StatItem(
          icon: Icons.message_sharp,
          value: '1,872+',
          label: 'reviews',
        ),
      ],
    );
  }
}

class StatItem extends StatefulWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

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
          child: Icon(widget.icon, color: const Color(0xFF1C2A3A), size: 30),
        ),
        const SizedBox(height: 5),
        Text(widget.value, style: AppTypography.bodySSemiBold),
        const SizedBox(height: 5),
        Text(widget.label, style: AppTypography.bodySRegular.copyWith(color: const Color(0xFF6B7280))),
      ],
    );
  }
}
