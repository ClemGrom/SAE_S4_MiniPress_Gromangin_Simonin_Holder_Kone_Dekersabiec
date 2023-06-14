import 'package:flutter/material.dart';

class UserTaskPage extends StatefulWidget {
  const UserTaskPage({Key? key}) : super(key: key);

  @override
  _UserTaskPageState createState() => _UserTaskPageState();
}

class _UserTaskPageState extends State<UserTaskPage> {
  bool _isLoggedIn = false;
  String _username = '';

  void _login(String username) {
    setState(() {
      _isLoggedIn = true;
      _username = username;
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _username = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Task'),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logged in as: $_username',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Text('Logout'),
                  ),
                ],
              )
            : LoginForm(onLogin: _login),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final Function(String) onLogin;

  const LoginForm({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final username = _usernameController.text.trim();
              if (username.isNotEmpty) {
                widget.onLogin(username);
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
