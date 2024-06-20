import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/theme_manager.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/date_formatter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: EdgeInsets.zero,
        leading: Icon(MdiIcons.mapMarker),
        dense: true,
        title: Text(
          DateFormatter().dayMonthYear(DateTime.now().toIso8601String()),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(
          "Be mean Full Diet",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: ThemeManager().primaryColor),
        ),
        trailing: const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/29775873?v=4',
          ),
        ),
      ),
    );
  }
}
