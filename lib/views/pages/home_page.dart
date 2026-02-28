import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:love_diaries/views/widgets/container_widget.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController wordssaid = TextEditingController();
  final SpeechToText speechToText = SpeechToText();
  bool islistening = false;
  String wordsspoken = "";

  @override
  void initState() {
    super.initState();
    initspeech();
  }

  void initspeech() async {
    bool isAvailable = await speechToText.initialize(
      onStatus: (status) => debugPrint('status:$status'),
      onError: (errorNotification) => debugPrint('Error:$errorNotification'),
    );
    if (isAvailable) {
      setState(() {});
    } else {
      debugPrint("speech recognition not available");
    }
  }

  void startlistening() async {
    if (!speechToText.isAvailable) {
      debugPrint("speech is not initialized yet");
      return;
    }
    await speechToText.listen(
      onResult: (result) {
        setState(() {
          wordsspoken = result.recognizedWords;
          wordssaid.text = result.recognizedWords;
        });
      },
      partialResults: true,
    );
    setState(() {
      islistening = true;
    });
  }

  void stoplistening() async {
    await speechToText.stop();
    setState(() {
      islistening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: wordssaid,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "Im listening,start speaking",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (speechToText.isListening) {
            stoplistening();
          } else {
            startlistening();
          }
        },
        backgroundColor: islistening ? Colors.red : Colors.blue,

        child: FaIcon(FontAwesomeIcons.microphone, color: (Colors.pink)),
      ),
    );
  }
}
