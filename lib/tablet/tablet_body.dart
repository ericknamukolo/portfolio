import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/sections/experience_section.dart';
import 'package:portfolio/desktop/sections/footer_section.dart';
import 'package:portfolio/desktop/widgets/animated_text.dart';
import 'package:portfolio/tablet/sections/t_about_section.dart';
import 'package:portfolio/tablet/sections/t_contact_section.dart';
import 'package:portfolio/tablet/sections/t_home_section.dart';
import 'package:portfolio/tablet/sections/t_projects_and_designs.dart';
import 'package:portfolio/tablet/sections/t_skill_section.dart';
import 'package:portfolio/tablet/widgets/cv_button.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  final contactKey = GlobalKey();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  double homeWidth = 0;
  double experienceWidth = 0;
  double aboutWidth = 0;
  double skillsWidth = 0;
  double projectsWidth = 0;
  double contactWidth = 0;

  Future scrollToItem(var sectionKey) async {
    final context = sectionKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOutBack,
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var currentPositon = _scrollController.position.pixels;
      if (currentPositon >= 0 && currentPositon < 600) {
        setState(() {
          homeWidth = 30;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
          experienceWidth = 0;
        });
      } else if (currentPositon >= 600 && currentPositon < 1400) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 30;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 0;
          experienceWidth = 0;
        });
      } else if (currentPositon >= 1400 && currentPositon < 3300) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 30;
          projectsWidth = 0;
          contactWidth = 0;
          experienceWidth = 0;
        });
      } else if (currentPositon >= 3300 && currentPositon < 4000) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          experienceWidth = 30;
          projectsWidth = 0;
          contactWidth = 0;
        });
      } else if (currentPositon >= 4000 && currentPositon < 5150) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 30;
          contactWidth = 0;
          experienceWidth = 0;
        });
      } else if (currentPositon >= 5150) {
        setState(() {
          homeWidth = 0;
          aboutWidth = 0;
          skillsWidth = 0;
          projectsWidth = 0;
          contactWidth = 30;
          experienceWidth = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: Container(
        width: double.infinity,
        height: 70,
        color: kdarkColor,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        scrollToItem(homeKey);
                      },
                      child: const CircleAvatar(
                        foregroundImage: AssetImage('assets/avatar.png'),
                        backgroundColor: klightDarkColor,
                        radius: 20,
                      ),
                    ),
                  ),
                  const Icon(
                    MdiIcons.chevronLeft,
                    color: kprimaryColor,
                  ),
                  const Text(
                    'Erick Namukolo',
                    style: kTextStyleWhite,
                  ),
                  const Icon(
                    MdiIcons.chevronRight,
                    color: kprimaryColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedTexttt(
                    text: 'Home',
                    click: () {
                      scrollToItem(homeKey);
                    },
                    width: homeWidth,
                  ),
                  AnimatedTexttt(
                    text: 'About',
                    click: () {
                      scrollToItem(aboutKey);
                    },
                    width: aboutWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Skills',
                    click: () {
                      scrollToItem(skillsKey);
                    },
                    width: skillsWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Experience',
                    click: () {
                      scrollToItem(experienceKey);
                    },
                    width: experienceWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Projects',
                    click: () {
                      scrollToItem(projectsKey);
                    },
                    width: projectsWidth,
                  ),
                  AnimatedTexttt(
                    text: 'Contact',
                    click: () {
                      scrollToItem(contactKey);
                    },
                    width: contactWidth,
                  ),
                  const CVButton(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            THomeSection(
              key: homeKey,
              scrollToProjects: () {
                scrollToItem(projectsKey);
              },
            ),
            TAboutSection(key: aboutKey),
            TSkillSection(key: skillsKey),
            ExperienceSection(key: experienceKey, isTabMode: true),
            TProjectsAndDesigns(key: projectsKey),
            TContactSection(key: contactKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
