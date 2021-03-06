import 'package:cheap_share/utils/random_string_util.dart';
import 'package:cheap_share/views/data_channel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController _roomIdController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'P2P File Sharing',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _roomIdController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Room Id cannot be empty!!';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintText: 'Enter Room Id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MaterialButton(
                height: 45,
                minWidth: double.infinity,
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final roomId = _roomIdController.text;
                    _roomIdController.text = '';
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DataChannel(
                          roomId: roomId,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Join Room',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            MaterialButton(
              height: 45,
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {
                final roomId = RandomStringUtil.getRandomString(6);
                _roomIdController.text = '';
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DataChannel(
                      roomId: roomId,
                    ),
                  ),
                );
              },
              child: const Text(
                'Create Room',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
