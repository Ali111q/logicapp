import 'package:flutter/material.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:logic_study_app/controller/user_controller.dart';
import 'package:logic_study_app/features/university/ui/pick_university.dart';
import 'package:logic_study_app/features/welcome_screen/ui/welcome_screen.dart';
import 'package:logic_study_app/regestration/ui/regestration_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'bottom_navigation_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
       ChangeNotifierProvider(
      create: (_) => BottomNavigationProvider(),
      ),
      ChangeNotifierProvider(create:(context) => CollageController(),),
      ChangeNotifierProvider<UserController>(create:(context) => UserController(),)
    ],  child: const MyApp(),)
   
     
    
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
      Widget? _build;
       ToastContext toastContext = ToastContext();
  @override
  void initState() {
        toastContext.init(context);

    // TODO: implement initState
      UserController _controller = Provider.of<UserController>(context, listen: false);
      _controller.getUserFromShared().then((value) {
        if (value!=null) {
          
        Provider.of<CollageController>(context, listen: false).setToken(value.token);
        }
         _controller.getUserFromShared().then((value) {

   setState(() {
     
    _build =  OverlaySupport(
      child: MaterialApp(
        title: "logic study",
        debugShowCheckedModeBanner: false,
        home: value!=null? PickUniversity(): WelcomeScreenController(),
        theme: ThemeData(fontFamily: "omnes", useMaterial3: true),
      ),
    );
    });
   });
      });
  }
  @override
  Widget build(BuildContext context) {

     UserController _controller = Provider.of<UserController>(context);
   
    if (_build == null) {
    return  MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator(),),));
    }
    return _build!;
  }
}
