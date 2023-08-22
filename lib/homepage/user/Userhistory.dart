import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  DateTime _currentDate = DateTime(2023, 6, 3);
  DateTime _currentDate2 = DateTime(2023, 6, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2023, 6, 3));
  DateTime _targetDateTime = DateTime(2023, 6, 3);


  List<Event>? eventsList;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2023, 6, 11): [
        new Event(
          date: new DateTime(2023, 6, 11),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2023, 6, 10),
          title: 'Event 2',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.indigo,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2023, 6, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    super.initState();

    _markedDateMap.add(
        new DateTime(2023, 6, 3),
        new Event(
          date: new DateTime(2023, 6, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2023, 6, 3),
        new Event(
          date: new DateTime(2023, 6, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2023, 6, 11), [
      new Event(
        date: new DateTime(2023, 6, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2023, 6, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2023, 6, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    final now = DateTime.now();
    final next15Days = List.generate(15, (index) => now.add(Duration(days: index + 1)));


  }

  @override
  Widget build(BuildContext context) {
    final _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
      headerText: 'Custom Header',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon ?? Icon(Icons.help_outline);
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.green,
      markedDateMoreShowTotal:
      true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    /// Example Calendar Carousel without header and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.red,
      selectedDayButtonColor: Colors.red,
      showWeekDays: true,
      customDayBuilder: (   /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
          ) {
        /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
        /// This way you can build custom containers for specific days only, leaving rest as default.

        // Example: every 15th of month, we have a flight, we can place an icon in the container like that:


        if (day.day==1|| day.day==11 || day.day==21|| day.day==26|| day.day==6|| day.day==7|| day.day==17) {
          return Center(
            child: Container(color: Colors.red,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }
        else if(day.day==2|| day.day==12 || day.day==22) {
          return Center(
            child: Container(color: Colors.pink,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }  else if(day.day==3|| day.day==13 || day.day==23) {
          return Center(
            child: Container(color: Colors.green,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }   else if(day.day==4|| day.day==14 || day.day==24) {
          return Center(
            child: Container(color: Colors.indigo,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }    else if(day.day==5|| day.day==15 || day.day==25) {
          return Center(
            child: Container(color: Colors.indigo,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }   else if(day.day==9|| day.day==28 || day.day==24|| day.day==29) {
          return Center(
            child: Container(color: Colors.orange,height: 50,width: 50,child: Center(child: Text(day.day.toString(),style: TextStyle(color: Colors.white,fontSize: 18),)),),
          );
        }

        else {
          return null;
        }
      },
      onDayPressed: (date, events) {
        eventsList =events;
        this.setState(() => _currentDate2 = date);

        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.transparent,
      weekFormat: false,
    //  firstDayOfWeek: 5,
      markedDatesMap: _markedDateMap,
      height: 440.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
    // markedDateCustomShapeBorder:
      // CircleBorder(side: BorderSide(color: Colors.yellow)),
      // markedDateCustomTextStyle: TextStyle(
      //   fontSize: 18,
      //   color: Colors.blue,
      // ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
     //  markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.indigo,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text("jhgf"),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: _calendarCarousel,
              // ), // This trailing comma makes auto-formatting nicer for build methods.
              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          _currentMonth,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        )),
                    TextButton(
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    TextButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //

            eventsList!=null? SizedBox(height: 50,child: ListView(children:  eventsList!.map((e) => Text(e.title.toString())).toList(),)):SizedBox()
            ],
          ),
        ));
  }
}