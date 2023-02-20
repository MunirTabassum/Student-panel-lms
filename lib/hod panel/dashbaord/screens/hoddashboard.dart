import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:studentpanel/student%20panel/constants/helpers.dart';
import 'package:studentpanel/student%20panel/coursespecification.dart/screens/coursespecification.dart';

import '../../../student panel/dashboard/widgets/homelistTile.dart';
import '../../../student panel/dashboard/widgets/sidebarwidget.dart';
import '../models/facultymodel.dart';
import 'facultydetail.dart';

class HodDashboard extends StatefulWidget {
  const HodDashboard({super.key});

  @override
  State<HodDashboard> createState() => _HodDashboardState();
}

class _HodDashboardState extends State<HodDashboard> {
  final _controller = SidebarXController(selectedIndex:0,extended:true);
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
          title:RichText(text: const TextSpan(
            children: [
            TextSpan(
            text: 'U O C       ',style: TextStyle(color: Colors.amber,
            fontSize: 23,wordSpacing: 3,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',)
          ),
            TextSpan(
            text: 'HOD Portal',style: TextStyle(color: Colors.white,
            fontSize:23 ,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',)
          ),
          ]),),
        //   leading: IconButton(
        //   onPressed: (){
        //     _key.currentState?.openDrawer();
        //   },
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //     size: 22,),
        // ),
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
        drawer: SideBarWidget(controller: _controller),
        body: Row(
          children: [
            if(!isSmallScreen) SideBarWidget(controller: _controller),
            Expanded(child: Center(child: AnimatedBuilder(
              animation: _controller,
              builder: ((context, child) {
                switch(_controller.selectedIndex){
                  case 0: _key.currentState?.closeDrawer();
                  return SingleChildScrollView(
                    child: Center(  child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top:28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.250,
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
                              Text('Dr Sultan Zia'.toUpperCase(),style: const TextStyle(
                              color: Colors.deepPurple,
                                fontFamily: 'Poppins',fontSize: 32),),
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
                        // color: Colors.white,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top:14.0),
                            child: Row(children: const [
                              SizedBox(width: 20,),
                               Text('Faculty Members',style:  TextStyle(
                              color: Colors.deepPurple,
                                fontFamily: 'Poppins',fontSize: 22,
                                fontWeight: FontWeight.w500),),
                            ],),
                          ),
                          const SizedBox(height: 10,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //    Padding(
                          //      padding: const EdgeInsets.only(left:19.0),
                          //      child: DropDownMethod1(),
                          //    ),
                  
                          //    Padding(
                          //      padding: const EdgeInsets.only(right:38.0),
                          //      child: DropDownMethod2(),
                          //    ),
                          // ],),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 7),
                            child: Container(
                              height:400 ,
                              child: ListView.builder(
                                itemCount: facultyList.length,
                                itemBuilder: ((context, index) {
                                  return ListTile(
                                    onTap: (){
                                      Navigator.push(context, 
                                      MaterialPageRoute(builder: ((context) =>FacultyDetails(facultyList: facultyList[index],)
                                      
                                      ),
                                      // settings: RouteSettings(
                                      //   arguments: facultyList[index],
                                      // )
                                      ));
                                    },
                                  title:  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Text('${facultyList[index].id}',
                                    style:const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),),
                                  ),
                                  subtitle: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Text('${facultyList[index].title}',style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  trailing: PopupMenuButton(
                                    itemBuilder: (context)=>const [
                                      PopupMenuItem<int>(
                                        value: 0,
                                        child:  Text('Start this course'),
                                      ),
                                       PopupMenuItem<int>(
                                        value: 1,
                                        child: Text('Remove from view'),
                                      ),
                                    ],
                                    onSelected: (item)=>SelectedItem(context,item),
                                  ),
                                  );
                                }),     
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],)  ),
                  );
                  case 1: _key.currentState?.closeDrawer();
                  return  SingleChildScrollView(
                    child: Center( child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top:28.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.15,
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
                          child: Row(children:const [
                          
                            SizedBox(width: 20,),
                            Text(' UoC LMS',style:  TextStyle(
                            color: Colors.deepPurple,
                              fontFamily: 'Poppins',fontSize: 32),),
                          ],),
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
                        // color: Colors.white,
                        child: Column(children: [
                          HomeListTile(
                            icn: Icons.menu,
                            title: 'QEC Survey',
                            onTap: (){},
                          ),
                           HomeListTile(
                            icn: Icons.menu,
                            title: 'Apply for UoC Clearance',
                            onTap: (){},
                          ),
                           HomeListTile(
                            icn: Icons.menu,
                            title: 'Course Specification and Course Report',
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return CourseSpecification();
                              })));
                            },
                          ),
                        ]),
                      ),
                    ],)  ),
                  );
                  case 2: _key.currentState?.closeDrawer();
                  return Center(  child: Text('Settings',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 40),),  );
                  case 3: _key.currentState?.closeDrawer();
                  return Center(  child: Text('Home',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 40),),  );
                  default:_key.currentState?.closeDrawer();
                   return Center(  child: Text('Home',style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 40),),  );
                }
              }),
            )))
          ],
        ),
    
      );
      },
       
    );
  }

  Container DropDownMethod2() {
    return Container(
                              height: 40,
                              width: 173,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                border: Border.all(width: 1,color: Colors.black38),
                                
                              ),
            child: DropdownButton<String>(
              // Step 3.
              value: dropValue,
              // Step 4.
              items: <String>['Course name', 'Last accessed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Text(
                      '$value   ',
                      style:const TextStyle(fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropValue = newValue!;
                });
              },
            ),
          );
  }

  Container DropDownMethod1() {
    return Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              border: Border.all(width: 1,color: Colors.black38),
                              
                            ),
            child: DropdownButton<String>(
              // Step 3.
              value: dropdownValue,
              // Step 4.
              items: <String>['In progress', 'Future', 'Past', 'Starred']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Text(
                      '$value   ',
                      style:const TextStyle(fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          );
  }
  
  SelectedItem(BuildContext context, int item) {
    switch(item){
      case 0: print('Start this course');
         break;
      case 1: print('Remove from View ');

    }
  }
}


