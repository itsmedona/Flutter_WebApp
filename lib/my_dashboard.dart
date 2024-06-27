import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_dashboard/config/connection/bloc/connected_bloc.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/providers/drawer_provider.dart';
import 'package:flutter_web_dashboard/providers/scroll_provider.dart';
// import 'package:flutter_web_dashboard/providers/theme/dark_theme_styles.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/theme/app_theme.dart';
import 'package:flutter_web_dashboard/theme/cubit/theme_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    GoRouter? _appRouter;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DrawerProvider()),
            ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            return Sizer(builder: (context, orientation, deviceType) {
              _appRouter ??= appRouter();
              return MaterialApp.router(
                supportedLocales: Lang.delegate.supportedLocales,
                localizationsDelegates: const [
                  Lang.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'flutter_web_Dashboard',
                theme: AppTheme.themeData(state.isDarkThemeOn, context),

                // theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                routeInformationProvider: _appRouter!.routeInformationProvider,
                routeInformationParser: _appRouter!.routeInformationParser,
                routerDelegate: _appRouter!.routerDelegate,
              );
            });
          })),
    );
  }
}
