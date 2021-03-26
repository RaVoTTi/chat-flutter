import 'package:chat_flutter/pages/chat_page.dart';
import 'package:chat_flutter/pages/loading_page.dart';
import 'package:chat_flutter/pages/login_page.dart';
import 'package:chat_flutter/pages/register_page.dart';
import 'package:chat_flutter/pages/users_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat'    :( _ ) => ChatPage(),
  'loading' :( _ ) => LoadingPage(),
  'login'   :( _ ) => LoginPage(),
  'register':( _ ) => RegisterPage(),
  'users'   :( _ ) => UsersPage(),
};