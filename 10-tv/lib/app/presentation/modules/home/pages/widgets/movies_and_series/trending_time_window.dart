import 'package:flutter/material.dart';

import '../../../../../../domain/enums.dart';
import '../../../../../../generated/translations.g.dart';
import '../../../../../global/colors.dart';
import '../../../../../global/extensions/build_context_ext.dart';

class TrendingTimeWindowWidget extends StatelessWidget {
  final TimeWindow timeWindow;
  final void Function(TimeWindow) onChanged;

  const TrendingTimeWindowWidget({Key? key, required this.timeWindow, required this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Text(t.home.trending, style: context.textTheme.titleSmall),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Material(
              color: context.darkMode ? AppColors.darkLight : const Color.fromARGB(239, 224, 224, 224),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButton<TimeWindow>(
                  underline: const SizedBox.shrink(),
                  value: timeWindow,
                  isDense: true, //Quita el padding a DropdownButton
                  items: [
                    DropdownMenuItem(value: TimeWindow.day, child: Text(t.home.dropDownButton.last24)),
                    DropdownMenuItem(value: TimeWindow.week, child: Text(t.home.dropDownButton.lastWeek)),
                  ],
                  onChanged: (value) {
                    if (value != null && value != timeWindow) onChanged(value);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
