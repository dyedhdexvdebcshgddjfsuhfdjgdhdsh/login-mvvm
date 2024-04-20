import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:login_task/colors/appcolors.dart';
import 'package:login_task/models/user_model.dart';
import 'package:login_task/services/auth.dart';
import 'package:login_task/view_model/bloc/cubit.dart';
import 'package:login_task/view_model/bloc/states.dart';
import 'package:login_task/view_model/login_view_model.dart';
import 'package:login_task/views/components_widget/widgets.dart';
import 'package:login_task/views/pages/auth/success_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AppCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<AppCubit>(context);
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthenticationMethod authenticationMethod = AuthenticationMethod();
    return Scaffold(
      backgroundColor:Color(0xffFFFAFA),
      body: BlocBuilder<AppCubit, LoginState>(
        builder:(context,state){
          return BlocConsumer<AppCubit, LoginState>(
            listener: (context, state) {

            },
            builder: (context, state){
              if (state is InitalState) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 20,
                    left: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom * 0.1,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome on Board!',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(20),
                            const Text(
                              'Sign in your account',
                              style: TextStyle(
                                  fontSize: 25,
                                  color:Colors.black
                              ),
                            ),
                            const Gap(60),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 25,
                                  color:Colors.black
                              ),
                            ),
                            const Gap(12),
                            TextFormFieldWidget(
                              prefixIcon: Icon(Icons.email_outlined),
                              text: 'Email',
                              controller:emailController,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Enter Your Email';
                                }
                                return null;
                              },
                            ),
                            const Gap(20),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 25,
                                  color:Colors.black
                              ),
                            ),
                            const Gap(12),
                            TextFormFieldWidget(
                              prefixIcon: Icon(Icons.password_rounded),
                              text: 'Password',
                              obscure: true,
                              controller:passwordController,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off)),
                              validator: (value) {
                              if(value!.isEmpty){
                                return 'Enter Your Password';
                                 }
                              return null;
                              },
                            ),
                            const Gap(20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding:EdgeInsets.symmetric(vertical:12),
                                      backgroundColor:Color(0xff2D1E41),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        UserModel userModel = UserModel(
                                          password:passwordController.text,
                                          userId: cubit.authenticationMethod.auth
                                              .currentUser!.uid,
                                          email:emailController.text,
                                        );
                                        state = SuccessState();
                                        var data = await cubit.getDataLogin(
                                            userModel: userModel);
                                        print('=========================');
                                        print('Success : ${data}');
                                        print('==========================');
                                        await authenticationMethod.signInAuth(
                                            email:emailController.text,
                                            password:
                                            passwordController.text);
                                      } else
                                        return null;
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account ?"),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: TextStyle(
                                        fontSize: 16, color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              // If not in the success state, return an empty container
              else {
            return SuccessScreen();
              }
            },
          );
        },
      ),
    );
  }
}
