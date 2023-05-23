class Filter {
 
  List<Data>? data;

  Filter({this.data});

  Filter.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  String? statusShow;
  String? driverName;
  String? driverImage;
  String? carName;
  int? carId;
  String? carNumber;
  String? shiftStartDate;
  String? shiftEndDate;
  String? shiftStartTime;
  String? shiftEndTime;
  String? shiftDateTimeRaw;
  String? shiftDateTime;
  Null? location;
  int? isMaintenance;

  Data(
      {this.id,
      this.status,
      this.statusShow,
      this.driverName,
      this.driverImage,
      this.carName,
      this.carId,
      this.carNumber,
      this.shiftStartDate,
      this.shiftEndDate,
      this.shiftStartTime,
      this.shiftEndTime,
      this.shiftDateTimeRaw,
      this.shiftDateTime,
      this.location,
      this.isMaintenance});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusShow = json['status_show'];
    driverName = json['driver_name'];
    driverImage = json['driver_image'];
    carName = json['car_name'];
    carId = json['car_id'];
    carNumber = json['car_number'];
    shiftStartDate = json['shift_start_date'];
    shiftEndDate = json['shift_end_date'];
    shiftStartTime = json['shift_start_time'];
    shiftEndTime = json['shift_end_time'];
    shiftDateTimeRaw = json['shift_date_time_raw'];
    shiftDateTime = json['shift_date_time'];
    location = json['location'];
    isMaintenance = json['is_maintenance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_show'] = this.statusShow;
    data['driver_name'] = this.driverName;
    data['driver_image'] = this.driverImage;
    data['car_name'] = this.carName;
    data['car_id'] = this.carId;
    data['car_number'] = this.carNumber;
    data['shift_start_date'] = this.shiftStartDate;
    data['shift_end_date'] = this.shiftEndDate;
    data['shift_start_time'] = this.shiftStartTime;
    data['shift_end_time'] = this.shiftEndTime;
    data['shift_date_time_raw'] = this.shiftDateTimeRaw;
    data['shift_date_time'] = this.shiftDateTime;
    data['location'] = this.location;
    data['is_maintenance'] = this.isMaintenance;
    return data;
  }
}