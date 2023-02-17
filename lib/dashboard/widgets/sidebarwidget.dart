import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';


class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key, required SidebarXController controller}):_controller=controller;
final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller:_controller ,
      theme: const SidebarXTheme(
       selectedTextStyle: TextStyle(color: Colors.amber,
       fontFamily: 'Poppins',
       fontSize:16 ),
       selectedItemTextPadding:EdgeInsets.only(left: 25) ,
       selectedIconTheme: IconThemeData(
        color: Colors.amber,size: 24
       ),
      itemTextPadding: EdgeInsets.only(left: 25),
        textStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 16,
          ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
            // topRight: Radius.circular(20),
            bottomRight: Radius.circular(20))
        ),
        iconTheme: IconThemeData(
          color: Colors.white,size: 24
        )
      ),
      extendedTheme: const SidebarXTheme(
        width: 250,
      ),
      headerBuilder: ((context, extended) {
        return const SizedBox(
          height: 100,
          child: Icon(Icons.person,color: Colors.white,size: 60,),
          );
      }),
      footerDivider: Divider(color: Colors.white,height: 1,),
      items: const[
        SidebarXItem(icon: Icons.dashboard,label: 'Dashboard',),
        SidebarXItem(icon: Icons.home,label: 'Site Home'),
        SidebarXItem(icon: Icons.file_upload_sharp,label: 'Private Files'),
        SidebarXItem(icon: Icons.calendar_month,label: 'Calender')
      ],
    );
  }
}