// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:genie_task/custome_widget/available_shifts.dart';
import 'package:genie_task/custome_widget/custome_title.dart';
import 'package:genie_task/custome_widget/dialog.dart';

import 'package:genie_task/custome_widget/recent_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Shift Planner',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFD1D5DB),
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Color(0xFFD1D5DB),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Color(0xFFD1D5DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 0),
                          contentPadding: EdgeInsets.all(8),
                          content: DialogWidget(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFF89818),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SizedBox(
                        height: 13,
                        width: 15,
                        child: Image.asset(
                          'assets/images/filter_icon.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Wrap(
                children: [
                  for (int i = 0; i < 7; i++) RecentSearch(),
                ],
              ),
              SizedBox(height: 4),
              CustomeTitle(
                title: 'Available Shifts',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 11,
                  itemBuilder: (BuildContext context, int index) {
                    return AvailableShifts();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
