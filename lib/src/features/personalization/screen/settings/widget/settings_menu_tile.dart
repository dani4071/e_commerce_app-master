import 'package:flutter/material.dart';

class danSettingsMenuTile extends StatelessWidget {
  const danSettingsMenuTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.leadingIcon,
      this.trailing,
      this.onPress,
      });

  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final Widget? trailing;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 28,
      ),
      title: Text(title, style: texttheme.titleMedium,),
      subtitle: Text(subtitle, style: texttheme.labelMedium,),
      trailing: trailing,
      onTap: onPress,
    );
  }
}
