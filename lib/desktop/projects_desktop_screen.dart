import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/single_project_card.dart';
import 'package:portfolio/providers/projects.dart';
import 'package:provider/provider.dart';

class ProjectsDesktopScreen extends StatelessWidget {
  const ProjectsDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    final projectsData = Provider.of<Projects>(context).projectsAndDesigns;
    double containerPadding() {
      if (MediaQuery.of(context).size.width >= 1200) {
        return 160;
      } else if (MediaQuery.of(context).size.width >= 1000 &&
          MediaQuery.of(context).size.width < 1200) {
        return 90;
      } else if (MediaQuery.of(context).size.width >= 800 &&
          MediaQuery.of(context).size.width < 1000) {
        return 50;
      }
      return 30;
    }

    return Scaffold(
      backgroundColor: kdarkColor,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width >= 1200 ? 80 : 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Opacity(
              opacity: 0.0,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: klightDarkColor,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: klightDarkColor,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                'Projects & Designs',
                style: kMiniTitleTextStyleWhite,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: containerPadding()),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: ListView.builder(
                itemBuilder: (context, index) => SingleProjectCard(
                  id: projectsData[index].id,
                  name: projectsData[index].name,
                  type: projectsData[index].type,
                  desc: projectsData[index].desc,
                  imgUrl: projectsData[index].imgUrl,
                  dribbbleLink: projectsData[index].dribbbleLink,
                  externalLink: projectsData[index].externalLink,
                  githubLink: projectsData[index].githubLink,
                ),
                itemCount: projectsData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
