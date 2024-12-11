import 'package:aflutterapp/models.dart';
import 'package:aflutterapp/perfrences_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLanguaes = <ProgrammingLanguage>{};
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateField();
  }

  void _populateField() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguaes = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Setings',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
            RadioListTile(
              title: const Text('Female'),
              value: Gender.FEMALE,
              groupValue: _selectedGender,
              onChanged: (newValue) => setState(() {
                _selectedGender = newValue!;
              }),
            ),
            RadioListTile(
              title: const Text('Male'),
              value: Gender.MALE,
              groupValue: _selectedGender,
              onChanged: (newValue) => setState(() {
                _selectedGender = newValue!;
              }),
            ),
            RadioListTile(
              title: const Text('Other'),
              value: Gender.OTHER,
              groupValue: _selectedGender,
              onChanged: (newValue) => setState(() {
                _selectedGender = newValue!;
              }),
            ),
            CheckboxListTile(
                title: const Text('Dart'),
                value: _selectedLanguaes.contains(ProgrammingLanguage.DART),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguaes.contains(ProgrammingLanguage.DART)
                        ? _selectedLanguaes.remove(ProgrammingLanguage.DART)
                        : _selectedLanguaes.add(ProgrammingLanguage.DART);
                  });
                }),
            CheckboxListTile(
                title: const Text('JavaScript'),
                value:
                    _selectedLanguaes.contains(ProgrammingLanguage.JAVASCRIPT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguaes.contains(ProgrammingLanguage.JAVASCRIPT)
                        ? _selectedLanguaes
                            .remove(ProgrammingLanguage.JAVASCRIPT)
                        : _selectedLanguaes.add(ProgrammingLanguage.JAVASCRIPT);
                  });
                }),
            CheckboxListTile(
                title: const Text('Kotlin'),
                value: _selectedLanguaes.contains(ProgrammingLanguage.KOTLIN),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguaes.contains(ProgrammingLanguage.KOTLIN)
                        ? _selectedLanguaes.remove(ProgrammingLanguage.KOTLIN)
                        : _selectedLanguaes.add(ProgrammingLanguage.KOTLIN);
                  });
                }),
            CheckboxListTile(
                title: const Text('Swift'),
                value: _selectedLanguaes.contains(ProgrammingLanguage.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguaes.contains(ProgrammingLanguage.SWIFT)
                        ? _selectedLanguaes.remove(ProgrammingLanguage.SWIFT)
                        : _selectedLanguaes.add(ProgrammingLanguage.SWIFT);
                  });
                }),
            SwitchListTile(
              title: const Text('Is Employed'),
              value: _isEmployed,
              onChanged: (newValue) => setState(() {
                _isEmployed = newValue;
              }),
            ),
            TextButton(onPressed: _saveSettings, child: const Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
      username: _usernameController.text,
      gender: _selectedGender,
      programmingLanguages: _selectedLanguaes,
      isEmployed: _isEmployed
    );
    print(newSettings.username);
    _preferencesService.saveSettings(newSettings);
  }
}
