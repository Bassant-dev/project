abstract class StatesDark {}
class InitialStatesDark extends StatesDark{}
class ChangeModeState extends StatesDark{}
class ChangeModeStateFail extends StatesDark{
  final String error;

  ChangeModeStateFail(this.error);
}
