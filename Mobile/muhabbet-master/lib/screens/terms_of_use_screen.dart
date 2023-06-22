import 'package:flutter/material.dart';

import '../utils/theme_data.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muhabbet Terms of Use'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 30,
                child: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.description,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Muhabbet Terms of Use',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Version 1.0',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The muhabbet website located at muhabbet.com is a copyrighted work belonging to muhabbet. '
              'Certain features of the Site may be subject to additional guidelines, terms, or rules, which will be '
              'posted on the Site in connection with such features.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'All such additional terms, guidelines, and rules are incorporated by reference into these Terms.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'These Terms of Use described the legally binding terms and conditions that oversee your use of the Site. '
              'BY LOGGING INTO THE SITE, YOU ARE BEING COMPLIANT THAT THESE TERMS and you represent that you have the '
              'authority and capacity to enter into these Terms. YOU SHOULD BE AT LEAST 18 YEARS OF AGE TO ACCESS THE SITE. '
              'IF YOU DISAGREE WITH ALL OF THE PROVISION OF THESE TERMS, DO NOT LOG INTO AND/OR USE THE SITE.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'These terms require the use of arbitration Section 10.2 on an individual basis to resolve disputes and also '
              'limit the remedies available to you in the event of a dispute. These Terms of Use were created with the help of '
              'the Terms Of Use Generator.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Access to the Site',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Subject to these Terms. Company grants you a non-transferable, non-exclusive, revocable, limited license '
              'to access the Site solely for your own personal, noncommercial use.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Certain Restrictions. The rights approved to you in these Terms are subject to the following restrictions: '
              '(a) you shall not sell, rent, lease, transfer, assign, distribute, host, or otherwise commercially exploit '
              'the Site; (b) you shall not change, make derivative works of, disassemble, reverse compile or reverse engineer '
              'any part of the Site; (c) you shall not access the Site in order to build a similar or competitive website; and '
              '(d) except as expressly stated herein, no part of the Site may be copied, reproduced, distributed, republished, '
              'downloaded, displayed, posted or transmitted in any form or by any means unless otherwise indicated, any future '
              'release, update, or other addition to functionality of the Site shall be subject to these Terms. '
              'All copyright and other proprietary notices on the Site must be retained on all copies thereof.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Company reserves the right to change, suspend, or cease the Site with or without notice to you. '
              'You approved that Company will not be held liable to you or any third-party for any change, '
              'suspension, or cessation of the Site or any part of it.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'No Support or Maintenance. You agree that Company will have no obligation to provide you with any support '
              'in connection with the Site.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Excluding any User Content that you may provide, you are aware that all the intellectual property rights, '
              'including copyrights, patents, trademarks, and trade secrets, in the Site and its content are owned by '
              'Company or Company\'s suppliers. Note that these Terms and access to the Site do not give you any rights, '
              'title or interest in or to any intellectual property rights, except for the limited access rights expressed '
              'in Section 2.1. Company and its suppliers reserve all rights not granted in these Terms.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'User Content',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'User Content. "User Content" means any and all information and content that a user submits to the Site. '
              'You are exclusively responsible for your User Content. You bear all risks associated with use of your User '
              'Content. You hereby certify that your User Content does not violate our Acceptable Use Policy. You may not '
              'represent or imply to others that your User Content is in any way provided, sponsored or endorsed by Company. '
              'Because you alone are responsible for your User Content, you may expose yourself to liability. '
              'Company is not obliged to backup any User Content that you post; also, your User Content may be deleted at '
              'any time without prior notice to you. You are solely responsible for making your own backup copies of your '
              'User Content if you desire.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'You hereby grant to Company an irreversible, nonexclusive, royalty-free and fully paid, worldwide license to '
              'reproduce, distribute, publicly display and perform, prepare derivative works of, incorporate into other works, '
              'and otherwise use and exploit your User Content, and to grant sublicenses of the foregoing rights, solely for '
              'the purposes of including your User Content in the Site. You hereby irreversibly waive any claims and assertions '
              'of moral rights or attribution with respect to your User Content.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Acceptable Use Policy',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Prohibited Activities. You may not access or use the Site for any purpose other than that for which '
              'Company makes it available. The Site may not be used in connection with any commercial endeavors except '
              'those that are specifically endorsed or approved by Company. As a user of the Site, you agree not to:',
            ),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '- Systematically retrieve data or other content from the Site to create or compile, '
                      'directly or indirectly, a collection, compilation, database, or directory without written permission '
                      'from Company.'),
                  Text(
                      '- Make any unauthorized use of the Site, including collecting usernames and/or email addresses of '
                      'users by electronic or other means for the purpose of sending unsolicited email, or creating user '
                      'accounts by automated means or under false pretenses.'),
                  Text(
                      '- Use a buying agent or purchasing agent to make purchases on the Site.'),
                  Text(
                      '- Use the Site to advertise or offer to sell goods and services.'),
                  Text(
                      '- Circumvent, disable, or otherwise interfere with security-related features of the Site, including '
                      'features that prevent or restrict the use or copying of any content or enforce limitations on the '
                      'use of the Site and/or the content therein.'),
                  Text(
                      '- Engage in unauthorized framing of or linking to the Site.'),
                  Text(
                      '- Trick, defraud, or mislead Company and other users, especially in any attempt to learn sensitive '
                      'account information such as user passwords.'),
                  Text(
                      '- Make improper use of Company\'s support services or submit false reports of abuse or misconduct.'),
                  Text(
                      '- Engage in any automated use of the system, such as using scripts to send comments or messages, '
                      'or using any data mining, robots, or similar data gathering and extraction tools.'),
                  Text(
                      '- Interfere with, disrupt, or create an undue burden on the Site or the networks or services connected '
                      'to the Site.'),
                  Text(
                      '- Attempt to impersonate another user or person or use the username of another user.'),
                  Text('- Sell or otherwise transfer your profile.'),
                  Text(
                      '- Use any information obtained from the Site in order to harass, abuse, or harm another person.'),
                  Text(
                      '- Use the Site as part of any effort to compete with Company or otherwise use the Site and/or the '
                      'Content for any revenue-generating endeavor or commercial enterprise.'),
                  Text(
                      '- Decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way '
                      'making up a part of the Site.'),
                  Text(
                      '- Attempt to bypass any measures of the Site designed to prevent or restrict access to the Site, '
                      'or any portion of the Site.'),
                  Text(
                      '- Harass, annoy, intimidate, or threaten any of Company\'s employees or agents engaged in providing '
                      'any portion of the Site to you.'),
                  Text(
                      '- Delete the copyright or other proprietary rights notice from any Content.'),
                  Text(
                      '- Copy or adapt the Site\'s software, including but not limited to Flash, PHP, HTML, JavaScript, '
                      'or other code.'),
                  Text(
                      '- Upload or transmit (or attempt to upload or transmit) viruses, Trojan horses, or other '
                      'material that interferes with any party\'s uninterrupted use and enjoyment of the Site or '
                      'modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, '
                      'or maintenance of the Site.'),
                  Text(
                      '- Upload or transmit (or attempt to upload or transmit) any material that acts as a passive or '
                      'active information collection or transmission mechanism, including without limitation, clear graphics '
                      'interchange formats ("gifs"), 1×1 pixels, web bugs, cookies, or other similar devices '
                      '(sometimes referred to as "spyware" or "passive collection mechanisms" or "pcms").'),
                  Text(
                      '- Except as may be the result of standard search engine or Internet browser usage, use, launch, '
                      'develop, or distribute any automated system, including without limitation, any spider, robot, cheat '
                      'utility, scraper, or offline reader that accesses the Site, or using or launching any unauthorized '
                      'script or other software.'),
                  Text(
                      '- Disparage, tarnish, or otherwise harm, in Company\'s opinion, Company and/or the Site.'),
                  Text(
                      '- Use the Site in a manner inconsistent with any applicable laws or regulations.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
