import 'package:flutter/material.dart';

void main() async {
  runApp(const PopUpPalooza());
}

class PopUpPalooza extends StatelessWidget {
  const PopUpPalooza({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pop-Up Palooza")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                actions: [
                  TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearMaterialBanners();
                      },
                      child: const Text("Dismiss"))
                ],
                content: const Text("Have a nice day"),
              ));
            },
            child: const Text("Show Material Banner"),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (c) => Container(
                        width: double.infinity,
                        height: 300,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('This is Bottom Sheet\n'),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close Bottom Sheet"))
                          ],
                        ),
                      ));
            },
            child: const Text("Show Bottom Sheet"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                        title: const Text("Title Dialog"),
                        content: const Text("Content Of Dialog"),
                        actions: [
                          TextButton(
                              onPressed: () {},
                              child: const Text("Do Some Thing")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Close"))
                        ],
                      ));
            },
            child: const Text("Show Simple Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationName: "Flutter App",
                  applicationIcon: const FlutterLogo());
            },
            child: const Text("Show About Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now());
            },
            child: const Text("Show Date Picker"),
          ),
          ElevatedButton(
            onPressed: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now());
            },
            child: const Text("Show Time Picker"),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("This is Snack Bar")));
            },
            child: const Text("Show Snack Bar"),
          ),
        ],
      )),
    );
  }
}
