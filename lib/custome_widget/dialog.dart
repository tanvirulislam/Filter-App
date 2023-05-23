import 'package:flutter/material.dart';
import 'package:genie_task/custome_widget/custome_title.dart';
import 'package:intl/intl.dart';

class DialogWidget extends StatefulWidget {
  DialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endtDate = TextEditingController();

  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  @override
  void initState() {
    startDate.text = "";
    endtDate.text = "";
    super.initState();
  }

  String? driverName = 'Select Driver';
  String? radioValue = 'Select Car';

  clear() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomeTitle(
                      title: 'Filter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Clear',
                      style: TextStyle(
                        color: Color(0xFFFF6368),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date",
                      style: TextStyle(
                        color: Color(0xFF89919E),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 60,
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        controller: startDate,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xFF7488A6),
                            size: 16,
                          ),
                          suffixIconConstraints: BoxConstraints(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              startDate.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "End Date",
                      style: TextStyle(
                        color: Color(0xFF89919E),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 60,
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        controller: endtDate,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xFF7488A6),
                            size: 16,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              endtDate.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Time",
                      style: TextStyle(
                        color: Color(0xFF89919E),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          setState(() {
                            _startTime = value!;
                          });
                        });
                      },
                      child: Container(
                        width: 125,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF89919E),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _startTime.format(context).toString(),
                            ),
                            Icon(
                              Icons.watch_later,
                              color: Color(0xFF7488A6),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Time",
                      style: TextStyle(
                        color: Color(0xFF89919E),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          setState(() {
                            _endTime = value!;
                          });
                        });
                      },
                      child: Container(
                        width: 125,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF7488A6),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _endTime.format(context).toString(),
                            ),
                            Icon(
                              Icons.watch_later,
                              color: Color(0xFF7488A6),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select a Car/License Plate",
                  style: TextStyle(
                    color: Color(0xFF89919E),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            // insetPadding: EdgeInsets.all(8),
                            contentPadding: EdgeInsets.all(8),
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomeTitle(
                                        title: "Select Car",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          // size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Toyota 099099',
                                          groupValue: radioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              radioValue = value.toString();
                                              print(radioValue);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Toyota/099099',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Toyota 007777',
                                          groupValue: radioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              radioValue = value.toString();
                                              print(radioValue);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Toyota/007777',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Toyota 004444',
                                          groupValue: radioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              radioValue = value.toString();
                                              print(radioValue);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Toyota/004444',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Toyota 006666',
                                          groupValue: radioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              radioValue = value.toString();
                                              print(radioValue);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Toyota/006666',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minHeight: 36, minWidth: 120),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: CustomeTitle(
                                            title: 'Submit',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0XFFF89818),
                                          onPrimary: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF89919E)),
                          ),
                        ),
                        child: Text(radioValue.toString()),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 15,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF7488A6),
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Driver",
                  style: TextStyle(
                    color: Color(0xFF89919E),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.all(8),
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomeTitle(
                                        title: "Select Car",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          // size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                            color: Color(0xFFD1D5DB),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          toggleable: true,
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Aminul Islam',
                                          groupValue: driverName,
                                          onChanged: (value) {
                                            setState(() {
                                              driverName = value.toString();
                                              print(driverName);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Aminul Islam',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          toggleable: true,
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Saif uddin',
                                          groupValue: driverName,
                                          onChanged: (value) {
                                            setState(() {
                                              driverName = value.toString();
                                              print(driverName);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Saif uddin',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Mizan khan',
                                          groupValue: driverName,
                                          onChanged: (value) {
                                            setState(() {
                                              driverName = value.toString();
                                              print(driverName);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Mizan khan',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        trailing: Radio(
                                          activeColor: Color(0XFF4CAF50),
                                          value: 'Sojib khan',
                                          groupValue: driverName,
                                          onChanged: (value) {
                                            setState(() {
                                              driverName = value.toString();
                                              print(driverName);
                                            });
                                          },
                                        ),
                                        leading: CustomeTitle(
                                          title: 'Sojib khan',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minHeight: 36, minWidth: 120),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: CustomeTitle(
                                            title: 'Submit',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0XFFF89818),
                                          onPrimary: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF89919E)),
                          ),
                        ),
                        child: driverName == null
                            ? Text('Select  a driver')
                            : Text(driverName!),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 15,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF7488A6),
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 36, minWidth: 120),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFFF89818),
                  onPrimary: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
