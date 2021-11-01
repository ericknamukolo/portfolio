import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/contact_card.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/input_field.dart';
import 'package:portfolio/widgets/basic_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MContactSection extends StatefulWidget {
  const MContactSection({Key? key}) : super(key: key);

  @override
  State<MContactSection> createState() => _MContactSectionState();
}

class _MContactSectionState extends State<MContactSection> {
  bool _isSending = false;
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    String? name;
    String? email;
    String? message;

    void send() async {
      final _isValid = _form.currentState!.validate();
      if (_isValid) {
        _form.currentState!.save();
        setState(() {
          _isSending = true;
        });
        await FirebaseFirestore.instance.collection('messages').add({
          'sender': name!.trim(),
          'email': email!.trim(),
          'message': message!.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });
        setState(() {
          _isSending = false;
        });
        BotToast.showText(
          duration: const Duration(seconds: 6),
          text:
              'Thank You for contacting me ${name!.trim()} , I will get back to you shortly',
          textStyle: kNormalTextStyleGrey,
        );
        _form.currentState!.reset();
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 1500,
      width: double.infinity,
      color: kdarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: const [
                Text(
                  'Contact',
                  style: kMiniTitleTextStyleWhite,
                ),
                Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 250,
                  indent: 250,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 500,
                decoration: BoxDecoration(
                  color: klightDarkColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 5),
                      color: const Color(0xff000000).withOpacity(.12),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'Contact Me',
                        style: kTitleTextStyle.copyWith(fontSize: 20),
                      ),
                    ),
                    Column(
                      children: const [
                        ContactCard(
                          icon: Icons.location_pin,
                          content: 'Lusaka, Zambia',
                        ),
                        ContactCard(
                          icon: Icons.email,
                          content: 'erickmndev@gmail.com',
                        ),
                        ContactCard(
                          icon: Icons.phone,
                          content: '+260 962 85743',
                        ),
                        ContactCard(
                          icon: MdiIcons.whatsapp,
                          content: '+260 973 520052 / +260 962 85743',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconHover(
                          icon: MdiIcons.linkedin,
                          color: const Color(0xff0A66C2),
                          click: () async {
                            await launch(
                              'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                            );
                          },
                        ),
                        IconHover(
                          icon: MdiIcons.github,
                          color: const Color(0xff171515),
                          click: () async {
                            await launch(
                              'https://github.com/ericknamukolo',
                            );
                          },
                        ),
                        IconHover(
                          icon: MdiIcons.facebook,
                          color: const Color(0xff4267B2),
                          click: () async {
                            await launch(
                              'https://www.facebook.com/ericnamukolo/',
                            );
                          },
                        ),
                        IconHover(
                          icon: MdiIcons.basketball,
                          color: const Color(0xffea4c89),
                          click: () async {
                            await launch(
                              'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get in touch',
                        style: kTitleTextStyle.copyWith(fontSize: 30),
                      ),
                      const Text(
                        'Feel free to get in touch',
                        style: kNormalTextStyleGrey,
                      ),
                      InputField(
                        hint: 'Your name',
                        maxLines: 1,
                        onSaved: (value) {
                          name = value;
                        },
                      ),
                      InputField(
                        hint: 'Your email',
                        maxLines: 1,
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      InputField(
                        hint: 'Type your message',
                        maxLines: 5,
                        onSaved: (value) {
                          message = value;
                        },
                      ),
                      BasicButton(
                        text: 'Send',
                        click: send,
                        isSending: _isSending,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
