import 'package:flutter/material.dart';
import 'package:genie_task/custome_widget/custome_title.dart';

class AvailableShifts extends StatelessWidget {
  const AvailableShifts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 71,
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Color(0xFF2257AA),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeTitle(
                    title: 'David Morgan',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  CustomeTitle(
                    title: 'AA 99 9999',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                  CustomeTitle(
                    title: '11. Jan 2023, 08:00 - 17:00',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 15,
            width: 61,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: Text(
                'Status',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
