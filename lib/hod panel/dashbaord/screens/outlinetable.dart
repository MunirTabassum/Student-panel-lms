import 'package:flutter/material.dart';
class OutlineTable extends StatelessWidget {
  const OutlineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:
    SingleChildScrollView(
      child: Column(
        children: [
        const Padding(
           padding:  EdgeInsets.only(top:22.0),
           child:  Text('Session Schedule',style: TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),),
         ),
         const SizedBox(height: 15,),
          Padding(
             padding: const EdgeInsets.all(10.0),
             child: Center(child: Table(
                border: TableBorder.all(),
                columnWidths: const{
                  0:FractionColumnWidth(0.13),
                  1:FractionColumnWidth(0.1),
                  2:FractionColumnWidth(0.1),
                  3:FractionColumnWidth(0.12),
                  4:FractionColumnWidth(0.1),
                  5:FractionColumnWidth(0.12),
                  6:FractionColumnWidth(0.12)
                },
                children: [
                  buildRow(['Weeks','Lectures','File Name','Topic','Objective','Blooms Taxanomy Level'],isHeader: true),
                  buildRow(['W 01', 'L1','F1','T','O','B'],isHeader: false),
                  buildRow(['', 'L2','','','',''],),
                  buildRow(['W 02', 'L3','','','','']),
                  buildRow(['', 'L4','','','','']),
                  buildRow(['W 03', 'L5','','','','']),
                  buildRow(['','L6','','','','']),
                  buildRow(['W 04', 'L7','','','','']),
                  buildRow(['', 'L8','','','','']),
                  buildRow(['W 05', 'L9','','','','']),
                  buildRow(['', 'L10','','','','']),
                  buildRow(['W 06', 'L11','','','','']),
                  buildRow(['', 'L12','','','','']),
                  buildRow(['W 07', 'L13','','','','']),
                  buildRow(['', 'L14','','','','']),
                  buildRow(['W 08', 'Mid','','','','']),
                  buildRow(['', 'Mid','','','','']),
                  buildRow(['W 09', 'L17','','','','']),
                  buildRow(['', 'L18','','','','']),
                  buildRow(['W 10', 'L19','','','','']),
                  buildRow(['', 'L20','','','','']),
                  buildRow(['W 11', 'L21','','','','']),
                  buildRow(['', 'L22','','','','']),
                  buildRow(['W 12', 'L23','','','','']),
                  buildRow(['', 'L24','','','','']),
                  buildRow(['W 13', 'L25','','','','']),
                  buildRow(['', 'L26','','','','']),
                  buildRow(['W 14', 'L27','','','','']),
                  buildRow(['', 'L28','','','','']),
                  buildRow(['W 15', 'L29','','','','']),
                  buildRow(['', 'L30','','','','']),
                  buildRow(['W 16', 'L31','','','','']),
                  buildRow(['', 'L32','','','','']),
                
                ],
              )
              ),
           ),
          const SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 1.5),
                  color: Colors.green,
                ),
                  child:TextButton(
                    onPressed: (){},
                    child:  const Center(child:  Text('Approve ',style: TextStyle(fontFamily: 'Poppins',fontSize: 16,color: Colors.white),)),
                  )
               ),
               const SizedBox(width: 40,),
                 Padding(
                   padding: const EdgeInsets.only(right:20.0),
                   child: Container(
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.5),
                    color: Colors.red,
                ),
                    child:TextButton(
                      onPressed: (){},
                      child:  const Center(child:  Text('Reject ',style: TextStyle(fontFamily: 'Poppins',fontSize: 16,color: Colors.white),)),
                    )
               ),
                 ),
             ],
           )
        ],
      ),
    ));
     
  }
  
  TableRow buildRow(List<String> cells,{bool isHeader=false})=>TableRow(
    children: cells.map((cell)=>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(child: Text(cell,style: TextStyle(
        fontWeight: isHeader?FontWeight.bold:FontWeight.w400,
        fontFamily: 'Poppins',
        fontSize: 12
      ),)),
    )).toList()
  );
  
  
  
  
}