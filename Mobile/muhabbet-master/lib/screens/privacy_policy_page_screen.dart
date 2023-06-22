import 'package:flutter/material.dart';

import '../utils/theme_data.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
                    Icons.privacy_tip,
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
              'Privacy Policy for muhabbet',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'At muhabbet, accessible from muhabbet, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by muhabbet and how we use it.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in muhabbet. This policy is not applicable to any information collected offline or via channels other than this website.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Consent',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Information we collect',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.',
            ),
            const Text(
              'If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.',
            ),
            const Text(
              'When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'How we use your information',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We use the information we collect in various ways, including to:',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('- Provide, operate, and maintain our website'),
                  Text('- Improve, personalize, and expand our website'),
                  Text('- Understand and analyze how you use our website'),
                  Text(
                      '- Develop new products, services, features, and functionality'),
                  Text(
                      '- Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes'),
                  Text('- Send you emails'),
                  Text('- Find and prevent fraud'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Log Files',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'muhabbet follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files includes internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cookies and Web Beacons',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Like any other website, muhabbet uses "cookies". These cookies are used to store information including visitors\' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users\' experience by customizing our web page content based on visitors\' browser type and/or other information.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Advertising Partners Privacy Policies',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'You may consult this list to find the Privacy Policy for each of the advertising partners of muhabbet.',
            ),
            const Text(
              'Third-party ad servers or ad networks use technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on muhabbet, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.',
            ),
            const Text(
              'Note that muhabbet has no access to or control over these cookies that are used by third-party advertisers.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Third Party Privacy Policies',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'muhabbet\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.',
            ),
            const Text(
              'You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'CCPA Privacy Rights (Do Not Sell My Personal Information)',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Under the CCPA, among other rights, California consumers have the right to:',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '- Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.'),
                  Text(
                      '- Request that a business delete any personal data about the consumer that a business has collected.'),
                  Text(
                      '- Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.'),
                  Text(
                      '- If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'GDPR Data Protection Rights',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '- The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.'),
                  Text(
                      '- The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.'),
                  Text(
                      '- The right to erasure – You have the right to request that we erase your personal data, under certain conditions.'),
                  Text(
                      '- The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.'),
                  Text(
                      '- The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.'),
                  Text(
                      '- The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.'),
                  Text(
                      '- If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Children\'s Information',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.',
            ),
            const Text(
              'muhabbet does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately, and we will do our best efforts to promptly remove such information from our records.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Changes to This Privacy Policy',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.',
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.',
            ),
            const Text(
              'Email: info@muhabbet.com',
            ),
          ],
        ),
      ),
    );
  }
}
