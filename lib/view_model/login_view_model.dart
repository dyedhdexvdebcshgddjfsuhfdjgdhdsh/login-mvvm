
import 'package:login_task/models/user_model.dart';
import 'package:login_task/repository/login_repo.dart';

class LoginViewModel{
  // UserModel? userModel;
  // get getUserID=>userModel?.userId;
  // get getEmail=>userModel?.email;
  // get getPassword=>userModel?.password;
  final LoginRepository loginRepository;
  LoginViewModel({required this.loginRepository});

  Future loginUser({required UserModel userModel})async {
     var dataLogin= await loginRepository.signInAuth(email:userModel.email, password:userModel.password);
  return dataLogin;
    }
}