import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String replaceDate(String textToChange) {
  // replace / for .
  return textToChange.replaceAll("/", ".");
}

String changeDateFormat(
  String textDate,
  int formatId,
) {
  String resultDate = "";

  try {
    var dateTime = DateTime.parse(textDate);

    if (formatId == 0)
      resultDate = DateFormat('dd.MM.yyyy').format(dateTime);
    else if (formatId == 1) resultDate = DateFormat('MM/yyyy').format(dateTime);
  } catch (e) {
    resultDate = textDate;
  }
  return resultDate;
}

String getFileFullPath(
  String imageName,
  int locationId,
  String baseUrl,
  String vehicleId,
) {
  String containerName = "";
  if (locationId == 0) {
    containerName = "/vehicleimages/";
  } else if (locationId == 1) {
    containerName = "/vehicledamages/";
  } else if (locationId == 2) {
    containerName = "/vehiclefiles/";
  }

  return baseUrl + containerName + vehicleId + "/" + imageName;
}

List<dynamic> verifyNullList(List<dynamic> jsonList) {
  // if a json list is null return an empty list
  List<dynamic> outputList = <dynamic>[];

  for (var dataField in jsonList) {
    if (dataField == null) {
      dataField = "";
    }

    outputList.add(dataField);
  }

  return outputList;
}

String getFileFullPathString(
  String imageName,
  int locationId,
  String baseUrl,
  String vehicleId,
) {
  String containerName = "";
  if (locationId == 0) {
    containerName = "/vehicleimages/";
  } else if (locationId == 1) {
    containerName = "/vehicledamages/";
  } else if (locationId == 2) {
    containerName = "/vehiclefiles/";
  }

  return baseUrl + containerName + vehicleId + "/" + imageName;
}

String convertIntToString(int valueToConvert) {
  String result = "";
  // Convert integer to string
  try {
    print(valueToConvert.toString()); // 9.0
    result = valueToConvert.toString();
  } catch (exp) {
    print(exp.toString()); // Exeption: CastError
  }
  return result;
}

int getCountList(List<dynamic> jsonList) {
  try {
    // if a json list is null return an empty list
    List<dynamic> outputList = <dynamic>[];

    for (var dataField in jsonList) {
      if (dataField == null) {
        dataField = "";
      }

      outputList.add(dataField);
    }

    return outputList.length;
  } catch (e) {
    return 0;
  }
}

String formatNumberThousand(double? number) {
  if (number == null) return "";

  var f = NumberFormat("###,###.00", "en_US");

  var n = f.format(number);

  String newFormat = n.replaceAll(",", "'");

  return newFormat;
}

String formatNumberThousandInt(double? number) {
  if (number == null) return "";

  var f = NumberFormat("###,###", "en_US");

  var n = f.format(number);

  String newFormat = n.replaceAll(",", "'");

  return newFormat;
}

double stringToDouble(String value) {
  try {
    // convert string to double with 2 decimals
    return double.parse((value));
  } catch (e) {
    return 0;
  }
}

List<String> generateYearList(
  int minYearModel,
  int minYearMin,
  int minYearMax,
) {
  List<String> years = [];

  if (minYearModel <= 0) return years;

  int minYear = minYearMin > minYearModel ? minYearMin : minYearModel;
  int maxYear = minYearMax > 0 ? minYearMax : DateTime.now().year;

  for (int i = minYear; i <= maxYear; i++) {
    years.add(i.toStringAsFixed(0));
  }

  return years;
}

String convertDoubleToString(
  double value,
  int decimals,
) {
  if (value == 0) return "";
  // convert double to string with n decimals
  return value.toStringAsFixed(decimals);
}

int stringToInt(String? value) {
  try {
    // convert string to double with 2 decimals
    return int.parse((value!));
  } catch (e) {
    return 0;
  }
}

List<int>? dynamicListToListInt(List<dynamic> jsonList) {
  try {
    return jsonList.map((x) => x as int).toList();
  } catch (e) {
    return null;
  }
}

