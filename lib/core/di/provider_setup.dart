import 'package:drift/backends.dart';
import 'package:event_hub/event_hub.dart';
import 'package:kkaebom/data/platform/database_open_connector_impl.dart'
    if (dart.library.io) 'package:kkaebom/data/platform/mobile_database_open_connector.dart'
    if (dart.library.html) 'package:kkaebom/data/platform/web_database_open_connector.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/data/shared_state/model/shared_state_database.dart';
import 'package:kkaebom/data/shared_state/repository/shared_state_repository.dart';
import 'package:kkaebom/data/user/model/user_database.dart';
import 'package:kkaebom/data/user/repository/user_repository.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';

import 'package:kkaebom/ui/shared/shared_state.dart';
import 'package:kkaebom/ui/shared/shared_view_model.dart';
import 'package:kkaebom/ui/view/shelter/shelter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  EventHub eventHub = EventHub();

  QueryExecutor queryExecutor = DatabaseOpenConnectorImpl().openConnection();

  SharedStateDatabase sharedStateDatabase = SharedStateDatabase(queryExecutor);
  SharedStateRepository sharedStateRepository =
      SharedStateRepository(sharedStateDatabase);

  UserDatabase userDatabase = UserDatabase(queryExecutor);
  UserRepository userRepository = UserRepository(userDatabase);
  UserUseCase userUseCase = UserUseCase(userRepository);

  SharedStateEntityData? sharedStateData =
      await sharedStateRepository.findLastData();
  sharedStateData ??= await sharedStateRepository.save(BaseColors.blueGrey);

  SharedState sharedState = SharedState(eventHub, sharedStateData.baseColor);

  ShelterViewModel homeViewModel = ShelterViewModel(
    sharedStateRepository: sharedStateRepository,
    userUseCase: userUseCase,
    sharedState: sharedState,
    eventHub: eventHub,
  );
  SharedViewModel sharedViewModel = SharedViewModel(
    sharedStateRepository: sharedStateRepository,
    sharedState: sharedState,
    eventHub: eventHub,
  );

  return [
    ChangeNotifierProvider(create: (_) => sharedViewModel),
    ChangeNotifierProvider(create: (_) => homeViewModel),
  ];
}
