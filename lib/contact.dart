import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ติดต่อเรา'),
        backgroundColor: Color.fromRGBO(175, 172, 255, 1),
      ),
      body: Container(
        color: Color.fromRGBO(58, 241, 248, 1), // ตั้งค่าสีฟ้า
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              children: [
                ContactItem(
                  icon: Icons.message,
                  title: 'LINE',
                  detail: '@fableland',
                  onTap: () {
                    // Handle LINE tap
                  },
                ),
                SizedBox(height: 10),
                ContactItem(
                  icon: Icons.phone,
                  title: 'เบอร์โทร',
                  detail: '093-709-5963',
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: '0123456789',
                    );
                    await launchUrl(launchUri);
                  },
                ),
                SizedBox(height: 10),
                ContactItem(
                  icon: Icons.email,
                  title: 'อีเมล์',
                  detail: 'tinz@gmail.com',
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'info@yourdomain.com',
                    );
                    await launchUrl(emailLaunchUri);
                  },
                ),
                SizedBox(height: 10),
                ContactItem(
                  icon: Icons.location_on,
                  title: 'ที่อยู่',
                  detail: 'มหาวิทยาลัยราชมงคลธัญบุรี',
                  onTap: () async {
                    final Uri mapLaunchUri = Uri(
                      scheme: 'https',
                      host: 'www.google.com',
                      path:
                          'maps/search/?api=1&query=14.03667053303405, 100.72796538203634', // แทนที่ด้วย latitude และ longitude ของคุณ
                    );
                    await launchUrl(mapLaunchUri);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;
  final VoidCallback onTap;

  ContactItem({
    required this.icon,
    required this.title,
    required this.detail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          subtitle: Text(detail, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
