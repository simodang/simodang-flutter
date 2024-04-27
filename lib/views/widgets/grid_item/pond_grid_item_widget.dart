import 'package:flutter/material.dart';
import 'package:simodang_flutter/data/models/pond.dart';

class PondGridItemWidget extends StatelessWidget {
  const PondGridItemWidget({
    super.key,
    required this.pond,
  });

  final Pond pond;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            pond.imageUrl,
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 14),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pond.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5),
                Text(pond.city)
              ],
            ),
          )
        ],
      ),
    );
  }
}
