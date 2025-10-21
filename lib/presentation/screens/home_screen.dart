import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _bodyHomeWidget(),
    );
  }
}

class _bodyHomeWidget extends StatelessWidget {
  const _bodyHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Cubits'),
          subtitle: Text('A lightweight state management solution'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => context.push('/cubit-counter'),
        ),
        ListTile(
          title: Text('BLoC'),
          subtitle: Text('A reactive state management solution'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => context.push('/bloc-counter'),
        ),
        
        ListTile(
          title: Text('Register Screen'),
          subtitle: Text('Navigate to the Register Screen'),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () => context.push('/register'),
        ),

        
      ],
    );
  }
}