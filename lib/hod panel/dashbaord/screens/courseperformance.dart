import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:studentpanel/hod%20panel/dashbaord/models/facultymodel.dart';
import 'package:studentpanel/hod%20panel/dashbaord/widgets/sidebar.dart';
import 'package:studentpanel/student%20panel/dashboard/coursemodel/model.dart';

import '../../../student panel/coursespecification.dart/widgets/assesmenttable.dart';
import '../../../student panel/coursespecification.dart/widgets/piechart_report.dart';
import '../../../student panel/coursespecification.dart/widgets/reportchart.dart';
import '../widgets/coursereporttile.dart';
import 'outlinetable.dart';

class CoursePerformance extends StatefulWidget {
  final Courses courseList;
  final Faculty facultyList;
  const CoursePerformance({super.key,required this.courseList,required this.facultyList});

  @override
  State<CoursePerformance> createState() => _CoursePerformanceState();
}

class _CoursePerformanceState extends State<CoursePerformance> {
  final _coursecontroller = SidebarXController(selectedIndex:0,extended:true);
  final _key = GlobalKey<ScaffoldState>();
   String dropdownValue = 'In progress';
   String dropValue = 'Course name';
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        final isSmallScreen = MediaQuery.of(context).size.width<600;
        return Scaffold(
          backgroundColor: Colors.grey.shade400,
        key: _key,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title:RichText(text:  TextSpan(
            children: [
            TextSpan(
            text: '${widget.courseList.title} Performance    ',style:const TextStyle(color: Colors.amber,
            fontSize: 23,wordSpacing: 3,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',)
          ),
            const TextSpan(
            text: '& Reports',style: TextStyle(color: Colors.white,
            fontSize:23 ,
            fontFamily: 'Poppins',)
          ),
          ]),),
        actions:  [
           const Padding(
             padding:  EdgeInsets.only(right:10.0),
             child:  Icon(Icons.notifications,size: 22,color: Colors.white,),
           ),
          Padding(
            padding: const EdgeInsets.only(right:30.0),
            child: IconButton(onPressed: (){
              
            }, icon:const Icon(Icons.person),iconSize: 30,),
          )
        ],
        ),
        drawer: CoursesSideBar(controller: _coursecontroller,),
        body: Row(
          children: [
            if(!isSmallScreen) CoursesSideBar(controller: _coursecontroller),
            Expanded(child: Center(child: AnimatedBuilder(
              animation: _coursecontroller,
              builder: ((context, child) {
                switch(_coursecontroller.selectedIndex){
                  case 0: _key.currentState?.closeDrawer();
                  return SingleChildScrollView(
                    child: Center(  child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top:28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                            top:  BorderSide(
                            color: Colors.grey.shade400,
                                width: 2.0,
                             ),
                             left:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              right:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              bottom:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              ),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top:18.0,left: 18),
                              child: Row(
                                children: [
                               const SizedBox(width: 20,),
                                Text('${widget.courseList.title}'.toUpperCase(),style: const TextStyle(
                                color: Colors.deepPurple,
                                  fontFamily: 'Poppins',fontSize: 32),),
                              ],),
                            ),
                            
                          ]),
                        ),
                      ),
                      // Profile Section end here
                      const SizedBox(height: 15,),
                      Container(
                        height: MediaQuery.of(context).size.height*0.8,
                        width: MediaQuery.of(context).size.width*0.75,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: const BorderSide(
                            color: Colors.deepPurple,
                                width: 2.0,
                             ),
                             left:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              right:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              bottom:BorderSide(
                            color: Colors.grey.shade400,
                                width: 2,
                             ),
                              ),
                        ),
                        child: Column(children: const[
                          SizedBox(width: 20,),
                          courseReportTiles(title: 'Student Skills Development Report',
                          icn: Icons.developer_mode,
                          ),
                          courseReportTiles(title: 'Student Course Grades Report',
                          icn: Icons.developer_mode,
                          ),
                          courseReportTiles(title: 'Student Skills Development Report',
                          icn: Icons.developer_mode,
                          ),
                          courseReportTiles(title: 'Student Skills Development Report',
                          icn: Icons.developer_mode,
                          ),
                        ]),
                      ),
                    ],)  ),
                  );
                  case 1: _key.currentState?.closeDrawer();
                  return  Column(children:const  [
                    Text(' Participants',style:  TextStyle(
                    color: Colors.deepPurple,
                      fontFamily: 'Poppins',fontSize: 32),),
                  ],);
                  case 2: _key.currentState?.closeDrawer();
                  return Center(  child: Text('Settings',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 40),),  );
                  case 3: _key.currentState?.closeDrawer();
                  return SingleChildScrollView(
      child: Center(  child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top:28.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.16,
            width: MediaQuery.of(context).size.width*0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
              top:  BorderSide(
              color: Colors.grey.shade400,
                  width: 2.0,
               ),
               left:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                right:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                bottom:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Row(children:  [
                const SizedBox(width: 20,),
                Text('${widget.courseList.title} : User Report',style:const  TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',fontSize: 28),),
              ],),
              
            ]),
          ),
        ),
        // Profile Section end here
        const SizedBox(height: 15,),
        Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width*0.75,
          decoration:  BoxDecoration(
            color: Colors.white,
            border: Border(
              top: const BorderSide(
              color: Colors.deepPurple,
                  width: 2.0,
               ),
               left:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                right:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                bottom:BorderSide(
              color: Colors.grey.shade400,
                  width: 2,
               ),
                ),
          ),
         
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top:14.0),
                child: Row(children:  [
                  const SizedBox(width: 20,),
                    RichText(text:  TextSpan(
                        children: [
                       const TextSpan(
                        text: 'Welcome to Course Outline- ',style: TextStyle(color: Colors.amber,
                        fontSize: 23,wordSpacing: 5,letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',)
                      ),
                        TextSpan(
                        text: '${widget.facultyList.title}',style:const TextStyle(color: Colors.deepPurple,
                        fontSize:22 ,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',)
                      ),
                      ]),),
                ],),
              ),
              const SizedBox(height: 15,),
              const Text('Course Outline Guidelines',style: TextStyle(
                color: Colors.deepPurple,
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),),
              courseReportTiles(title: 'Course Description & Pre Requisites',
              onTap: (){
                showDialog(context: context, 
              builder: (ctx){
                return AlertDialog(
                   title: const Center(
                     child:  Text('Course Description & Course Pre Requisites',
                     style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                     ),),
                   ),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      children:const [
                         Text('GEO-104Fundamental of Computing the core subject of Computer Science having 3credit hours.GEO-104Fundamental of Computing the core subject of Computer Science having 3credit hours.',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                        SizedBox(height: 20,),
                          Text('GEO-104Fundamental of Computing the core subject of Computer Science having 3credit hours.GEO-104Fundamental of Computing the core subject of Computer Science having 3credit hours.',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                      ],
                    )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        color: Colors.amber,
                        padding: const EdgeInsets.all(14),
                        child:const Center(
                          child:  Text("Close Description",style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15
                          ),),
                        ),
                      ),
                    ),
                  ],
              );
                
              });
              },),
              courseReportTiles(title: 'Recommended TextBooks',
              onTap: (){
                 showDialog(context: context, 
              builder: (ctx){
                return AlertDialog(
                   title: const Center(
                     child:  Text('Recommended TextBooks',
                     style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                     ),),
                   ),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                         Text('1- Introduction to Computer Science',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                        SizedBox(height: 20,),
                          Text('2- Fundamentals of Programming',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                        SizedBox(height: 20,),
                         Text('3- Fundamentals of Programming',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                      ],
                    )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        color: Colors.amber,
                        padding: const EdgeInsets.all(14),
                        child:const Center(
                          child:  Text("Close ",style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15
                          ),),
                        ),
                      ),
                    ),
                  ],
              );
                
              });
              },),
              courseReportTiles(title: 'Attendance Policy',
              onTap: (){
                showDialog(context: context, 
              builder: (ctx){
                return AlertDialog(
                   title: const Center(
                     child:  Text('Attendance Policy',
                     style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                     ),),
                   ),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                         Text('A minimum of 70% attendance is required for a student to be eligible to take the final examination.\nThe students with less than 70% of the attendance in a course shall be given the grade SA (Short Attendance) in such a course and shall not be allowed to take its End Term Exams and will have to reappear in the course to get the required attendance to be eligible to sit in the exam when the course is offered the next time.',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                      ],
                    )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        color: Colors.amber,
                        padding: const EdgeInsets.all(14),
                        child:const Center(
                          child:  Text("Close ",style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15
                          ),),
                        ),
                      ),
                    ),
                  ],
              );
                
              });
              },),
              courseReportTiles(title: 'Grading',
              onTap: (){
                showDialog(context: context, 
              builder: (ctx){
                return AlertDialog(
                   title: const Center(
                     child:  Text('Grading ',
                     style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                     ),),
                   ),
                  content: Container(
                    height: 500,
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                         Text('The course will be evaluated on the basis of the following percentage:',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                         Text('⚈ Mid Term                      25%',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                        SizedBox(height: 5,),
                        Text('⚈ Sessional Work ',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                        Text('       \u2022 Presentation     10%\n       \u2022 Assignment     10%\n       \u2022 Quizes     10%',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 14),),
                        SizedBox(height: 5,),
                         Text('⚈ Final Term           50%',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 16),),
                         Text('       \u2022 Objective     15%\n       \u2022 Subjective     35%',
                        style: TextStyle(fontFamily: 'Poppins',fontSize: 14),),
                      ],
                    )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        color: Colors.amber,
                        padding: const EdgeInsets.all(14),
                        child:const Center(
                          child:  Text("Close ",style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15
                          ),),
                        ),
                      ),
                    ),
                  ],
              );
                
              });
              },),
              courseReportTiles(title: 'Week Schedule',
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: ((context) => OutlineTable())));
              },)
              // CourseAssessmentTable();
              // ReportChart()
             
            ]),
          ),
        ),
      ],)  ),
    );;
                  default:_key.currentState?.closeDrawer();
                   return Center(  child: Text('Homee',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 40),),  );
                }
              }),
            )))
          ],
        ),
    
      );
      },
       
    );
  }
}
