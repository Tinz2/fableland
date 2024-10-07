import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'contact.dart'; // เพิ่มการนำเข้า ContactUs

class fable01 extends StatefulWidget {
  const fable01({Key? key}) : super(key: key);

  @override
  _FablePageState createState() => _FablePageState();
}

class _FablePageState extends State<fable01> {
  String _storyLanguage = 'th'; // 'th' for Thai, 'en' for English
  String _comment = '';
  String? _selectedAnimal; // For Radio
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;

  final String _storyTh =
      'ในแม่น้ำสายหนึ่งมีจระเข้ชุกชุมถึงสามสายพันธุ์ด้วยกัน จึงทำให้ไม่มีใครกล้ามาจับปลา มีเพียงตาอยู่คนเดียวเท่านั้นที่คลุกคลีกับจระเข้และจับปลามาขายได้ เมื่อชาวบ้านเดือดร้อนที่ใช้แม่น้ำหล่อเลี้ยงชีวิตไม่ได้ เรื่องนี้จึงร้อนถึงหูพระราชา ตาอยู่จึงได้บอกกับพระราชาไปว่า ได้เลี้ยงจระเข้ตัวหนึ่งตั้งแต่ยังเล็กมันจึงไม่ทำร้าย ส่วนจระเข้ตัวอื่นถ้ามันกินอิ่มมันก็จะไม่ทำร้ายคนพระราชาจึงได้มีพระราชโองการสั่งให้เสมียนไปนับจำนวนจระเข้เพื่อที่จะได้นำอาหารไปเลี้ยงพวกมันได้อย่างทั่วถึง เสมียนทั้งสามคนก็พยายามนับจระเข้ที่อยู่ทั้งบนบกและในน้ำ สุดท้ายก็นับจระเข้ได้คนละหนึ่งพันตัว รวมทั้งหมดมีจระเข้ถึงสามพันตัว และพระราชาก็ได้สั่งให้เลี้ยงอาหารจระเข้จนอิ่มและไม่ออกมาทำร้ายชาวบ้าน และหากินในแม่น้ำแห่งนี้ได้อย่างมีความสุข นิทานเรื่องนี้เป็นตำนานหรือนิทานพื้นบ้านของจังหวัดสุพรรณบุรี จนกลายมาเป็นชื่อตำบลจระเข้สามพันจนถึงทุกวันนี้'; // เนื้อหาThai story
  final String _storyEn =
      'In a river, there lived a thriving population of crocodiles from three different species, making it dangerous for anyone to fish there. However, one man named Ta U was brave enough to interact with the crocodiles and catch fish to sell. When the villagers were troubled because they could not rely on the river for their livelihood, news of their plight reached the king.Ta U told the king that he had raised one crocodile from a young age, and it wouldn’t harm him. He explained that the other crocodiles would also refrain from attacking people if they were well-fed. The king then commanded his officials to count the crocodiles so that they could provide enough food for them.Three officials set out to count the crocodiles, both on land and in the water. They each counted one thousand, making a total of three thousand crocodiles. The king ordered that food be provided for the crocodiles until they were full, ensuring they wouldn’t harm the villagers. This allowed the crocodiles to live happily in the river, and the villagers could return to their lives without fear.This tale is a legend from Suphanburi province, which eventually led to the naming of a place called "Sam Phan Crocodile," meaning "three thousand crocodiles," which continues to be used to this day.'; // English story

  final List<Map<String, String>> _quizOptions = [
    //คถาม
    {'value': 'cat', 'label': 'แมว'},
    {'value': 'dog', 'label': 'หมา'},
    {'value': 'mouse', 'label': 'หนู'},
  ];

  void _submitComment() {
    String thankYouMessage = _storyLanguage == 'th'
        ? 'ขอบคุณที่ตั้งใจฟัง'
        : 'Thank you for your attention';
    _showDialog(
        _storyLanguage == 'th' ? 'ขอบคุณ!' : 'Thank You!', thankYouMessage);
  }

