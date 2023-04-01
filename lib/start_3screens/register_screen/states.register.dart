abstract class SocialStates {}
class SocialRegisterInitialState extends SocialStates {}
class SocialRegisterChangePasswordVisibilityState extends SocialStates {}
class SocialRegisterLoadingState extends SocialStates {}

class SocialRegisterSuccessState extends SocialStates
{

}
class SocialRegisterErrorState extends SocialStates
{
  final String error;

  SocialRegisterErrorState(this.error);
}


class SocialCreateUserSuccessState extends SocialStates
{

}

class SocialCreateUserErrorState extends SocialStates
{
  final String error;

  SocialCreateUserErrorState(this.error);
}
class SocialGetUserSuccessStates extends SocialStates{ }
class SocialGetUserLoadingStates extends SocialStates{ }
class SocialGetUserErrorStates extends SocialStates{}

class InitShopState extends SocialStates{}

class ChangeBottomNavState extends SocialStates{}
class FavoritesInitialState extends SocialStates{}
class FavoritesSuccessfully extends SocialStates{}
class RemovedSuccessfully extends SocialStates{}
class SocialLoginInitialState extends SocialStates{}
class SocialLoginChangePasswordVisibilityState extends SocialStates{}
class SocialLoginLoadingState extends SocialStates{

}

class SocialLoginSuccessState extends SocialStates
{
  final String uid;

  SocialLoginSuccessState(this.uid);

}

class SocialLoginErrorState extends SocialStates
{
  final String error;

  SocialLoginErrorState(this.error);
}



