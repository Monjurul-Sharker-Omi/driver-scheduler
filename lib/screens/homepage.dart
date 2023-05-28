import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:test_assignment/globalVariables.dart';
import 'package:test_assignment/model/index.dart';
import 'package:test_assignment/utils/apihandler.dart';
import 'package:test_assignment/utils/driverprofilecard.dart';
import 'package:date_format/date_format.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
} 

class _HomePageState extends State<HomePage> {
  Future<Filter>? driverInfo;

  @override
  void initState() {
    super.initState();
    getData();

  }  

  getData() async {
    driverInfo = api().fetchDriverInfo();
  }

  void clearText(){
    _startDate.clear();
    _endDate.clear();
    _startTime.clear();
    _endTime.clear();
    _driver.clear();
    _license.clear();
  }

  bool isVisible = false;
  int tag = 3;
  String chosenlicence = "";
  String chosenDriver = "";
   TextEditingController _startDate = TextEditingController();
   TextEditingController _endDate = TextEditingController();
   TextEditingController _startTime = TextEditingController();
   TextEditingController _endTime = TextEditingController();
   TextEditingController _license= TextEditingController();
   TextEditingController _driver = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const  Text("Shift Planner", style: TextStyle(fontSize: 28.8, fontFamily: 'Euclid Regular', fontWeight: FontWeight.bold )),
        ),
        body:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                height: height * 0.05,
                width: width * 0.8,
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
                          const SizedBox(width: 10,),
                          Container(
                            height: height* 0.05,
                            width: width* 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffF89818),
                            ),
                            child: IconButton(icon: const Icon(Icons.tune, color: Colors.white,),
                            onPressed: () {
                              showDialog(context: context, builder: (context)=> Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      
      height: height* 0.6,
      width: width*0.9,
      child: Padding(padding: EdgeInsets.all(8),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ SizedBox(child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [SizedBox(width: 10,),
                Text("Filter", style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold )),
                SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  clearText();
                },
                child: Text("Clear", style: TextStyle(fontSize: 16, fontFamily: 'Euclid', color:Color(0xffFF6368), fontWeight: FontWeight.w500))),],
            )),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
                    enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: _startDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range_rounded),
                      labelText: "Start Date"
                    ),
                    onTap: () async {
                      DateTime? pickStartDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                      if (pickStartDate!= null){
                        setState(() {
                          _startDate.text = formatDate(pickStartDate, [dd, ".", MM," ", yyyy]);
                          globalvariables.addData(_startDate.text);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
                    enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: _endDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range_rounded),
                      labelText: "End Date"
                    ),
                    onTap: () async {
                      DateTime? pickDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                      if (pickDate!= null){
                        setState(() {
                          _endDate.text = formatDate(pickDate, [dd, ".", MM," ", yyyy]);
                          globalvariables.addData(_endDate.text);
                        });
                      }
                    },
                  ),
                )
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
                    enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: _startTime,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.watch_later_rounded),
                      labelText: "Start Time"
                    ),
                    onTap: () async {
                      TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 12, minute: 00));
                      if (pickTime!= null){
                        setState(() {
                          _startTime.text = '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
                          globalvariables.addData(_startTime.text);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
                    enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: _endTime,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.watch_later_rounded),
                      labelText: "End Time"
                    ),
                    onTap: () async {
                      TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 12, minute: 00));
                      if (pickTime!= null){
                        setState(() {
                          _endTime.text = '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
                          globalvariables.addData(_endTime.text);
                        });
                      }
                    },
                  ),
                ),
            ],
          ),
          //SizedBox(height: height*0.01,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: height*0.09,
                    width: width*0.7,
                    child: TextField(
                      enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                      controller: _license,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.chevron_right_rounded),
                        labelText: "Select Car/License Plate"
                      ),
                      onTap: () async {
                        showDialog(context: context, builder: (context)=> Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          child: Container(
                                              height: height* 0.5,
                                                   width: width*0.8,
                                                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
            ],
          ),
          SizedBox(height: height*0.01,),
          Expanded(child: ListView.builder(itemCount: globalvariables.licenseNo.length ,itemBuilder: (context,i){
              return Padding(padding: EdgeInsets.all(8),
              child: Container(
                  height: height*0.035,
                  width: width*0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(globalvariables.licenseNo[i], style: TextStyle(fontFamily: 'Euclid Regular',fontSize: 18)),
                      Radio(
                        value: i,
                        groupValue: chosenlicence,
                        onChanged: (value) {
                          chosenlicence = i.toString();
                          _license.text = globalvariables.licenseNo[i];
                          globalvariables.addData(_license.text);
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  
                  Navigator.of(context).pop();
                });
              },
              child: Container(
                height: height*0.05,
                width: width*0.3,
                decoration: BoxDecoration(color: const Color(0xffF89818), borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("Submit", style: TextStyle(fontFamily: 'Euclid Regular',fontSize: 16, color: Colors.white),),),
              ),
            ),
          )
        ],
      ),
      ),
    ),
  ) 
  
  );
                      },
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: height*0.09,
                    width: width*0.7,
                    child: TextField(
                      enableInteractiveSelection: false,
                    focusNode: AlwaysDisabledFocusNode(),
                      controller: _driver,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.chevron_right_rounded),
                        labelText: "Select Driver"
                      ),
                      onTap: () async {
                        
                        showDialog(context: context, builder: (context)=> Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          child: Container(
                                              height: height* 0.4,
                                                   width: width*0.8,
                                                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                               child: Padding(padding: EdgeInsets.all(8),
                                             child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Select Driver", style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold )),
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
                          SizedBox(height: height*0.01,),
            ],
          ),
          SizedBox(height: height*0.01,),
          Expanded(child: ListView.builder(itemCount: globalvariables.driver.length ,itemBuilder: (context,i){
              return Padding(padding: EdgeInsets.all(8),
              child: Container(
                  height: height*0.035,
                  width: width*0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(globalvariables.driver[i], style: TextStyle(fontFamily: 'Euclid Regular',fontSize: 18)),
                      Radio(
                        value: i,
                        groupValue: chosenDriver,
                        onChanged: (value) {
                          chosenDriver = i.toString();
                          _driver.text = globalvariables.driver[i];
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  globalvariables.addData(_driver.text);
                  Navigator.of(context).pop();
                });
              },
              child: Container(
                height: height*0.05,
                width: width*0.3,
                decoration: BoxDecoration(color: const Color(0xffF89818), borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("Submit", style: TextStyle(fontFamily: 'Euclid Regular',fontSize: 16, color: Colors.white),),),
              ),
            ),
          )
        ],
      ),
      ),
    ),
  ) 
  
  );
                      },
                    )
          ),),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  //globalvariables.startDate= _startDate.text;
                  if(isVisible== true){
                    Navigator.of(context).pop();
                  }else{
                  isVisible = !isVisible;
                  Navigator.of(context).pop();
                  }
                });
              },
              child: Container(
                height: height*0.05,
                width: width*0.3,
                decoration: BoxDecoration(color: const Color(0xffF89818), borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("Apply", style: TextStyle(fontFamily: 'Euclid',fontSize: 16, color: Colors.white),),),
              ),
            ),
          )
        ],
      ),
      ),
    ),
  ) 
  
  );
                            },),
                          )
                  ],
                ),
              ),
              if (globalvariables.options.isNotEmpty)Visibility(
                visible: isVisible,
                child: Container(
                  //height: height*0.25,
                  width: width*0.9,
                  child: 
                     Wrap(
                      direction: Axis.horizontal,
                       children: [
                         ChipsChoice<int>.single(
                          
                              value: tag,
                              onChanged: (val) => setState(() => tag = val),
                              choiceItems: C2Choice.listFrom<int, String>(
                                source: globalvariables.options,
                                value: (i, v) => i,
                                label: (i, v) => v,
                                tooltip: (i, v) => v,
                                delete: (i, v) => () {
                                  setState(() => globalvariables.options.removeAt(i));
                                },
                              ),
                              choiceStyle: C2ChipStyle.outlined(
                                borderOpacity: 0.3,
                                borderStyle: BorderStyle.solid,
                                color: Colors.black,
                                iconColor: const Color(0xffFF6368),
                                iconSize: 22,
                                selectedStyle: C2ChipStyle.filled(
                                  foregroundStyle:  const TextStyle(fontSize: 16.8,fontFamily: 'Euclid',color: Colors.white),
                                  iconColor: Colors.white,
                                  color: const Color(0xffFF6368)
                                ),
                                foregroundStyle: const TextStyle(fontSize: 16.8,fontFamily: 'Euclid',color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              wrapped: true,
                            ),
                       ],
                     ),
                ),
              ),
              const Align(alignment: Alignment.centerLeft,child: Padding(
                padding: EdgeInsets.only(left:22.0),
                child: Text("Available Shift",style: TextStyle(fontSize: 21, fontFamily: 'Euclid', fontWeight: FontWeight.bold, color: Colors.black),),
              )),
              Expanded(
                child: Container(
                  //color: Colors.amber,
                  width: width* 0.9,
                  child: FutureBuilder<Filter>(
                    future: driverInfo,
                    builder: (BuildContext context, snapshot) {
                    if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }if(snapshot.hasData){
                      return ListView.builder(itemCount: snapshot.data!.data?.length,itemBuilder: (BuildContext context, i){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: DriverProfileCard(height,width, snapshot.data!.data![i].driverImage,snapshot.data!.data![i].driverName,snapshot.data!.data![i].carNumber,snapshot.data!.data![i].shiftDateTime, snapshot.data!.data![i].status)
                        );
                      });
                    }
                    return  Center(child: const CircularProgressIndicator());
                  }),
                ),
              )
            ],
          ),
      ),
    );
  }
}


