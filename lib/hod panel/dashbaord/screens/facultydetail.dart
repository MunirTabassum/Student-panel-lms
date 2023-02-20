import 'package:flutter/material.dart';
import 'package:studentpanel/hod%20panel/dashbaord/screens/courseperformance.dart';
import 'package:studentpanel/student%20panel/dashboard/coursemodel/model.dart';

import '../models/facultymodel.dart';

class FacultyDetails extends StatelessWidget {
  final Faculty facultyList;
  const FacultyDetails({super.key,required this.facultyList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:18.0,left: 3.0,right: 3.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  border: Border(
                  top:  BorderSide(
                  color: Colors.white,
                      width: 2,
                    ),
                    left:BorderSide(
                  color: Colors.white,
                      width: 2,
                    ),
                    right:BorderSide(
                  color: Colors.white,
                      width: 2.0,
                    ),
                    bottom:BorderSide(
                  color: Colors.white,
                      width: 2,
                    ),
                    ),
                ),
                child: Column(children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(top:25.0,left: 20),
                      child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey,
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/pic.jpg'
                        ),
                        fit: BoxFit.cover
                      )
                      ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text('${facultyList.title}'.toUpperCase(),style: const TextStyle(
                    color: Colors.deepPurple,
                      fontFamily: 'Poppins',fontSize: 32),),
                  ],),
                  
                ]),
              ),
           ),
           // course assigned to faculty
             const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:2.0,right: 2.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  width: MediaQuery.of(context).size.width,
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
                  // color: Colors.white,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top:14.0),
                      child: Row(children: const [
                        SizedBox(width: 20,),
                          Text('Teaching Following Courses',style:  TextStyle(
                        color: Colors.deepPurple,
                          fontFamily: 'Poppins',fontSize: 22,
                          fontWeight: FontWeight.w500),),
                      ],),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 7),
                      child: Container(
                        height:400 ,
                        child: ListView.builder(
                          itemCount: courseList.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: ((context) =>CoursePerformance(courseList: courseList[index],
                                facultyList: facultyList,)
                                
                                ),
                                ));
                              },
                            title:  MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text('${courseList[index].id}',
                              style:const TextStyle(
                                fontFamily: 'Poppins',
                              ),),
                            ),
                            subtitle: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text('${courseList[index].title}',style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            
                            );
                          }),     
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}