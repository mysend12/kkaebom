
import 'package:kkaebom/data/user/model/user_database.dart';
import 'package:kkaebom/data/user/repository/user_repository.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';
import 'package:kkaebom/ui/view/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  UserRepository userRepository = UserRepository(UserDatabase());
  UserUseCase userUseCase = UserUseCase(userRepository);





  HomeViewModel homeViewModel = HomeViewModel(userUseCase);

  return [
    ChangeNotifierProvider(create: (_) => homeViewModel),
  ];
}