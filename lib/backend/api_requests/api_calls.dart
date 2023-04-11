import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start EFDev Group Code

class EFDevGroup {
  static String baseUrl = 'https://ef24apidev.azurewebsites.net/api/app';
  static Map<String, String> headers = {};
  static VehicleBrandsCall vehicleBrandsCall = VehicleBrandsCall();
  static VehicleModelsByBrandIdCall vehicleModelsByBrandIdCall =
      VehicleModelsByBrandIdCall();
  static VehicleTypesByModelIdCall vehicleTypesByModelIdCall =
      VehicleTypesByModelIdCall();
  static RegionsListCall regionsListCall = RegionsListCall();
  static ColorListCall colorListCall = ColorListCall();
  static PaintworkListCall paintworkListCall = PaintworkListCall();
  static RegisterVehicleCall registerVehicleCall = RegisterVehicleCall();
  static UpdateVehicleStepOneCall updateVehicleStepOneCall =
      UpdateVehicleStepOneCall();
  static UpdateVehicleStepThreeCall updateVehicleStepThreeCall =
      UpdateVehicleStepThreeCall();
  static VehicleDataByTypeCall vehicleDataByTypeCall = VehicleDataByTypeCall();
  static UpdateVehicleStepTwoCall updateVehicleStepTwoCall =
      UpdateVehicleStepTwoCall();
  static FuelListCall fuelListCall = FuelListCall();
  static VehiclesInGarageCall vehiclesInGarageCall = VehiclesInGarageCall();
  static PostVehicleInfoImagesCollectionCall
      postVehicleInfoImagesCollectionCall =
      PostVehicleInfoImagesCollectionCall();
  static PostVehicleInfoDamagedImagesCollectionCall
      postVehicleInfoDamagedImagesCollectionCall =
      PostVehicleInfoDamagedImagesCollectionCall();
  static PostVehicleFilesCall postVehicleFilesCall = PostVehicleFilesCall();
  static SearchVehicleByModelNumberCall searchVehicleByModelNumberCall =
      SearchVehicleByModelNumberCall();
  static TransportationTypesCall transportationTypesCall =
      TransportationTypesCall();
  static SetAuctionPreviewCall setAuctionPreviewCall = SetAuctionPreviewCall();
  static GetAuctionPreviewCall getAuctionPreviewCall = GetAuctionPreviewCall();
  static VehicleInfoStepTwoCall vehicleInfoStepTwoCall =
      VehicleInfoStepTwoCall();
  static VehicleInfoStepOneCall vehicleInfoStepOneCall =
      VehicleInfoStepOneCall();
  static VehicleInfoStepFourCall vehicleInfoStepFourCall =
      VehicleInfoStepFourCall();
  static GetVehicleImagesCall getVehicleImagesCall = GetVehicleImagesCall();
  static GetDamagedVehicleImagesCall getDamagedVehicleImagesCall =
      GetDamagedVehicleImagesCall();
  static GetVehicleFilesCall getVehicleFilesCall = GetVehicleFilesCall();
  static DeleteImageCall deleteImageCall = DeleteImageCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static SaveWidgetsCall saveWidgetsCall = SaveWidgetsCall();
  static GetWidgetsPropertiesCall getWidgetsPropertiesCall =
      GetWidgetsPropertiesCall();
  static GetWidgetsDescriptionsCall getWidgetsDescriptionsCall =
      GetWidgetsDescriptionsCall();
  static ActivateAuctionCall activateAuctionCall = ActivateAuctionCall();
  static ListCountriesCall listCountriesCall = ListCountriesCall();
  static ListLanguagesCall listLanguagesCall = ListLanguagesCall();
  static ValidateUIDCall validateUIDCall = ValidateUIDCall();
  static ValidateEmailCall validateEmailCall = ValidateEmailCall();
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static ListHowDidFindUsCall listHowDidFindUsCall = ListHowDidFindUsCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static LogoutUserCall logoutUserCall = LogoutUserCall();
  static TestAuthorizedWebserviceCall testAuthorizedWebserviceCall =
      TestAuthorizedWebserviceCall();
  static FindCountryByIdCall findCountryByIdCall = FindCountryByIdCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static RegisterSubuserCall registerSubuserCall = RegisterSubuserCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static ListSubusersCall listSubusersCall = ListSubusersCall();
  static ListFilterActiveAuctionsCall listFilterActiveAuctionsCall =
      ListFilterActiveAuctionsCall();
  static ListPurchasedVehiclesCall listPurchasedVehiclesCall =
      ListPurchasedVehiclesCall();
  static ListSoldVehiclesCall listSoldVehiclesCall = ListSoldVehiclesCall();
  static ListVehiclesInAuctionCall listVehiclesInAuctionCall =
      ListVehiclesInAuctionCall();
  static GetVehicleDetailsCall getVehicleDetailsCall = GetVehicleDetailsCall();
  static AddBidCall addBidCall = AddBidCall();
  static PassengerTypesListCall passengerTypesListCall =
      PassengerTypesListCall();
  static CommercialTypesListCall commercialTypesListCall =
      CommercialTypesListCall();
  static ActivateDeactivateSubuserCall activateDeactivateSubuserCall =
      ActivateDeactivateSubuserCall();
  static ListSubusersWithManagerCall listSubusersWithManagerCall =
      ListSubusersWithManagerCall();
}

class VehicleBrandsCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle Brands',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/brands',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic brands(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  dynamic brandNames(dynamic response) => getJsonField(
        response,
        r'''$.items[:].brandName''',
        true,
      );
  dynamic brandIds(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
}

class VehicleModelsByBrandIdCall {
  Future<ApiCallResponse> call({
    String? brandId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle Models By Brand Id',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/models-by-brand/${brandId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic modelNames(dynamic response) => getJsonField(
        response,
        r'''$.items[:].modelName''',
        true,
      );
  dynamic brandIds(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
}

class VehicleTypesByModelIdCall {
  Future<ApiCallResponse> call({
    String? modelId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle types by Model Id',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/types-by-model/${modelId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic typeNames(dynamic response) => getJsonField(
        response,
        r'''$.items[:].typeName''',
        true,
      );
  dynamic typeIds(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
}

class RegionsListCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Regions list',
      apiUrl: '${EFDevGroup.baseUrl}/regions/regions',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic regions(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  dynamic regionCodes(dynamic response) => getJsonField(
        response,
        r'''$.items[:].regionCode''',
        true,
      );
  dynamic regionNames(dynamic response) => getJsonField(
        response,
        r'''$.items[:].regionName''',
        true,
      );
}

class ColorListCall {
  Future<ApiCallResponse> call({
    String? language = 'de',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Color list',
      apiUrl:
          '${EFDevGroup.baseUrl}/externa-internal-color/internal-external-colors',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaintworkListCall {
  Future<ApiCallResponse> call({
    String? language = 'de',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Paintwork list',
      apiUrl: '${EFDevGroup.baseUrl}/externa-internal-color/paint-work-colors',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterVehicleCall {
  Future<ApiCallResponse> call({
    String? fuel = '',
    String? wheelDrive = '',
    String? gearTX = '',
    String? bodyType = '',
    String? doors = '',
    String? seats = '',
    String? creatorUserId = '',
    String? performancePs = '',
    String? performanceKw = '',
    String? brandId = '',
    String? modelId = '',
    String? typeId = '',
    bool? isCompleteInfo,
    String? language = '',
    String? bodySort = '',
  }) {
    final body = '''
{
  "creatorUserId": "${creatorUserId}",
  "brandId": "${brandId}",
  "wheelDrive": "${wheelDrive}",
  "modelId": "${modelId}",
  "gearTX": "${gearTX}",
  "typeId": "${typeId}",
  "fuel": "${fuel}",
  "bodyType": "${bodyType}",
  "bodySort": "${bodySort}",
  "performancePs": "${performancePs}",
  "performanceKw": "${performanceKw}",
  "doors": "${doors}",
  "seats": "${seats}",
  "isCompleteInfo": ${isCompleteInfo},
  "paintworkId": "69b0ddf6-31c1-4209-9528-96e4ce919e07",
  "interiorColorId": "cad3d7e1-0c40-4194-8ed8-c70f295cd80b",
  "exteriorColorId": "cad3d7e1-0c40-4194-8ed8-c70f295cd80b"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register vehicle',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/create',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateVehicleStepOneCall {
  Future<ApiCallResponse> call({
    String? fuel = '',
    String? wheelDrive = '',
    String? gearTX = '',
    String? bodyType = '',
    String? doors = '',
    String? seats = '',
    String? creatorUserId = '',
    String? performancePs = '',
    String? performanceKw = '',
    String? vehicleId = '',
    String? brandId = '',
    String? modelId = '',
    String? typeId = '',
    bool? isCompleteInfo,
    String? language = '',
    String? lastModifierId = '',
    String? bodySort = '',
  }) {
    final body = '''
{
  "id": "${vehicleId}",
  "creatorUserId": "${creatorUserId}",
  "brandId": "${brandId}",
  "wheelDrive": "${wheelDrive}",
  "modelId": "${modelId}",
  "gearTX": "${gearTX}",
  "typeId": "${typeId}",
  "fuel": "${fuel}",
  "bodyType": "${bodyType}",
  "bodySort": "${bodySort}",
  "performancePs": "${performancePs}",
  "performanceKw": "${performanceKw}",
  "doors": "${doors}",
  "seats": "${seats}",
  "isCompleteInfo": ${isCompleteInfo},
  "lastModifierId": "${lastModifierId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update vehicle StepOne',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/update',
      callType: ApiCallType.PUT,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateVehicleStepThreeCall {
  Future<ApiCallResponse> call({
    String? creatorUserId = '',
    String? vehicleId = '',
    bool? isCompleteInfo,
    String? language = '',
    String? lastModifierId = '',
    bool? isRegistrationAvailable,
  }) {
    final body = '''
{
  "id": "${vehicleId}",
  "creatorUserId": "${creatorUserId}",
  "isRegistrationAvailable": ${isRegistrationAvailable},
  "isCompleteInfo": ${isCompleteInfo},
  "lastModifierId": "${lastModifierId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update vehicle StepThree',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/update',
      callType: ApiCallType.PUT,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VehicleDataByTypeCall {
  Future<ApiCallResponse> call({
    String? typeId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle Data by Type',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/type-data/${typeId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateVehicleStepTwoCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? firstReg = '',
    String? frame = '',
    String? modelNumber = '',
    int? kilometers,
    String? exteriorColorId = '',
    String? interiorColorId = '',
    bool? isSwiss,
    String? paintworkId = '',
    String? region = '',
    String? additionalInfo = '',
    String? maintenanceRecord = '',
    bool? isGoodCondition,
    bool? isVariousTraces,
    bool? isInvolvedAccident,
    bool? isDogowner,
    bool? isSmoker,
    bool? isDamagebyhail,
    String? keys = '',
    String? inspectionDate = '',
    bool? isDamaged,
    String? repairs = '',
    String? bodyDamages = '',
    String? mechanics = '',
    String? creatorUserId = '',
    bool? isCompleteInfo,
    String? lastModifierId = '',
    String? language = '',
    bool? isExportedCar,
    String? mfk = '',
  }) {
    final body = '''
{
  "id": "${vehicleId}",
  "creatorUserId": "${creatorUserId}",
  "firstReg": "${firstReg}",
  "frame": "${frame}",
  "modelNumber": "${modelNumber}",
  "kilometers": ${kilometers},
  "exteriorColorId": "${exteriorColorId}",
  "interiorColorId": "${interiorColorId}",
  "isSwiss": ${isSwiss},
  "paintworkId": "${paintworkId}",
  "region": "${region}",
  "additionalInfo": "${additionalInfo}",
  "maintenanceRecordLabel": "${maintenanceRecord}",
  "isGoodCondition": ${isGoodCondition},
  "isVariousTraces": ${isVariousTraces},
  "isInvolvedAccident": ${isInvolvedAccident},
  "isDogowner": ${isDogowner},
  "isSmoker": ${isSmoker},
  "isDamagebyhail": ${isDamagebyhail},
  "isExportedCar": ${isExportedCar},
  "keys": "${keys}",
  "inspectionDate": "${inspectionDate}",
  "mfk": "${mfk}",
  "isDamaged": ${isDamaged},
  "isCompleteInfo": ${isCompleteInfo},
  "bodyDamages": "${bodyDamages}",
  "repairs": "${repairs}",
  "mechanics": "${mechanics}",
  "lastModifierId": "${lastModifierId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update vehicle StepTwo',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/update',
      callType: ApiCallType.PUT,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FuelListCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Fuel list',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/fuel-type',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic fuelCodes(dynamic response) => getJsonField(
        response,
        r'''$.items[:].code''',
        true,
      );
  dynamic fuelTexts(dynamic response) => getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      );
}

class VehiclesInGarageCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? language = '',
    int? skipCount,
    int? maxResultCount,
    String? filterSubUserId = '',
    String? sortSortDescription = '',
    bool? sortDesc = true,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicles in Garage',
      apiUrl:
          '${EFDevGroup.baseUrl}/garage-vehicle/retrieve-garages-vehicleby-user',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {
        'UserId': userId,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Filter.SubUserId': filterSubUserId,
        'Sort.SortDescription': sortSortDescription,
        'Sort.Desc': sortDesc,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostVehicleInfoImagesCollectionCall {
  Future<ApiCallResponse> call({
    dynamic? jsonBodyJson,
  }) {
    final jsonBody = _serializeJson(jsonBodyJson);
    final body = '''
${jsonBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post vehicle info images  collection',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/save-vehicle-presentation-image-collection',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostVehicleInfoDamagedImagesCollectionCall {
  Future<ApiCallResponse> call({
    dynamic? jsonBodyJson,
  }) {
    final jsonBody = _serializeJson(jsonBodyJson);
    final body = '''
${jsonBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post vehicle info damaged images  collection ',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/save-vehicle-damage-image-collection',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostVehicleFilesCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    int? positionDescriptor,
    String? imageBlobName = '',
  }) {
    final body = '''
{
  "vehicleId": "${vehicleId}",
  "positionDescriptor": ${positionDescriptor},
  "fileBlogName": "${imageBlobName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post vehicle files',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle-files/save-vehicle-file',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchVehicleByModelNumberCall {
  Future<ApiCallResponse> call({
    String? modelNumber = '',
    String? firstRegistration = '',
    String? language = '',
  }) {
    final body = '''
{
  "receptionPartType": "${modelNumber}",
  "circulationEntryDate": "${firstRegistration}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Search Vehicle by Model Number',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/find-vehicles-list-from-auto-data',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic vehicles(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
}

class TransportationTypesCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Transportation types',
      apiUrl:
          '${EFDevGroup.baseUrl}/auction-vehicle/vehicle-transportation-type',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic transportTypeId(dynamic response) => getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      );
  dynamic transportTypeDescription(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
}

class SetAuctionPreviewCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? transportTypeId = '',
    double? minPrice,
    double? transportCost,
    int? durationHours,
    double? minStepBid,
    double? buyNowPrice,
    String? language = '',
  }) {
    final body = '''
{
  "vehicleId": "${vehicleId}",
  "transportTypeId": "${transportTypeId}",
  "minPrice": ${minPrice},
  "transportCost": ${transportCost},
  "durationTimeSeconds": ${durationHours},
  "minStepBid": ${minStepBid},
  "buyNowPrice": ${buyNowPrice}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Set Auction preview',
      apiUrl: '${EFDevGroup.baseUrl}/auction-vehicle/set-auction-preview',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAuctionPreviewCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Auction preview',
      apiUrl:
          '${EFDevGroup.baseUrl}/auction-vehicle/auction-preview-info/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VehicleInfoStepTwoCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle info Step two',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle/vehicle-info-step-two/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VehicleInfoStepOneCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle info Step one',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle/vehicle-info-step-one/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VehicleInfoStepFourCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Vehicle info Step four',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle/vehicle-info-step-four/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetVehicleImagesCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get vehicle images',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/vehicle-presentation-images-by-id/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetDamagedVehicleImagesCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get damaged vehicle images',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/vehicle-damage-images-by-id/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetVehicleFilesCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get vehicle files',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/vehicle-files-by-id/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteImageCall {
  Future<ApiCallResponse> call({
    String? imageId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Image',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/vehicle-image-by-id/${imageId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? imageId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete File',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle-files/vehicle-file-by-id/${imageId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SaveWidgetsCall {
  Future<ApiCallResponse> call({
    String? check01 = '',
    String? check02 = '',
    String? check03 = '',
    String? check04 = '',
    String? check05 = '',
    String? check06 = '',
    String? check07 = '',
    String? check08 = '',
    String? check09 = '',
    String? check10 = '',
    String? check11 = '',
    String? check12 = '',
    String? check13 = '',
    String? check14 = '',
    String? check15 = '',
    String? check16 = '',
    String? check17 = '',
    String? check18 = '',
    String? check19 = '',
    String? check20 = '',
    String? check21 = '',
    String? check22 = '',
    String? check23 = '',
    String? check24 = '',
    String? check25 = '',
    String? check26 = '',
    String? check27 = '',
    String? check28 = '',
    String? check29 = '',
    String? check30 = '',
    String? check31 = '',
    String? check32 = '',
    String? check33 = '',
    String? check34 = '',
    String? check35 = '',
    String? check36 = '',
    String? check37 = '',
    String? check38 = '',
    String? check39 = '',
    String? check40 = '',
    String? check41 = '',
    String? check42 = '',
    String? check43 = '',
    String? check44 = '',
    String? check45 = '',
    String? check46 = '',
    String? check47 = '',
    String? check48 = '',
    String? vehicleId = '',
    String? language = '',
  }) {
    final body = '''
{
  "vehicleId": "${vehicleId}",
  "widgetList": [
    {
      "position": 1,
      "value": "${check01}"
    },
    {
      "position": 2,
      "value": "${check02}"
    },
    {
      "position": 3,
      "value": "${check03}"
    },
    {
      "position": 4,
      "value": "${check04}"
    },
    {
      "position": 5,
      "value": "${check05}"
    },
    {
      "position": 6,
      "value": "${check06}"
    },
    {
      "position": 7,
      "value": "${check07}"
    },
    {
      "position": 8,
      "value": "${check08}"
    },
    {
      "position": 9,
      "value": "${check09}"
    },
    {
      "position": 10,
      "value": "${check10}"
    },
    {
      "position": 11,
      "value": "${check11}"
    },
    {
      "position": 12,
      "value": "${check12}"
    },
    {
      "position": 13,
      "value": "${check13}"
    },
    {
      "position": 14,
      "value": "${check14}"
    },
    {
      "position": 15,
      "value": "${check15}"
    },
    {
      "position": 16,
      "value": "${check16}"
    },
    {
      "position": 17,
      "value": "${check17}"
    },
    {
      "position": 18,
      "value": "${check18}"
    },
    {
      "position": 19,
      "value": "${check19}"
    },
    {
      "position": 20,
      "value": "${check20}"
    },
    {
      "position": 21,
      "value": "${check21}"
    },
    {
      "position": 22,
      "value": "${check22}"
    },
    {
      "position": 23,
      "value": "${check23}"
    },
    {
      "position": 24,
      "value": "${check24}"
    },
    {
      "position": 25,
      "value": "${check25}"
    },
    {
      "position": 26,
      "value": "${check26}"
    },
    {
      "position": 27,
      "value": "${check27}"
    },
    {
      "position": 28,
      "value": "${check28}"
    },
    {
      "position": 29,
      "value": "${check29}"
    },
    {
      "position": 30,
      "value": "${check30}"
    },
    {
      "position": 31,
      "value": "${check31}"
    },
    {
      "position": 32,
      "value": "${check32}"
    },
    {
      "position": 33,
      "value": "${check33}"
    },
    {
      "position": 34,
      "value": "${check34}"
    },
    {
      "position": 35,
      "value": "${check35}"
    },
    {
      "position": 36,
      "value": "${check36}"
    },
    {
      "position": 37,
      "value": "${check37}"
    },
    {
      "position": 38,
      "value": "${check38}"
    },
    {
      "position": 39,
      "value": "${check39}"
    },
    {
      "position": 40,
      "value": "${check40}"
    },
    {
      "position": 41,
      "value": "${check41}"
    },
    {
      "position": 42,
      "value": "${check42}"
    },
    {
      "position": 43,
      "value": "${check43}"
    },
    {
      "position": 44,
      "value": "${check44}"
    },
    {
      "position": 45,
      "value": "${check45}"
    },
    {
      "position": 46,
      "value": "${check46}"
    },
    {
      "position": 47,
      "value": "${check47}"
    },
    {
      "position": 48,
      "value": "${check48}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save widgets',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/save-vehicle-widgets',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetWidgetsPropertiesCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get widgets Properties',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle/vehicle-widgets-properties/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetWidgetsDescriptionsCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get widgets Descriptions',
      apiUrl:
          '${EFDevGroup.baseUrl}/vehicle/vehicle-widgets-descriptions/${vehicleId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic widgetList(dynamic response) => getJsonField(
        response,
        r'''$.widgetList''',
        true,
      );
}

class ActivateAuctionCall {
  Future<ApiCallResponse> call({
    String? vehicleId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Activate auction',
      apiUrl:
          '${EFDevGroup.baseUrl}/auction-vehicle/auction-vehicle-activation/${vehicleId}',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListCountriesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List countries',
      apiUrl: '${EFDevGroup.baseUrl}/countries/countries',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListLanguagesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List languages',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/available-languages',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
  dynamic descriptions(dynamic response) => getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      );
}

class ValidateUIDCall {
  Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate UID',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/is-unique-uid?uid=${uid}',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ValidateEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Email',
      apiUrl:
          '${EFDevGroup.baseUrl}/user-management/is-unique-email?email=${email}',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? country = '',
    String? town = '',
    String? postCode = '',
    String? poBox = '',
    String? uid = '',
    String? company = '',
    String? street = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? telephone = '',
    String? telephone2 = '',
    String? username = '',
    String? password = '',
    String? passwordConfirm = '',
    String? salutation = '',
    int? preferredLanguage,
    bool? acceptTerms,
    bool? acceptShare,
    bool? isCommercial,
    String? jobRole = '',
    int? findUs,
  }) {
    final body = '''
{
 "countryIdent": "${country}",
 "town": "${town}",
 "postCode": "${postCode}",
 "poBox": "${poBox}",
 "isCommercialRegister": ${isCommercial},
 "uid": "${uid}",
 "companyName": "${company}",
 "street": "${street}",
 "firstName": "${firstName}",
 "lastName": "${lastName}",
 "email": "${email}",
 "telephone": "${telephone}",
 "mobilephone": "${telephone2}",
 "username": "${username}",
 "password": "${password}",
 "passwordConfirmation": "${passwordConfirm}",
 "preferredLanguageId": ${preferredLanguage},
 "salutationDescription": "${salutation}",
 "acceptTermAndConditions": ${acceptTerms},
 "acceptDataShare": ${acceptShare},
 "customerJobRole": "${jobRole}",
 "howDidFindUsId": ${findUs}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register user',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/user-registration',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListHowDidFindUsCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List How did find us',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/how-did-find-options',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? language = '',
  }) {
    final body = '''
{
  "userNameOrEmail": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login user',
      apiUrl: '${EFDevGroup.baseUrl}/user-custom-authentication/login',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isLogged(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.firstName''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.lastName''',
      );
  dynamic language(dynamic response) => getJsonField(
        response,
        r'''$.preferredLanguage''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.userRole''',
      );
  dynamic isSubUser(dynamic response) => getJsonField(
        response,
        r'''$.isSubUser''',
      );
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.validationErrors[:].message''',
      );
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic companyId(dynamic response) => getJsonField(
        response,
        r'''$.companyId''',
      );
}

class LogoutUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    final body = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logout user',
      apiUrl: '${EFDevGroup.baseUrl}/user-custom-authentication/logout',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
}

class TestAuthorizedWebserviceCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Test Authorized webservice',
      apiUrl:
          '${EFDevGroup.baseUrl}/externa-internal-color/authorized-paint-work-colors',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FindCountryByIdCall {
  Future<ApiCallResponse> call({
    String? countryId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Find country by Id',
      apiUrl: '${EFDevGroup.baseUrl}/countries/country-by-id/${countryId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic phoneCode(dynamic response) => getJsonField(
        response,
        r'''$.phoneCode''',
      );
  dynamic countryCode(dynamic response) => getJsonField(
        response,
        r'''$.countryCode''',
      );
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? currentPassword = '',
    String? newPassword = '',
    String? language = '',
  }) {
    final body = '''
{
  "userId": "${userId}",
  "currentPassword": "${currentPassword}",
  "newPassword": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '${EFDevGroup.baseUrl}/user-custom-authentication/reset-password',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isChanged(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.validationErrors[:].message''',
      );
}

class RegisterSubuserCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? parentUserId = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? telephone = '',
    String? telephone2 = '',
    String? username = '',
    int? preferedLanguageId,
    String? aboutYourself = '',
  }) {
    final body = '''
{
  "parentUserId": "${parentUserId}",
  "firstName": "${firstName}",
  "lastName": "${lastName}",
  "email": "${email}",
  "telephone": "${telephone}",
  "telephone2": "${telephone2}",
  "username": "${username}",
  "preferredLanguageId": ${preferedLanguageId},
  "aboutYourselfComment": "${aboutYourself}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register subuser',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/sub-user-registration',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete account',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/remove-account/${userId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic isDeleted(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ListSubusersCall {
  Future<ApiCallResponse> call({
    String? userManagerId = '',
    String? language = '',
    int? skipCount,
    int? maxResultCount,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List subusers',
      apiUrl: '${EFDevGroup.baseUrl}/user-management/sub-users',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {
        'UserManagerId': userManagerId,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic subUsers(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.totalCount''',
      );
  dynamic fullNames(dynamic response) => getJsonField(
        response,
        r'''$.items[:].fullName''',
        true,
      );
  dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      );
}

class ListFilterActiveAuctionsCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? userId = '',
    String? typeDescription = '',
    String? sortDescription = '',
    bool? isFavorite,
    bool? hasBuyNowPrice,
    List<String>? regionCodesList,
    int? maxResultCount,
    int? skipCount,
    String? searchBrand = '',
    String? searchModel = '',
    String? searchFuel = '',
    int? searchMinYear,
    int? searchMaxYear,
    double? searchMinPrice,
    double? searchMaxPrice,
    List<String>? searchPassengerList,
    List<String>? searchCommercialList,
    List<String>? searchRegionList,
  }) {
    final regionCodes = _serializeList(regionCodesList);
    final searchPassenger = _serializeList(searchPassengerList);
    final searchCommercial = _serializeList(searchCommercialList);
    final searchRegion = _serializeList(searchRegionList);

    final body = '''
{
  "maxResultCount": ${maxResultCount},
  "skipCount": ${skipCount},
  "currentUserId": "${userId}",
  "vehicleParams": {
    "brandId": "${searchBrand}",
    "modelId": "${searchModel}",
    "regionCodes": ${searchRegion},
    "minYear": ${searchMinYear},
    "maxYear": ${searchMaxYear},
    "passengerVehicleId": ${searchPassenger},
    "commercialVehicleId": ${searchCommercial},
    "fuelCode": "${searchFuel}",
    "minPrice": ${searchMinPrice},
    "maxPrice": ${searchMaxPrice}
  },
  "visibility": {
    "regionCodes": ${regionCodes},
    "isFavorite": ${isFavorite},
    "hasBuyNowPrice": ${hasBuyNowPrice}
  },
  "type": {
    "typeDescription": "${typeDescription}"
  },
  "sort": {
    "sortDescription": "${sortDescription}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'List filter active auctions',
      apiUrl: '${EFDevGroup.baseUrl}/auction-vehicle/auction-search-list',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListPurchasedVehiclesCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? userBuyerId = '',
    int? skipCount,
    int? maxResultCount,
    String? sortSortDescription = '',
    bool? sortDesc = true,
    String? filterSubUserId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List purchased vehicles',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/purchased-vehicles-list-by-buyer',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {
        'UserBuyerId': userBuyerId,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Sort.SortDescription': sortSortDescription,
        'Sort.Desc': sortDesc,
        'Filter.SubUserId': filterSubUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListSoldVehiclesCall {
  Future<ApiCallResponse> call({
    String? language = '',
    int? skipCount,
    int? maxResultCount,
    String? userSellerId = '',
    String? sortSortDescription = '',
    bool? sortDesc = true,
    String? filterSubUserId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List sold vehicles',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/sold-vehicles-list-by-seller',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {
        'UserSellerId': userSellerId,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Sort.SortDescription': sortSortDescription,
        'Sort.Desc': sortDesc,
        'Filter.SubUserId': filterSubUserId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListVehiclesInAuctionCall {
  Future<ApiCallResponse> call({
    String? language = '',
    int? skipCount,
    int? maxResultCount,
    String? userId = '',
    String? filterSubUserId = '',
    bool? sortDesc = true,
    String? sortSortDescription = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List vehicles in auction',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/vehicles-in-auction-by-user',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {
        'UserId': userId,
        'SkipCount': skipCount,
        'MaxResultCount': maxResultCount,
        'Filter.SubUserId': filterSubUserId,
        'Sort.Desc': sortDesc,
        'Sort.SortDescription': sortSortDescription,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetVehicleDetailsCall {
  Future<ApiCallResponse> call({
    String? language = '',
    String? vehicleId = '',
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get vehicle details',
      apiUrl: '${EFDevGroup.baseUrl}/bid/vehicle-detail-bid',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-Language': '${language}',
      },
      params: {
        'userId': userId,
        'vehicleId': vehicleId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic brand(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.brand''',
      );
  dynamic model(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.model''',
      );
  dynamic gearTx(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.gear''',
      );
  dynamic doors(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.doors''',
      );
  dynamic seats(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.seats''',
      );
  dynamic ps(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.performancePs''',
      );
  dynamic kw(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.performanceKw''',
      );
  dynamic kilometers(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.kilometers''',
      );
  dynamic keys(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.keys''',
      );
  dynamic firstReg(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.firstReg''',
      );
  dynamic fuel(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.fuel''',
      );
  dynamic region(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.region''',
      );
  dynamic extColor(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.exteriorColor''',
      );
  dynamic intColor(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.interiorColor''',
      );
  dynamic paintwork(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.paintwork''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.type''',
      );
  dynamic bodyType(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.bodyType''',
      );
  dynamic modelNumber(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.modelNumber''',
      );
  dynamic frame(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.frame''',
      );
  dynamic inspectionDate(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.inspectionDate''',
      );
  dynamic minPrice(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.minPrice''',
      );
  dynamic minStepBid(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.minStepBid''',
      );
  dynamic soldPrice(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.finalSoldPrice''',
      );
  dynamic buyNow(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.buyNowPrice''',
      );
  dynamic remainingTime(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.remainingTime''',
      );
  dynamic transportType(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.transportTypeDescription''',
      );
  dynamic transportCost(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.transportCost''',
      );
  dynamic additionalInfo(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.additionalInfo''',
      );
  dynamic isOvertime(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.hasFirstTimeIncrement''',
      );
  dynamic hasTransportCost(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.transportCostApplies''',
      );
  dynamic totalBidders(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.bidders''',
      );
  dynamic isProfessionalSeller(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isProfessionalSeller''',
      );
  dynamic mechanics(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.mechanics''',
      );
  dynamic wheelDrive(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.wheelDrive''',
      );
  dynamic maintenancRecord(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.maintenanceRecordLabel''',
      );
  dynamic bodyDamages(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.bodyDamages''',
      );
  dynamic condition1(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isGoodCondition''',
      );
  dynamic condition2(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isVariousTraces''',
      );
  dynamic condition3(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isInvolvedAccident''',
      );
  dynamic condition4(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isDogowner''',
      );
  dynamic condition5(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isSmoker''',
      );
  dynamic condition6(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isDamagebyhail''',
      );
  dynamic condition7(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isExportedCar''',
      );
  dynamic isSwiss(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.isSwiss''',
      );
  dynamic isDamaged(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.isDamaged''',
      );
  dynamic repairs(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleData.repairs''',
      );
  dynamic sellerCompanyId(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.sellerCompanyId''',
      );
  dynamic sellerUserId(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.sellerId''',
      );
  dynamic remainingOverTime(dynamic response) => getJsonField(
        response,
        r'''$.auctionData.remainingOverTime''',
      );
  dynamic isRegAvailable(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.isRegistrationAvailable''',
      );
  dynamic isPurchasedVehicle(dynamic response) => getJsonField(
        response,
        r'''$.vehicleInfo.vehicleDetails.isPurchasedVehicle''',
      );
}

class AddBidCall {
  Future<ApiCallResponse> call({
    String? auctionId = '',
    String? userId = '',
    double? bidAmount,
    bool? isBuyNow,
  }) {
    final body = '''
{
  "auctionId": "${auctionId}",
  "userCreatorId": "${userId}",
  "bidAmount": ${bidAmount},
  "isBuyNowPriceBid": ${isBuyNow}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add bid',
      apiUrl: '${EFDevGroup.baseUrl}/bid/add-new-bid',
      callType: ApiCallType.POST,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PassengerTypesListCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Passenger types list',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/passenger-vehicles',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic typeIds(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic typeDescriptions(dynamic response) => getJsonField(
        response,
        r'''$[:].description''',
        true,
      );
}

class CommercialTypesListCall {
  Future<ApiCallResponse> call({
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Commercial types list',
      apiUrl: '${EFDevGroup.baseUrl}/vehicle/commercial-vehicles',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic typeIds(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic typeDescriptions(dynamic response) => getJsonField(
        response,
        r'''$[:].description''',
        true,
      );
}

class ActivateDeactivateSubuserCall {
  Future<ApiCallResponse> call({
    String? subUserId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Activate deactivate subuser',
      apiUrl:
          '${EFDevGroup.baseUrl}/user-management/activate-deactivate-sub-user/${subUserId}',
      callType: ApiCallType.PUT,
      headers: {
        ...EFDevGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListSubusersWithManagerCall {
  Future<ApiCallResponse> call({
    String? userManagerId = '',
    String? language = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'List subusers with manager',
      apiUrl:
          '${EFDevGroup.baseUrl}/user-management/sub-users-with-manager/${userManagerId}',
      callType: ApiCallType.GET,
      headers: {
        ...EFDevGroup.headers,
        'Accept-language': '${language}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic fullNames(dynamic response) => getJsonField(
        response,
        r'''$[:].fullName''',
        true,
      );
}

/// End EFDev Group Code

/// Start EFConnection Group Code

class EFConnectionGroup {
  static String baseUrl = 'https://ef24apidev.azurewebsites.net/connect';
  static Map<String, String> headers = {};
  static GetTokenCall getTokenCall = GetTokenCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
}

class GetTokenCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get token',
      apiUrl: '${EFConnectionGroup.baseUrl}/token',
      callType: ApiCallType.POST,
      headers: {
        ...EFConnectionGroup.headers,
      },
      params: {
        'client_id': "EF24_App",
        'username': username,
        'password': password,
        'scope': "EF24 offline_access",
        'grant_type': "password",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic errorDescription(dynamic response) => getJsonField(
        response,
        r'''$.error_description''',
      );
  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.refresh_token''',
      );
  dynamic expiresIn(dynamic response) => getJsonField(
        response,
        r'''$.expires_in''',
      );
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Refresh token',
      apiUrl: '${EFConnectionGroup.baseUrl}/token',
      callType: ApiCallType.POST,
      headers: {
        ...EFConnectionGroup.headers,
      },
      params: {
        'grant_type': "refresh_token",
        'client_id': "EF24_App",
        'refresh_token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic errorDescription(dynamic response) => getJsonField(
        response,
        r'''$.error_description''',
      );
  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.refresh_token''',
      );
  dynamic expiresIn(dynamic response) => getJsonField(
        response,
        r'''$.expires_in''',
      );
}

/// End EFConnection Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
