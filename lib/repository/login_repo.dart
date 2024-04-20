abstract class LoginRepository {
  LoginRepository();

  Future<void> signInAuth({required String email, required String password});

// Future<UserModel> getUserId(int id);
}
