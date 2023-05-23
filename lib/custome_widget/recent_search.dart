import 'package:flutter/material.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Color(0xFFD1D5DB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Clear'),
            SizedBox(width: 3),
            CircleAvatar(
              radius: 11,
              backgroundColor: Color(0xFFFF6368),
              child: Icon(
                Icons.close,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