  void _showQuiz() {
    //โจทย์
    String question =
        _storyLanguage == 'th' ? 'dog แปลว่าอะไร?' : 'What does dog mean?';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_storyLanguage == 'th' ? 'แบบทดสอบ' : 'Quiz'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(question),
              ..._quizOptions.map((option) => RadioListTile<String>(
                    title: Text(option['label']!),
                    value: option['value']!,
                    groupValue: _selectedAnimal,
                    onChanged: (value) {
                      setState(() {
                        _selectedAnimal = value;
                      });
                    },
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                String message = _selectedAnimal == 'dog'
                    ? (_storyLanguage == 'th' ? "ถูกนะครับ" : "Correct!")
                    : (_storyLanguage == 'th' ? "ผิดนะครับ" : "Incorrect!");
                Navigator.of(context).pop(); // Close dialog
                _showResult(message); // Show result
              },
              child:
                  Text(_storyLanguage == 'th' ? 'ส่งคำตอบ' : 'Submit Answer'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_storyLanguage == 'th' ? 'ยกเลิก' : 'Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showResult(String message) {
    _showDialog(_storyLanguage == 'th' ? 'ผลลัพธ์' : 'Result', message);
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(_storyLanguage == 'th' ? 'ปิด' : 'Close'),
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage() {
    setState(() {
      _storyLanguage = _storyLanguage == 'th' ? 'en' : 'th'; // Toggle language
    });
  }

  Future<void> _playAudio() async {
    await _audioPlayer
        .play(AssetSource('sound/1.mp3')); // เปลี่ยนเป็นชื่อไฟล์เสียงของคุณ
    await _audioPlayer.resume();
    _isPlaying = true;
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    _isPlaying = false;
  }

  Future<void> _rewindAudio() async {
    Duration newPosition = _currentPosition - Duration(seconds: 10);
    await _audioPlayer
        .seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  Future<void> _forwardAudio() async {
    Duration newPosition = _currentPosition + Duration(seconds: 10);
    await _audioPlayer.seek(newPosition);
  }

  Future<void> _restartAudio() async {
    await _audioPlayer.seek(Duration.zero);
    await _audioPlayer.resume();
    _isPlaying = true;
  }

  @override
  Widget build(BuildContext context) {
    String displayedStory = _storyLanguage == 'th' ? _storyTh : _storyEn;
    final buttonLabels = {
      'play': _storyLanguage == 'th' ? 'เล่น' : 'Play',
      'rewind': _storyLanguage == 'th' ? '<<10' : '<<10',
      'pause': _storyLanguage == 'th' ? 'พัก' : 'Pause',
      'forward': _storyLanguage == 'th' ? '10>>' : '10>>',
      'restart': _storyLanguage == 'th' ? 'เริ่มใหม่' : 'Restart',
      'quiz': _storyLanguage == 'th' ? 'แบบทดสอบ' : 'Test vocabulary',
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 172, 255, 1),
        title: Text('นิทานเรื่องจระเข้สามพัน'), // แสดงชื่อเรื่องแทนโลโก้
        actions: [
          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactUs()), // ไปที่หน้า ContactUs
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(179, 228, 255, 100),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset('assets/86.png'), // รูปการ์ตูน
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'นิทานเรื่องจระเข้สามพัน',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),

              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _isPlaying ? _playAudio : _playAudio,
                    child: Text(buttonLabels['play']!),
                  ),
                  ElevatedButton(
                    onPressed: _rewindAudio,
                    child: Text(buttonLabels['rewind']!),
                  ),
                  ElevatedButton(
                    onPressed: _isPlaying ? _pauseAudio : _pauseAudio,
                    child: Text(buttonLabels['pause']!),
                  ),
                  ElevatedButton(
                    onPressed: _forwardAudio,
                    child: Text(buttonLabels['forward']!),
                  ),
                  ElevatedButton(
                    onPressed: _restartAudio,
                    child: Text(buttonLabels['restart']!),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Language change button
              ElevatedButton(
                onPressed: _changeLanguage,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromRGBO(175, 172, 255, 1), // Background color
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('เปลี่ยนภาษา'),
              ),
              SizedBox(height: 20),

              // Story text with white background
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  displayedStory,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              // Comment section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: _storyLanguage == 'th'
                        ? 'ข้อคิดที่ได้จากการอ่าน'
                        : 'Thoughts from reading',
                    contentPadding: EdgeInsets.all(16),
                  ),
                  onChanged: (value) {
                    _comment = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitComment,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromRGBO(175, 172, 255, 1), // Background color
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                    _storyLanguage == 'th' ? 'ส่งข้อคิด' : 'Submit Thoughts'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromRGBO(175, 172, 255, 1), // Background color
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(buttonLabels['quiz']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
