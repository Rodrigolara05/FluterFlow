import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _IsPrivate = prefs.getBool('ff_IsPrivate') ?? _IsPrivate;
    _IsLoggedUser = prefs.getBool('ff_IsLoggedUser') ?? _IsLoggedUser;
    _UserId = prefs.getString('ff_UserId') ?? _UserId;
    _BlobConnectionString =
        prefs.getString('ff_BlobConnectionString') ?? _BlobConnectionString;
    _BaseFilePath = prefs.getString('ff_BaseFilePath') ?? _BaseFilePath;
    _Version = prefs.getString('ff_Version') ?? _Version;
    _AccessToken = prefs.getString('ff_AccessToken') ?? _AccessToken;
    _RefreshToken = prefs.getString('ff_RefreshToken') ?? _RefreshToken;
    _TokenExpiration = prefs.containsKey('ff_TokenExpiration')
        ? DateTime.fromMillisecondsSinceEpoch(
            prefs.getInt('ff_TokenExpiration')!)
        : _TokenExpiration;
    _isSubUser = prefs.getBool('ff_isSubUser') ?? _isSubUser;
    _userEmail = prefs.getString('ff_userEmail') ?? _userEmail;
    _companyId = prefs.getString('ff_companyId') ?? _companyId;
    _firstName = prefs.getString('ff_firstName') ?? _firstName;
    _lastName = prefs.getString('ff_lastName') ?? _lastName;
    _countryId = prefs.getInt('ff_countryId') ?? _countryId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _IsPrivate = true;
  bool get IsPrivate => _IsPrivate;
  set IsPrivate(bool _value) {
    _IsPrivate = _value;
    prefs.setBool('ff_IsPrivate', _value);
  }

  bool _IsLoggedUser = false;
  bool get IsLoggedUser => _IsLoggedUser;
  set IsLoggedUser(bool _value) {
    _IsLoggedUser = _value;
    prefs.setBool('ff_IsLoggedUser', _value);
  }

  String _UserId = '00000000-0000-0000-0000-000000000000';
  String get UserId => _UserId;
  set UserId(String _value) {
    _UserId = _value;
    prefs.setString('ff_UserId', _value);
  }

  bool _IsRegVehStep1Completed = false;
  bool get IsRegVehStep1Completed => _IsRegVehStep1Completed;
  set IsRegVehStep1Completed(bool _value) {
    _IsRegVehStep1Completed = _value;
  }

  String _NewVehicleId = '';
  String get NewVehicleId => _NewVehicleId;
  set NewVehicleId(String _value) {
    _NewVehicleId = _value;
  }

  String _BlobConnectionString =
      'DefaultEndpointsProtocol=https;AccountName=ef24devstorage;AccountKey=mT9Ol19l9yW/QSsBKwIauxN7vIe06z2tDPq231XQn537zTs8hcItjM6s/ua1cDKv8ksjXFfCt3nU+AStkIJf6Q==;EndpointSuffix=core.windows.net';
  String get BlobConnectionString => _BlobConnectionString;
  set BlobConnectionString(String _value) {
    _BlobConnectionString = _value;
    prefs.setString('ff_BlobConnectionString', _value);
  }

  String _UrlImagePath = '';
  String get UrlImagePath => _UrlImagePath;
  set UrlImagePath(String _value) {
    _UrlImagePath = _value;
  }

  String _BaseFilePath = 'https://ef24devstorage.blob.core.windows.net';
  String get BaseFilePath => _BaseFilePath;
  set BaseFilePath(String _value) {
    _BaseFilePath = _value;
    prefs.setString('ff_BaseFilePath', _value);
  }

  bool _isAutomaticRegister = false;
  bool get isAutomaticRegister => _isAutomaticRegister;
  set isAutomaticRegister(bool _value) {
    _isAutomaticRegister = _value;
  }

  String _Version = '1.0.63';
  String get Version => _Version;
  set Version(String _value) {
    _Version = _value;
    prefs.setString('ff_Version', _value);
  }

  bool _isEditInformation = false;
  bool get isEditInformation => _isEditInformation;
  set isEditInformation(bool _value) {
    _isEditInformation = _value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  bool _areImagesCheckVisible = false;
  bool get areImagesCheckVisible => _areImagesCheckVisible;
  set areImagesCheckVisible(bool _value) {
    _areImagesCheckVisible = _value;
  }

  bool _areDamagedImagesChecked = false;
  bool get areDamagedImagesChecked => _areDamagedImagesChecked;
  set areDamagedImagesChecked(bool _value) {
    _areDamagedImagesChecked = _value;
  }

  String _numVehicleImages = '';
  String get numVehicleImages => _numVehicleImages;
  set numVehicleImages(String _value) {
    _numVehicleImages = _value;
  }

  String _numDamagedImages = '';
  String get numDamagedImages => _numDamagedImages;
  set numDamagedImages(String _value) {
    _numDamagedImages = _value;
  }

  bool _isRegStep2ShowMore = true;
  bool get isRegStep2ShowMore => _isRegStep2ShowMore;
  set isRegStep2ShowMore(bool _value) {
    _isRegStep2ShowMore = _value;
  }

  String _AccessToken = '';
  String get AccessToken => _AccessToken;
  set AccessToken(String _value) {
    _AccessToken = _value;
    prefs.setString('ff_AccessToken', _value);
  }

  String _RefreshToken = '';
  String get RefreshToken => _RefreshToken;
  set RefreshToken(String _value) {
    _RefreshToken = _value;
    prefs.setString('ff_RefreshToken', _value);
  }

  DateTime? _TokenExpiration =
      DateTime.fromMillisecondsSinceEpoch(1672549200000);
  DateTime? get TokenExpiration => _TokenExpiration;
  set TokenExpiration(DateTime? _value) {
    _TokenExpiration = _value;
    _value != null
        ? prefs.setInt('ff_TokenExpiration', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_TokenExpiration');
  }

  bool _isSubUser = false;
  bool get isSubUser => _isSubUser;
  set isSubUser(bool _value) {
    _isSubUser = _value;
    prefs.setBool('ff_isSubUser', _value);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String _value) {
    _userEmail = _value;
    prefs.setString('ff_userEmail', _value);
  }

  String _companyId = '';
  String get companyId => _companyId;
  set companyId(String _value) {
    _companyId = _value;
    prefs.setString('ff_companyId', _value);
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
    prefs.setString('ff_firstName', _value);
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
    prefs.setString('ff_lastName', _value);
  }

  bool _filterSortFavorite = false;
  bool get filterSortFavorite => _filterSortFavorite;
  set filterSortFavorite(bool _value) {
    _filterSortFavorite = _value;
  }

  bool _filterSortBuyNow = false;
  bool get filterSortBuyNow => _filterSortBuyNow;
  set filterSortBuyNow(bool _value) {
    _filterSortBuyNow = _value;
  }

  String _filterSortType = '';
  String get filterSortType => _filterSortType;
  set filterSortType(String _value) {
    _filterSortType = _value;
  }

  String _filterSortSortBy = '';
  String get filterSortSortBy => _filterSortSortBy;
  set filterSortSortBy(String _value) {
    _filterSortSortBy = _value;
  }

  List<String> _filterSortRegionCode = [];
  List<String> get filterSortRegionCode => _filterSortRegionCode;
  set filterSortRegionCode(List<String> _value) {
    _filterSortRegionCode = _value;
  }

  void addToFilterSortRegionCode(String _value) {
    _filterSortRegionCode.add(_value);
  }

  void removeFromFilterSortRegionCode(String _value) {
    _filterSortRegionCode.remove(_value);
  }

  void removeAtIndexFromFilterSortRegionCode(int _index) {
    _filterSortRegionCode.removeAt(_index);
  }

  dynamic _jsonMenuItemTest = jsonDecode(
      '[{\"title\":\"FOTO0\",\"route\":\"HomePageCopy\",\"imageUrl\":\"https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80\"},{\"title\":\"FOTO1\",\"route\":\"Detail\",\"imageUrl\":\"https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80\"},{\"title\":\"FOTO2\",\"route\":\"Login\",\"imageUrl\":\"https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80\"}]');
  dynamic get jsonMenuItemTest => _jsonMenuItemTest;
  set jsonMenuItemTest(dynamic _value) {
    _jsonMenuItemTest = _value;
  }

  bool _isPrivateRegister = false;
  bool get isPrivateRegister => _isPrivateRegister;
  set isPrivateRegister(bool _value) {
    _isPrivateRegister = _value;
  }

  List<String> _RegisterStep1 = [];
  List<String> get RegisterStep1 => _RegisterStep1;
  set RegisterStep1(List<String> _value) {
    _RegisterStep1 = _value;
  }

  void addToRegisterStep1(String _value) {
    _RegisterStep1.add(_value);
  }

  void removeFromRegisterStep1(String _value) {
    _RegisterStep1.remove(_value);
  }

  void removeAtIndexFromRegisterStep1(int _index) {
    _RegisterStep1.removeAt(_index);
  }

  List<String> _RegisterStep2 = [];
  List<String> get RegisterStep2 => _RegisterStep2;
  set RegisterStep2(List<String> _value) {
    _RegisterStep2 = _value;
  }

  void addToRegisterStep2(String _value) {
    _RegisterStep2.add(_value);
  }

  void removeFromRegisterStep2(String _value) {
    _RegisterStep2.remove(_value);
  }

  void removeAtIndexFromRegisterStep2(int _index) {
    _RegisterStep2.removeAt(_index);
  }

  String _RegisterUsername = '';
  String get RegisterUsername => _RegisterUsername;
  set RegisterUsername(String _value) {
    _RegisterUsername = _value;
  }

  int _countryId = 0;
  int get countryId => _countryId;
  set countryId(int _value) {
    _countryId = _value;
    prefs.setInt('ff_countryId', _value);
  }

  String _searchBrand = '';
  String get searchBrand => _searchBrand;
  set searchBrand(String _value) {
    _searchBrand = _value;
  }

  String _searchModel = '';
  String get searchModel => _searchModel;
  set searchModel(String _value) {
    _searchModel = _value;
  }

  String _searchFuel = '';
  String get searchFuel => _searchFuel;
  set searchFuel(String _value) {
    _searchFuel = _value;
  }

  int _searchMinYear = 0;
  int get searchMinYear => _searchMinYear;
  set searchMinYear(int _value) {
    _searchMinYear = _value;
  }

  int _searchMaxYear = 0;
  int get searchMaxYear => _searchMaxYear;
  set searchMaxYear(int _value) {
    _searchMaxYear = _value;
  }

  int _searchMinPrice = 0;
  int get searchMinPrice => _searchMinPrice;
  set searchMinPrice(int _value) {
    _searchMinPrice = _value;
  }

  int _searchMaxPrice = 0;
  int get searchMaxPrice => _searchMaxPrice;
  set searchMaxPrice(int _value) {
    _searchMaxPrice = _value;
  }

  List<String> _searchPassenger = [];
  List<String> get searchPassenger => _searchPassenger;
  set searchPassenger(List<String> _value) {
    _searchPassenger = _value;
  }

  void addToSearchPassenger(String _value) {
    _searchPassenger.add(_value);
  }

  void removeFromSearchPassenger(String _value) {
    _searchPassenger.remove(_value);
  }

  void removeAtIndexFromSearchPassenger(int _index) {
    _searchPassenger.removeAt(_index);
  }

  List<String> _searchCommercial = [];
  List<String> get searchCommercial => _searchCommercial;
  set searchCommercial(List<String> _value) {
    _searchCommercial = _value;
  }

  void addToSearchCommercial(String _value) {
    _searchCommercial.add(_value);
  }

  void removeFromSearchCommercial(String _value) {
    _searchCommercial.remove(_value);
  }

  void removeAtIndexFromSearchCommercial(int _index) {
    _searchCommercial.removeAt(_index);
  }

  List<String> _searchRegion = [];
  List<String> get searchRegion => _searchRegion;
  set searchRegion(List<String> _value) {
    _searchRegion = _value;
  }

  void addToSearchRegion(String _value) {
    _searchRegion.add(_value);
  }

  void removeFromSearchRegion(String _value) {
    _searchRegion.remove(_value);
  }

  void removeAtIndexFromSearchRegion(int _index) {
    _searchRegion.removeAt(_index);
  }

  bool _isInternetAvailable = true;
  bool get isInternetAvailable => _isInternetAvailable;
  set isInternetAvailable(bool _value) {
    _isInternetAvailable = _value;
  }

  String _filterDescriptionLists = '';
  String get filterDescriptionLists => _filterDescriptionLists;
  set filterDescriptionLists(String _value) {
    _filterDescriptionLists = _value;
  }

  bool _filterSortDescLists = false;
  bool get filterSortDescLists => _filterSortDescLists;
  set filterSortDescLists(bool _value) {
    _filterSortDescLists = _value;
  }

  bool _ShowMenu = false;
  bool get ShowMenu => _ShowMenu;
  set ShowMenu(bool _value) {
    _ShowMenu = _value;
  }

  String _textfieldTest = '';
  String get textfieldTest => _textfieldTest;
  set textfieldTest(String _value) {
    _textfieldTest = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
