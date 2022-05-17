import 'dart:convert';

import 'package:http/http.dart';

Future getRandomApiData() async {
  Response response =
      await get(Uri.parse('https://www.boredapi.com/api/activity'));

  if (response.statusCode == 200) {
    String data = response.body;

    var decodedData = jsonDecode(data);

    String activity = decodedData['activity'];
    String type = decodedData['type'];
    String participants = decodedData['participants'].toString();
    String price = decodedData['price'].toString();

    List<String> RandomResponse = [
      activity,
      type,
      participants,
      price,
    ];

    print('${RandomResponse} 02');

    return RandomResponse;
  } else {
    print(response.statusCode);
    print('erro');
  }
}

Future getApiDatabyType(String typeOfActivity) async {
  Response response = await get(
      Uri.parse('http://www.boredapi.com/api/activity?type=$typeOfActivity'));

  if (response.statusCode == 200) {
    String data = response.body;

    var decodedData = jsonDecode(data);

    String activity = decodedData['activity'];
    String type = decodedData['type'];
    String participants = decodedData['participants'].toString();
    String price = decodedData['price'].toString();

    List<String> TypedResponse = [
      activity,
      type,
      participants,
      price,
    ];

    print('$TypedResponse');

    return TypedResponse;
  } else {
    print(response.statusCode);
    print('erro');
  }
}

Future getApiDatabynumberOfParticipants(String numberOfParticipants) async {
  Response response = await get(Uri.parse(
      'http://www.boredapi.com/api/activity?participants=$numberOfParticipants'));

  if (response.statusCode == 200) {
    String data = response.body;

    var decodedData = jsonDecode(data);

    String activity = decodedData['activity'];
    String type = decodedData['type'];
    String participants = decodedData['participants'].toString();
    String price = decodedData['price'].toString();

    List<String> numberOfParticipantsResponse = [
      activity,
      type,
      participants,
      price,
    ];

    print('$numberOfParticipantsResponse');

    return numberOfParticipantsResponse;
  } else {
    print(response.statusCode);
    print('erro');
  }
}

Future getApiDatabyPrice(String minprice, String maxprice) async {
  Response response = await get(Uri.parse(
      'http://www.boredapi.com/api/activity?minprice=$minprice&maxprice=$maxprice'));

  if (response.statusCode == 200) {
    String data = response.body;

    var decodedData = jsonDecode(data);

    String activity = decodedData['activity'];
    String type = decodedData['type'];
    String participants = decodedData['participants'].toString();
    String price = decodedData['price'].toString();

    List<String> pricedResponse = [
      activity,
      type,
      participants,
      price,
    ];

    print('$pricedResponse');

    return pricedResponse;
  } else {
    print(response.statusCode);
    print('erro');
  }
}
