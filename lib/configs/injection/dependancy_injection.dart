// import 'package:firebase_messaging/firebase_messaging.dart';
// import '/services/locals/local_storage_service.dart';
// import '/data/repositories/auth_repository.dart';
// import '/constants/app_export.dart';
// import '/services/networks/apis/rest_api_service.dart';

// final sl = GetIt.instance;


// Future<void> init() async {
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(),
//   );

//   //... add other more repository here ....

//   sl.registerLazySingleton(() => RestApiServices());

//   // environnements set
//   sl.get<RestApiServices>().setEnvironment(EnvironmentType.local);

//   // local storage (share preference) init
//   sl.registerFactory<LocalStorageServices>(
//     () => LocalStorageServices(),
//   );

//   await sl<LocalStorageServices>().init();

// }
