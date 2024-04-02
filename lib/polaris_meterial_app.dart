import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:polaris_assignment/core/di/locator.dart';
import 'package:polaris_assignment/core/local_storage/hive/hive_config.dart';
import 'package:polaris_assignment/features/dynamic_form/data/models/offline_form_data_model.dart';
import 'package:polaris_assignment/features/dynamic_form/data/repositories/dynamic_form_repository_imp.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/cubit/dynamic_form_cubit.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/pages/dynamic_form_screen.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/widgets/internet_connectivity_wraper.dart';

class PolarisMaterialApp extends StatefulWidget {
  const PolarisMaterialApp({super.key});

  @override
  State<PolarisMaterialApp> createState() => _PolarisMaterialAppState();
}

class _PolarisMaterialAppState extends State<PolarisMaterialApp> {
  bool serviceInitialised = false;
  @override
  void initState() {
    initConfig();
    super.initState();
  }

  Future<void> initConfig() async {
    //initiasing service locator
    serviceLocator();
    await _setupHive();
  }

  Future<void> _setupHive() async {
    await Hive.initFlutter();

    // Register adapter if not already registered
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(OfflineFormDataModelAdapter());
    }

    // Open the box only if it's not already open

    await Hive.openBox<OfflineFormDataModel>(HiveConfig.dynamicFormBox);
    debugPrint('Hive Box Opened: ${HiveConfig.dynamicFormBox}');

    debugPrint('Hive Initialized ⛑');

    setState(() {
      serviceInitialised = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: serviceInitialised
          ? BlocProvider<DynamicFormCubit>(
              lazy: false,
              create: (context) => DynamicFormCubit(
                repository: GetIt.I<DynamicFormRepositoryImplementation>(),
              ),
              child: const InternetConnectivityWrapper(
                child: DynamicFormScreen(),
              ),
            )
          : Container(),
    );
  }
}
