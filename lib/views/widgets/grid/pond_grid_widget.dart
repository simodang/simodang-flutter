import 'package:flutter/material.dart';
import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/views/widgets/grid_item/pond_grid_item_widget.dart';

class PondGridWidget extends StatelessWidget {
  const PondGridWidget({
    super.key,
    required this.ponds
  });

  final List<Pond> ponds;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ponds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 190
      ),
      itemBuilder: (context, index) {
        return Card(
          child: PondGridItemWidget(
            pond: ponds[index],
          ),
        );
      },
    );
  }
}
