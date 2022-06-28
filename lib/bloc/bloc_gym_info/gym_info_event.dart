abstract class GymInfoEvent{}

class GetTreinos extends GymInfoEvent{}
class InsertTreino extends GymInfoEvent{
  String nomeTreino;

  InsertTreino({required this.nomeTreino});
}

class SelectedTreino extends GymInfoEvent{
  int position;

  SelectedTreino({required this.position});
}
class UpdateTreino extends GymInfoEvent{}