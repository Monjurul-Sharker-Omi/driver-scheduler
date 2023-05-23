import 'package:flutter/material.dart';
import 'package:test_assignment/model/carmodel.dart';

 openpopup1(context, height, width){

  
  //DateTime selectedDate;
  //Future<Cardetails>? carInfo;
  TextEditingController _startDate = TextEditingController();
  showDialog(context: context, builder: (context)=> Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: SizedBox(
      height: height* 0.5,
      width: width*0.8,
      child: Padding(padding: EdgeInsets.all(8),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Select Car", style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold )),
              IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            )
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            children: [
                Container(
                height: height * 0.05,
                width: width * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      fillColor: Colors.black,
                      prefixIcon: Icon(Icons.search)),
                ),
                          ),
                          SizedBox(height: height*0.01,),
                    //       Expanded(child: Container(
                    //         width: width*0.8,
                    //         child: FutureBuilder<Cardetails>(builder: (BuildContext context, snapshot){
                    //           if(snapshot.hasError){
                    //   return Center(child: Text(snapshot.error.toString()),);
                    // }
                    //         }),
                    //       ))
                
            ],
          )
        ],
      ),
      ),
    ),
  ) 
  
  );
}