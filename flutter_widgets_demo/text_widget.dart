import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextWidgetLearn extends StatelessWidget {
  const TextWidgetLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectsColors(10).ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: ProjectsColors(10).ScaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageNameMethod(),
          TextWidget(
            newText: ProjectTexts().TitleText,
            textColor: Colors.white,
            textSize: 30, textFontWeight: FontWeight.w500,
          ),
          Padding(
            padding: ProjectPaddings().SubtitleTextPadding,
            child: TextWidget(
              newText: ProjectTexts().SubtitleText,
              textColor: Colors.white54,
              textSize: 20, textFontWeight: FontWeight.w200,
            ),
          ),
          sizedBox50(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: ProjectPaddings().ButtonPadding,
              child: const ButtonWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Image ImageNameMethod() => Image.asset("asset/images/icon.png");

  SizedBox sizedBox50() {
    return const SizedBox(
      height: 150,
    );
  }
}

class ProjectsColors extends Color {
  ProjectsColors(super.value);

  final ScaffoldBackgroundColor = const Color.fromARGB(221, 37, 37, 37);
}

class ProjectPaddings {
  final SubtitleTextPadding =
      const EdgeInsets.only(left: 30, right: 30, top: 10);
  final ButtonPadding = const EdgeInsets.only(left: 8.0, right: 8.0);
}

class ProjectTexts {
  final String TitleText = "Best Al Chatbot";
  final String SubtitleText =
      "A place that provides with the world's top stocks that you can buy and trade";
  final ButtonText = "Next";
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: TextWidget(
        newText: ProjectTexts().ButtonText,
        textColor: Colors.black,
        textSize: 25, textFontWeight: FontWeight.w200,
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.newText,
    required this.textColor,
    required this.textSize, 
    required this.textFontWeight,
  });
  final String newText;
  final Color textColor;
  final double textSize;
  final FontWeight textFontWeight;



  @override
  Widget build(BuildContext context) {
    return Text(
      newText,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor, 
        fontSize: textSize,
        wordSpacing: 1,
       // decoration: TextDecoration.underline,
        fontWeight: textFontWeight,
        ),
    );
  }
}
