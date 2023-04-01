import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemGrid extends StatefulWidget {
  const ItemGrid({Key? key}) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(),
              Text(
                'Cast',
                style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    state = !state;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 60),
                  child: (state) ? Icon(
                    Icons.filter_list,
                  ) : Icon(
                    Icons.grid_view,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xff00000C),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff09090F),
          ),
          child: Container(
            margin: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/noimage.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('naman khandelwal');
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('naman khandelwal');
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('naman khandelwal');
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('naman khandelwal');
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('naman khandelwal');
                          },
                          child: Container(
                            width: 110,
                            height: 150,
                            // margin: EdgeInsets.only(bottom: 150),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 70),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5, right: 50),
                                child: Text(
                                  'Money Heist',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Animation, Adventure, Comedy, Family',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffD7D7D7),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xffD0D0D0),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '7 December 2022',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD0D0D0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
