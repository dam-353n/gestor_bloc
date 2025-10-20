
import 'package:gestor_bloc/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(path: '/cubit-counter', builder: (context, state) {
      return const CubitCounterScreen();
    }),
    GoRoute(path: '/bloc-counter', builder: (context, state) {
      return const BlocCounterScreen();
    }),
  ],
);