import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gsy_github_app_flutter/common/event/http_error_event.dart';
import 'package:gsy_github_app_flutter/common/event/index.dart';
import 'package:gsy_github_app_flutter/common/localization/default_localizations.dart';
import 'package:gsy_github_app_flutter/common/localization/gsy_localizations_delegate.dart';
import 'package:gsy_github_app_flutter/common/net/code.dart';
import 'package:gsy_github_app_flutter/common/style/gsy_style.dart';
import 'package:gsy_github_app_flutter/common/utils/common_utils.dart';
import 'package:gsy_github_app_flutter/model/User.dart';
import 'package:gsy_github_app_flutter/page/debug/debug_label.dart';
import 'package:gsy_github_app_flutter/page/home/home_page.dart';
import 'package:gsy_github_app_flutter/page/login/login_page.dart';
import 'package:gsy_github_app_flutter/page/photoview_page.dart';
import 'package:gsy_github_app_flutter/page/welcome_page.dart';
import 'package:gsy_github_app_flutter/redux/gsy_state.dart';
import 'package:redux/redux.dart';

import 'common/utils/navigator_utils.dart';

class AppWideGestureDetector extends StatelessWidget {
  final Widget child;
  final Function onTapGesture;
  final Function onLongPressGesture;

  const AppWideGestureDetector({
    Key? key,
    required this.child,
    required this.onTapGesture,
    required this.onLongPressGesture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
    focusNode: FocusNode(),
    child: GestureDetector(
      // Our GestureDetector wraps a Container
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            print('event.scrollDelta.dx: ${event.scrollDelta.dx}');
            print('event.scrollDelta.dy: ${event.scrollDelta.dy}');
            print('event.scrollDelta.distance: ${event.scrollDelta.distance}');
            print('event.scrollDelta.runtimeType: ${event.scrollDelta.runtimeType}');
            print('event.localPosition.dx: ${event.localPosition.dx}');
            print('event.localPosition.dy: ${event.localPosition.dy}');
            print('event.position.dx: ${event.position.dx}');
            print('event.position.dy: ${event.position.dy}');
          }
        },
        child: child,
      ),
      behavior: HitTestBehavior.translucent, // Allow taps to go through to underlying widgets
      // When the child is tapped
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      onTapUp: (details) {
        
        const snackBar = SnackBar(content: Text('Tap Up!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.kind: ${details.kind.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
      onTapDown: (details) {
        
        const snackBar = SnackBar(content: Text('Tap Down!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.kind: ${details.kind.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
      onDoubleTapDown: (details) {
        
        const snackBar = SnackBar(content: Text('Double Tap Down!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.kind: ${details.kind.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
      onForcePressEnd: (details) {
        
        const snackBar = SnackBar(content: Text('Force Press End!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.pressure: ${details.pressure.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
      onForcePressPeak: (details) {
        
        const snackBar = SnackBar(content: Text('Force Press Peak!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.pressure: ${details.pressure.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
      onForcePressStart: (details) {
        
        const snackBar = SnackBar(content: Text('Force Press Start!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.pressure: ${details.pressure.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
      },
        onForcePressUpdate: (details) {

        const snackBar = SnackBar(content: Text('Force Press Start!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.pressure: ${details.pressure.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onHorizontalDragDown: (details) {
          
        const snackBar = SnackBar(content: Text('Horizontal Drag Down!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onHorizontalDragEnd: (details) {
          
        const snackBar = SnackBar(content: Text('Horizontal Drag End!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.primaryVelocity: ${details.primaryVelocity.toString()}');
        print('details.velocity: ${details.velocity.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onHorizontalDragStart: (details) {
          
        const snackBar = SnackBar(content: Text('Horizontal Drag Start!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.kind: ${details.kind.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        print('details.sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onHorizontalDragUpdate: (details) {
          
        const snackBar = SnackBar(content: Text('Horizontal Drag Update!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.delta: ${details.delta.toString()}');
        print('details.primaryDelta: ${details.primaryDelta.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        print('details.sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onVerticalDragDown: (details) {
          
        const snackBar = SnackBar(content: Text('Vertical Drag Down!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onVerticalDragEnd: (details) {
          
        const snackBar = SnackBar(content: Text('Vertical Drag End!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.primaryVelocity: ${details.primaryVelocity.toString()}');
        print('details.velocity: ${details.velocity.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onVerticalDragStart: (details) {
          
        const snackBar = SnackBar(content: Text('Vertical Drag Start!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.kind: ${details.kind.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        print('details.sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onVerticalDragUpdate: (details) {
          
        const snackBar = SnackBar(content: Text('Vertical Drag Update!'));

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        print('details.toString(): ${details.toString()}');
        print('details.globalPosition: ${details.globalPosition.toString()}');
        print('details.delta: ${details.delta.toString()}');
        print('details.primaryDelta: ${details.primaryDelta.toString()}');
        print('details.localPosition: ${details.localPosition.toString()}');
        print('details.runtimeType: ${details.runtimeType.toString()}');
        print('details.sourceTimeStamp: ${details.sourceTimeStamp.toString()}');
        },
        onLongPressDown: (details) {
          
          const snackBar = SnackBar(content: Text('Long Press Down!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.kind: ${details.kind.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onLongPressEnd: (details) {
          
          const snackBar = SnackBar(content: Text('Long Press End!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.velocity: ${details.velocity.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onLongPressMoveUpdate: (details) {
          
          const snackBar = SnackBar(content: Text('Long Press Move Update!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.localOffsetFromOrigin: ${details.localOffsetFromOrigin.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onLongPressStart: (details) {
          
          const snackBar = SnackBar(content: Text('Long Press Start!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryLongPressDown: (details) {
              
            const snackBar = SnackBar(content: Text('Secondary Long Press Down!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.kind: ${details.kind.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryLongPressEnd: (details) {
              
            const snackBar = SnackBar(content: Text('Secondary Long Press End!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.velocity: ${details.velocity.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryLongPressMoveUpdate: (details) {
              
            const snackBar = SnackBar(content: Text('Secondary Long Press Move Update!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.localOffsetFromOrigin: ${details.localOffsetFromOrigin.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryLongPressStart: (details) {
              
            const snackBar = SnackBar(content: Text('Secondary Long Press Start!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryTapDown: (details) {
                
            const snackBar = SnackBar(content: Text('Secondary Tap Down!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.kind: ${details.kind.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onSecondaryTapUp: (details) {
                
            const snackBar = SnackBar(content: Text('Secondary Tap Up!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.kind: ${details.kind.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryLongPressDown: (details) {
          
          const snackBar = SnackBar(content: Text('Tertiary Long Press Down!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.kind: ${details.kind.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryLongPressEnd: (details) {
          
          const snackBar = SnackBar(content: Text('Tertiary Long Press End!'));
    
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print('details.toString(): ${details.toString()}');
          print('details.globalPosition: ${details.globalPosition.toString()}');
          print('details.velocity: ${details.velocity.toString()}');
          print('details.localPosition: ${details.localPosition.toString()}');
          print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryLongPressMoveUpdate: (details) {
            
            const snackBar = SnackBar(content: Text('Tertiary Long Press Move Update!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.localOffsetFromOrigin: ${details.localOffsetFromOrigin.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryLongPressStart: (details) {
            
            const snackBar = SnackBar(content: Text('Tertiary Long Press Start!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryTapDown: (details) {
            
            const snackBar = SnackBar(content: Text('Tertiary Tap Down!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.kind: ${details.kind.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
        onTertiaryTapUp: (details) {
            
            const snackBar = SnackBar(content: Text('Tertiary Tap Up!'));
      
            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            print('details.toString(): ${details.toString()}');
            print('details.globalPosition: ${details.globalPosition.toString()}');
            print('details.kind: ${details.kind.toString()}');
            print('details.localPosition: ${details.localPosition.toString()}');
            print('details.runtimeType: ${details.runtimeType.toString()}');
        },
    ),
    onKey: (event) {
      print('event.character: ${event.character}');
      print('event.logicalKey.keyLabel: ${event.logicalKey.keyLabel}');
      print('event.logicalKey.keyId: ${event.logicalKey.keyId}');
    }
  );
 
  }
}

class FlutterReduxApp extends StatefulWidget {
  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();
}

class _FlutterReduxAppState extends State<FlutterReduxApp>
    with HttpErrorListener {
  /// 创建Store，引用 GSYState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = new Store<GSYState>(
    appReducer,

    ///拦截器
    middleware: middleware,

    ///初始化数据
    initialState: new GSYState(
        userInfo: User.empty(),
        login: false,
        themeData: CommonUtils.getThemeData(GSYColors.primarySwatch),
        locale: Locale('zh', 'CH')),
  );

  ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ]);


  NavigatorObserver navigatorObserver = NavigatorObserver();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      /// 通过 with NavigatorObserver ，在这里可以获取可以往上获取到
      /// MaterialApp 和 StoreProvider 的 context
      /// 还可以获取到 navigator;
      /// 比如在这里增加一个监听，如果 token 失效就退回登陆页。
      navigatorObserver.navigator!.context;
      navigatorObserver.navigator;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 使用 flutter_redux 做全局状态共享
    /// 通过 StoreProvider 应用 store
    return new StoreProvider(
      store: store,

      // New Code START
      // child: StoreBuilder<GSYState>(builder: (context, store) {
      //   ///使用 StoreBuilder 获取 store 中的 theme 、locale
      //   store.state.platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
      //   return AppWideGestureDetector(
      //     child: new MaterialApp(
      //     navigatorKey: navKey,
      //     ///多语言实现代理
      //     localizationsDelegates: [
      //       GlobalMaterialLocalizations.delegate,
      //       GlobalCupertinoLocalizations.delegate,
      //       GlobalWidgetsLocalizations.delegate,
      //       GSYLocalizationsDelegate.delegate,
      //     ],
      //     supportedLocales: [
      //       store.state.locale ?? store.state.platformLocale!
      //     ],
      //     locale: store.state.locale,
      //     theme: store.state.themeData,
      //     navigatorObservers: [navigatorObserver],

      //     ///命名式路由
      //     /// "/" 和 MaterialApp 的 home 参数一个效果
      //     ///⚠️ 这里的 name调用，里面 pageContainer 方法有一个 MediaQuery.of(context).copyWith(textScaleFactor: 1),
      //     ///⚠️ 而这里的 context 用的是 WidgetBuilder 的 context  ～
      //     ///⚠️ 所以 MediaQuery.of(context) 这个 InheritedWidget 就把这个 context “登记”到了 Element 的内部静态 _map 里。
      //     ///⚠️ 所以键盘弹出来的时候，触发了顶层的 MediaQueryData 发生变化，自然就触发了“登记”过的 context 的变化
      //     ///⚠️ 比如 LoginPage 、HomePage ····
      //     ///⚠️ 所以比如你在 搜索页面 键盘弹出时，下面的 HomePage.sName 对应的 WidgetBuilder 会被触发
      //     ///⚠️ 这个是我故意的，如果不需要，可以去掉 pageContainer 或者不要用这里的 context
      //     routes: {
      //       WelcomePage.sName: (context) {
      //         DebugLabel.showDebugLabel(context);
      //         return WelcomePage();
      //       },
      //       HomePage.sName: (context) {
      //         return NavigatorUtils.pageContainer(new HomePage(), context);
      //       },
      //       LoginPage.sName: (context) {
      //         return NavigatorUtils.pageContainer(new LoginPage(), context);
      //       },

      //       ///使用 ModalRoute.of(context).settings.arguments; 获取参数
      //       PhotoViewPage.sName: (context) {
      //         return PhotoViewPage();
      //       },
      //     }),
      //     onTapGesture: () {
      //       // Handle global tap gesture here
      //       print('Global tap detected');
      //     },
      //     onLongPressGesture: () {
      //       // Handle global long press gesture here
      //       print('Global long press detected');
      //     },
      //   );
      // }),
      // New Code END

      // Old Code START
      child: new StoreBuilder<GSYState>(builder: (context, store) {
        ///使用 StoreBuilder 获取 store 中的 theme 、locale
        store.state.platformLocale = WidgetsBinding.instance.platformDispatcher.locale;
        Widget app = new MaterialApp(
          navigatorKey: navKey,
          ///多语言实现代理
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GSYLocalizationsDelegate.delegate,
            ],
            supportedLocales: [
              store.state.locale ?? store.state.platformLocale!
            ],
            locale: store.state.locale,
            theme: store.state.themeData,
            navigatorObservers: [navigatorObserver],

            ///命名式路由
            /// "/" 和 MaterialApp 的 home 参数一个效果
            ///⚠️ 这里的 name调用，里面 pageContainer 方法有一个 MediaQuery.of(context).copyWith(textScaleFactor: 1),
            ///⚠️ 而这里的 context 用的是 WidgetBuilder 的 context  ～
            ///⚠️ 所以 MediaQuery.of(context) 这个 InheritedWidget 就把这个 context “登记”到了 Element 的内部静态 _map 里。
            ///⚠️ 所以键盘弹出来的时候，触发了顶层的 MediaQueryData 发生变化，自然就触发了“登记”过的 context 的变化
            ///⚠️ 比如 LoginPage 、HomePage ····
            ///⚠️ 所以比如你在 搜索页面 键盘弹出时，下面的 HomePage.sName 对应的 WidgetBuilder 会被触发
            ///⚠️ 这个是我故意的，如果不需要，可以去掉 pageContainer 或者不要用这里的 context
            routes: {
              WelcomePage.sName: (context) {
                DebugLabel.showDebugLabel(context);
                return WelcomePage();
              },
              HomePage.sName: (context) {
                return NavigatorUtils.pageContainer(new HomePage(), context);
              },
              LoginPage.sName: (context) {
                return NavigatorUtils.pageContainer(new LoginPage(), context);
              },

              ///使用 ModalRoute.of(context).settings.arguments; 获取参数
              PhotoViewPage.sName: (context) {
                return PhotoViewPage();
              },
            });

        if (store.state.grey) {
          ///mode one
          app = ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
              child: app);
          ///mode tow
          // app = ColorFiltered(
          //     colorFilter: greyscale,
          //     child: app);
        }

        return app;
      }),
      // Old Code END
    );
  }

}

mixin HttpErrorListener on State<FlutterReduxApp> {
  StreamSubscription? stream;

  GlobalKey<NavigatorState> navKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream!.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int? code, message) {
    var context = navKey.currentContext!;
    switch (code) {
      case Code.NETWORK_ERROR:
        showToast(GSYLocalizations.i18n(context)!.network_error);
        break;
      case 401:
        showToast(GSYLocalizations.i18n(context)!.network_error_401);
        break;
      case 403:
        showToast(GSYLocalizations.i18n(context)!.network_error_403);
        break;
      case 404:
        showToast(GSYLocalizations.i18n(context)!.network_error_404);
        break;
      case 422:
        showToast(GSYLocalizations.i18n(context)!.network_error_422);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        showToast(GSYLocalizations.i18n(context)!.network_error_timeout);
        break;
      case Code.GITHUB_API_REFUSED:
      //Github API 异常
        showToast(GSYLocalizations.i18n(context)!.github_refused);
        break;
      default:
        showToast(GSYLocalizations.i18n(context)!.network_error_unknown +
            " " +
            message);
        break;
    }
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }
}

