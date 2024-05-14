import 'package:flutter/material.dart';
import 'package:simodang_flutter/config/chart_time_list_constants.dart';

class TimeChipWidget extends StatelessWidget {
  TimeChipWidget({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final Function(int) onSelected;

  final List<ChartTime> chartTimeList = ChartTimeListConstants().timeList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Wrap(
          spacing: 5,
          children: List.generate(
            chartTimeList.length,
            (index) {
              return ChoiceChip(
                label: Text(chartTimeList[index].label),
                selected: currentIndex == index,
                onSelected: (selected) {
                  onSelected(index);
                },
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
