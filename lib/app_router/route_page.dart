import 'package:go_router/go_router.dart';
import 'package:gudang/home.dart';
import 'package:gudang/screens/assets_screen.dart';
import 'package:gudang/screens/login_page.dart';
import 'package:gudang/screens/maintenance_screen.dart';
import 'package:gudang/screens/manufactur_screen.dart';
import 'package:gudang/screens/mechanic_screen.dart';
import 'package:gudang/screens/model_screen.dart';
import '../screens/add_asset_screen.dart';
import '../screens/add_maintenance_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/location_screen.dart';
import '../screens/supplier_screen.dart';
import '../state_manager/app_state_manager.dart';

class RoutePage {
  final AppStateManager? appStateManager;

  RoutePage(this.appStateManager);

  late final router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: appStateManager,
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', name: 'home', builder: (context, state) => Home()),
        GoRoute(
          path: '/addAsset',
          name: 'addAsset',
          builder: (context, state) => const AddAssetScreen(),
        ),
        GoRoute(
            path: '/addMaintenance',
            name: 'addMaintenance',
            builder: (context, state) => const AddMaintenanceScreen()),
        GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => const LoginPage()),
        GoRoute(
            path: '/aset',
            name: 'aset',
            builder: (context, state) => const AssetsScreen()),
        GoRoute(
            path: '/model',
            name: 'model',
            builder: (context, state) => const ModelScreen()),
        GoRoute(
            path: '/maintenance',
            name: 'maintenance',
            builder: (context, state) => const MaintenanceScreen()),
        GoRoute(
            path: '/manufacture',
            name: 'manufacture',
            builder: (context, state) => const ManufacturerScreen()),
        GoRoute(
            path: '/mechanic',
            name: 'mechanic',
            builder: (context, state) => const MechanicScreen()),
        GoRoute(path: '/supplier', name: 'supplier', builder: (context, state) => const SupplierScreen()),
        GoRoute(path: '/categories', name: 'categories', builder: (context, state) => const CategoriesScreen()),
        GoRoute(path: '/location', name: 'location', builder: (context, state) => const LocationScreen()),

      ],
      redirect: (context, state) {
        if (state.location == '/addAsset' ||
            state.location == '/addMaintenance') {
          if (appStateManager!.isLoggedIn == false) {
            return '/login';
          }
        }
      });
}