String convertDateTimeToJson(DateTime? dateToChange) {
  if (dateToChange == null) {
    return "";
  }
  // copnvert datetime to json format
  return dateToChange.toUtc().toIso8601String();
}

double getIncrementBid(
  double newOffer,
  double oldOffer,
) {
  return (newOffer - oldOffer);
}

DateTime? addSecondsToDate(
  DateTime? dateTime,
  int seconds,
) {
  // add seconds to a datetime
  if (dateTime == null) {
    return DateTime.now();
  }
  if (seconds == null) {
    return dateTime;
  }
  return dateTime.add(Duration(seconds: seconds));
}

double getTotalIncrement(
  double newOffer,
  double transport,
  double fee,
) {
  return (newOffer + transport + fee);
}

bool validatePasswordRequirements(String password) {
  // validate password has letters and numbers
  final RegExp regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$^&+!])[A-Za-z\d@#$^&+!]{8,16}$');
  return regex.hasMatch(password);
}

String? setTextToLowercase(String? textToChange) {
  // change text to lowercase
  if (textToChange == null) {
    return null;
  }
  return textToChange.toLowerCase();
}

bool validateUIDRequirements(String uid) {
  // validate password has letters and numbers
  final RegExp regex = RegExp(r'^(?=.*\d)[\d]{3}.[\d]{3}.[\d]{3}$');
  return regex.hasMatch(uid);
}

bool validateTelephoneRequirements(String telephone) {
  // validate password has letters and numbers
  final RegExp regex = RegExp(r'^(?=.*\d)[\d]{9,15}$');
  return regex.hasMatch(telephone);
}

int countTrueConditions(
  bool condition1,
  bool condition2,
  bool condition3,
  bool condition4,
  bool condition5,
  bool condition6,
  bool condition7,
) {
  // count how many booleans are true in a list of booleans
  int count = 0;

  count = count + (condition1 ? 1 : 0);
  count = count + (condition2 ? 1 : 0);
  count = count + (condition3 ? 1 : 0);
  count = count + (condition4 ? 1 : 0);
  count = count + (condition5 ? 1 : 0);
  count = count + (condition6 ? 1 : 0);
  count = count + (condition7 ? 1 : 0);

  return count;
}

bool isNullList(List<dynamic> jsonList) {
  // if a json list is null return an empty list
  List<dynamic> outputList = <dynamic>[];

  for (var dataField in jsonList) {
    if (dataField == null) {
      break;
    }

    outputList.add(dataField);
  }

  return outputList.length > 0;
}

String? replaceLineBreaks(String? text) {
  if (text == null) return null;
  return text
      .replaceAll(RegExp(r'\n'), '\\n')
      .replaceAll(RegExp(r'\\'), '\\\\');
}

List<String> generatePriceList(
  double currentPrice,
  double stepBid,
  int quantity,
  double buyPrice,
  bool isMinimumPrice,
) {
  List<String> prices = [];
  double priceAdd = 0;

  stepBid = stepBid == 0 ? 50 : stepBid;

  for (int i = 1; i <= quantity; i++) {
    int multiply = isMinimumPrice ? i - 1 : i;
    if ((currentPrice + multiply * stepBid) < buyPrice || buyPrice <= 0) {
      priceAdd = currentPrice + multiply * stepBid;
    } else {
      priceAdd = buyPrice;
      i = quantity;
    }

    prices.add(priceAdd.toStringAsFixed(0));
  }

  return prices;
}

double getNewIncrement(
  double newOffer,
  double step,
) {
  return (newOffer + step);
}

String getMinYearFromModel(
  dynamic jsonModels,
  String modelId,
) {
  try {
    //var data = jsonDecode(jsonModels.toString());
    var models = jsonModels['items'] as List;
    return ((models.where((val) => val['id'] == modelId).first)['minYear']
            as int)
        .toString();
  } catch (e) {
    return e.toString();
  }

  //return "";
}
