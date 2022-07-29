abstract class HomeEvent {}

class Load extends HomeEvent {}

abstract class ToggleEvent {}

class ChooseLeft extends ToggleEvent {}

class ChooseRight extends ToggleEvent {}