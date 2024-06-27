import 'package:flutter_web_dashboard/my_dashboard.dart';
import 'package:flutter_web_dashboard/screens/carousels_screen/carousels_slider_screen.dart';
import 'package:flutter_web_dashboard/screens/comming_soon_screen/comming_soon_screen.dart';
import 'package:flutter_web_dashboard/screens/chat_screen/chat_screen.dart';
import 'package:flutter_web_dashboard/screens/dailog_screen/dailog_screen.dart';
import 'package:flutter_web_dashboard/screens/dashboard_boxes/dashboardboxes.dart';
import 'package:flutter_web_dashboard/screens/error_404_screen/error_404_screen.dart';
import 'package:flutter_web_dashboard/screens/error_500_sccreen/error_500_screen.dart';
import "package:flutter_web_dashboard/screens/faq's_screen/faq's_screen.dart";
import 'package:flutter_web_dashboard/screens/form%20_screen/form_screen.dart';
import 'package:flutter_web_dashboard/screens/login_screen/login_screen.dart';
import 'package:flutter_web_dashboard/screens/maintenence_screen/maintenence_screen.dart';
import 'package:flutter_web_dashboard/screens/map_screen/map_screen.dart';
import 'package:flutter_web_dashboard/screens/notifications_screen/notification_screen.dart';
import 'package:flutter_web_dashboard/screens/pogreess_bar_screen/pogress_bar_screen.dart';
import 'package:flutter_web_dashboard/screens/product_card_screen/product_card_screen.dart';
import 'package:flutter_web_dashboard/screens/reset_password/reset_password.dart';
import 'package:flutter_web_dashboard/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_web_dashboard/screens/settings/profile_screen.dart';
import 'package:flutter_web_dashboard/screens/tab_screen/tab_screen.dart';
import 'package:flutter_web_dashboard/screens/tooltip_screen/tooltip_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/badges_and_labels_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/cards_tab_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/chart_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/dropdowns_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/form_validation_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/icons_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/list_group_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/navigation_menus_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/regular_tables_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/standard_button_screen.dart';
import 'package:flutter_web_dashboard/screens/ui_components/utilities_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/dashboard_screen/dashboard.dart';

class RouteUri {
  static const String home = '/';
  static const String myDashboard = '/MyDashboard';
  static const String splash = '/splash';
  static const String logout = '/logout';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String register = '/sing_up';
  static const String reset = '/reset_password';
  static const String standardButtonlUi = '/standardButton-ui';
  static const String profile = '/profile';
  static const String dropdowns = '/dropdowns';
  static const String icons = '/icons';
  static const String badgesAndLabels = '/badgesAndLabels';
  static const String cards = '/cards';
  static const String listGroups = '/listGroups';
  static const String navigationMenus = '/navigationMenus';
  static const String utilities = '/utilities';
  static const String validation = '/validation';
  static const String regularTables = '/regularTables';
  static const String chart = '/chart';
  static const String tabs = '/tabs';
  static const String productcard = '/product_card';
  static const String form = '/form';
  static const String dailog = '/dailog';
  static const String pogressbar = '/pogressbar';
  static const String notifications = '/notifications';
  static const String tooltip = '/tooltip';
  static const String carousels = '/carousels';
  static const String map = '/map';
  static const String dashboxes = '/Dashboard_Boxes';
  static const String error404 = '/Error_404';
  static const String error500 = '/Error_500';
  static const String maintanence = '/maintenence';
  static const String commingsoon = '/commimgsoon';
  static const String faqs = '/faqs';
  static const String chatscreen = '/Chat';
}

const List<String> unrestrictedRoutes = [
  RouteUri.tabs,
  RouteUri.login,
  RouteUri.productcard, // Remove this line for actual authentication flow.
  RouteUri.form, // Remove this line for actual authentication flow.
];

const List<String> publicRoutes = [
  // RouteUri.login, // Enable this line for actual authentication flow.
  // RouteUri.register, // Enable this line for actual authentication flow.
];

GoRouter appRouter() {
  return GoRouter(
    initialLocation: RouteUri.dashboard,
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const DashboardScreen(),
    ),
    routes: [
      // GoRoute(
      //   path: RouteUri.splash,
      //   pageBuilder: (context, state) => NoTransitionPage<void>(
      //     key: state.pageKey,
      //     child: const SplashScreen(),
      //   ),
      // ),
      GoRoute(
        path: RouteUri.home,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const DashboardScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.myDashboard,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MyDashboard(),
        ),
      ),
      GoRoute(
        path: RouteUri.tabs,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const TabScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.standardButtonlUi,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const StandardButtonScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.dropdowns,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const DropdownsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.icons,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const IconsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.badgesAndLabels,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const BadgesAndLabelsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.productcard,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const ProductCardScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.cards,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const CardsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.form,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const FormScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.dailog,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const DialogsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.listGroups,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const ListGroupsScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.navigationMenus,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const NavigationMenusScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.pogressbar,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const PogressbarScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.notifications,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const NotificationScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.utilities,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const UtilitiesScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.validation,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const FormValidationScreen(),
        ),
      ),
      GoRoute(
          path: RouteUri.regularTables,
          pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const RegularTablesScreen(),
              )),
      GoRoute(
        path: RouteUri.tooltip,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const ToolTipScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.chart,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const ChartScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.carousels,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const CarouselSliderScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.map,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MapScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.dashboxes,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const DashboardBoxesScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.login,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.register,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
          path: RouteUri.reset,
          pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey,
                child: const ResetPasswordScreen(),
              )),
      GoRoute(
        path: RouteUri.error404,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const Error404Screen(),
        ),
      ),
      GoRoute(
        path: RouteUri.error500,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const Error500Screen(),
        ),
      ),
      GoRoute(
        path: RouteUri.maintanence,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const MaintanenceScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.commingsoon,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const CommingSoonScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.faqs,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: FAQSScreen(),
        ),
      ),
      GoRoute(
        path: RouteUri.profile,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: ProfileSection(),
        ),
      ),
      GoRoute(
        path: RouteUri.chatscreen,
        pageBuilder: (context, state) => NoTransitionPage<void>(
          key: state.pageKey,
          child: const ChatScreen(),
        ),
      ),
    ],
    redirect: (context, state) {
      if (unrestrictedRoutes.contains(state.matchedLocation)) {
        return null;
      } else if (publicRoutes.contains(state.matchedLocation)) {
        RouteUri.home;
        // Is public route.
        // if (userDataProvider.isUserLoggedIn()) {
        //   // User is logged in, redirect to home page.
        //   return RouteUri.home;
        // }
      } else {
        // Not public route.
        // if (!userDataProvider.isUserLoggedIn()) {
        // User is not logged in, redirect to login page.
        // return RouteUri.login;
        // }
        RouteUri.home;
      }

      return null;
    },
  );
}
