import '../../model/treinos.dart';

abstract class GymInfoState{}

class LoadingGymInfo extends GymInfoState{}

class GymInfoLoaded extends GymInfoState{
  TreinoCollection treinoCollection;

  GymInfoLoaded({required this.treinoCollection});
}
