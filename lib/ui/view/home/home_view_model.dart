import 'package:kkaebom/di/provider_observe.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';

class HomeViewModel extends ProviderObserve {
  HomeViewModel(this.userUseCase);
  final UserUseCase userUseCase;

}