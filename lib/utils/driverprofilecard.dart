import 'package:flutter/material.dart';

Widget DriverProfileCard(height, width,imageUrl, driverName,carNumber,shiftDateTime, status){
  return Container(
                            height: height * 0.1,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xff2257AA), width: 1, style: BorderStyle.solid),
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [SizedBox(width: 2,),
                                             CircleAvatar(radius: 30, backgroundImage: NetworkImage("https://dev-api.limadi.dk/"+imageUrl),),
                                             Container(width: width*0.5,
                                             //color: Colors.amber,
                                             child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left:5.0, ),
                                                  child: Text(driverName, style: TextStyle(fontSize: 18.2, fontFamily: 'Euclid', fontWeight: FontWeight.bold )),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:5.0,),
                                                  child: Text(carNumber,  style: TextStyle(fontSize: 14, fontFamily: 'Euclid Regular' )),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:5.0, ),
                                                  child: Text(shiftDateTime,  style: TextStyle(fontSize: 14, fontFamily: 'Euclid Regular' )),
                                                )
                                              ],
                                             ),),
                                             Column(
                                              //mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: height* 0.02,
                                                  width: width*0.16,
                                                 
                                                  decoration: BoxDecoration(color: Color(0xffF89818),
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                                                  ),
                                                  child: Center(child: Text(status, style: TextStyle(fontSize: 13, color: Colors.white, fontFamily: 'Euclid Regular' ),)),
                                                )
                                              ],
                                             )
                                          ],
                                        ),
                          );
}