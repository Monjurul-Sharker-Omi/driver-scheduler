import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:test_assignment/model/index.dart';
import 'package:test_assignment/utils/apihandler.dart';
import 'package:test_assignment/utils/driverprofilecard.dart';
import 'package:date_format/date_format.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Filter>? driverInfo;
  //Future<Cardetails>? carInfo;

  @override
  void initState() {
    super.initState();
    driverInfo = api().fetchDriverInfo();
    //carInfo = api().fetchCarInfo();
  }  
  int tag = 3;
   List<String> options = [
    "David",
    'AA 99 999',
    '11. Jan 2023',
    '8:00'
  ];
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
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(child: Text("Shift Planner", style: TextStyle(fontSize: 35, fontFamily: 'Euclid', fontWeight: FontWeight.bold ))),
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
                              color: const Color.fromRGBO(248, 152, 24, 100),
                            ),
                            child: IconButton(icon: const Icon(Icons.tune),
                            onPressed: () {
                              showDialog(context: context, builder: (context)=> Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: SizedBox(
      height: height* 0.6,
      width: width*0.8,
      child: Padding(padding: EdgeInsets.all(8),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Filter", style: TextStyle(fontSize: 20, fontFamily: 'Euclid', fontWeight: FontWeight.bold )),
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
                    controller: _startDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range_rounded),
                      labelText: "Start Date"
                    ),
                    onTap: () async {
                      DateTime? pickDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                      if (pickDate!= null){
                        setState(() {
                          _startDate.text = formatDate(pickDate, [dd, ".", MM," ", yyyy]);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
                    controller: _endDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range_rounded),
                      labelText: "End Date"
                    ),
                    onTap: () async {
                      DateTime? pickDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                      if (pickDate!= null){
                        setState(() {
                          _startDate.text = formatDate(pickDate, [dd, ".", MM," ", yyyy]);
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
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height*0.09,
                  width: width*0.35,
                  child: TextField(
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
                      controller: _license,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.chevron_right_rounded),
                        labelText: "Select Car/License Plate"
                      ),
                      onTap: () async {
                        showDialog(context: context, builder: (context)=> Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    // }if(snapshot.hasData){
                    //   return ListView.builder(itemCount: snapshot.data!.data!.cars.length,itemBuilder: (BuildContext context, i){
                    //     return Padding(
                    //       padding: const EdgeInsets.only(top: 10),
                    //       child: Container(
                    //         height: height*0.1,
                    //         width: width*0.5,

                    //         child: Center(child: Text(snapshot.data!.data![i].cars.toString()),),
                    //       )
                    //     );
                    //   });
                    // }
                    // return const CircularProgressIndicator();
                    //         }),
                    //       ))
                
            ],
          ),
          
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
                      controller: _driver,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.chevron_right_rounded),
                        labelText: "Select Driver"
                      ),
                    )
          ),)
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
              Container(
                height: height*0.13,
                width: width*0.9,
                child: 
                   ChipsChoice<int>.single(
                    
                        value: tag,
                        onChanged: (val) => setState(() => tag = val),
                        choiceItems: C2Choice.listFrom<int, String>(
                          source: options,
                          value: (i, v) => i,
                          label: (i, v) => v,
                          tooltip: (i, v) => v,
                          delete: (i, v) => () {
                            setState(() => options.removeAt(i));
                          },
                        ),
                        choiceStyle: C2ChipStyle.toned(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        wrapped: true,
                      ),
              ),
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
                    return Center(child: const CircularProgressIndicator());
                  }),
                ),
              )
            ],
          ),
      ),
    );
  }
}
