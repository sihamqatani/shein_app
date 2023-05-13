// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class ConnectivityService extends GetxService {
//   late final Connectivity _connectivity;
//   late final Rx<ConnectivityResult> _connectivityStatus;

//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity = Connectivity();
//     _connectivityStatus = _connectivity.onConnectivityChanged.asRx();
//   }

//   ConnectivityResult get connectivityStatus => _connectivityStatus.value;

//   @override
//   void onClose() {
//     super.onClose();
//     _connectivityStatus.close();
//   }
// }
