import 'package:tutorappalpha/GlobalVariables.dart';
import 'package:tutorappalpha/screen/user.dart';
class UserPreferences{
  static var myUser = User(
    imagePath : 'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 
    firstName: user.firstName ?? 'nome',
    secondName: user.secondName ?? 'cognome',
    email: user.email ?? 'email',
    about :'gianni ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  );
}