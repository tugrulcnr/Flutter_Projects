import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerWidgetLearn extends StatelessWidget {
  const ContainerWidgetLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
       /* leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        */
        actions: [Icon(Icons.arrow_forward)],
        title: const Text("My Collections"),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            
              context: context,
              builder: (context) => Container(
                    height: 500,
                    child: Container(
                      child: OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Lütfen buraya tıklayınız."))),
                  )
                  
                  );
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(),
      body: Column(children: const [
        ProjectContainerWidget(
          imageURL: "asset/images/image1.png",
          subTitleString: '3.4 ETH',
          titleString: "Abstracr Art",
        ),
        ProjectContainerWidget(
          imageURL: "asset/images/image2.png",
          subTitleString: '3.4 ETH',
          titleString: 'Abstracr Shape',
        ),
      ]),
    );
  }
}

class ProjectContainerWidget extends StatelessWidget {
  const ProjectContainerWidget({
    super.key,
    required this.imageURL,
    required this.titleString,
    required this.subTitleString,
  });
  final String imageURL;
  final String titleString;
  final String subTitleString;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        decoration: ProjectDecoration(),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ImageNameMethod(imageURL)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    myTextWidget(
                      myText: titleString,
                      mySize: 22,
                      myFont: FontWeight.bold,
                    ),
                    Spacer(),
                    myTextWidget(
                      myText: subTitleString,
                      mySize: 12,
                      myFont: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}

class ProjectDecoration extends BoxDecoration {
  ProjectDecoration()
      : super(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 69, 69, 69),
            border: Border.all(
                width: 1, color: Color.fromARGB(255, 135, 135, 135)));
}

class myTextWidget extends StatelessWidget {
  const myTextWidget({
    super.key,
    required this.myText,
    required this.mySize,
    required this.myFont,
  });

  final String myText;
  final double mySize;
  final FontWeight myFont;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style:
          TextStyle(color: Colors.white, fontSize: mySize, fontWeight: myFont),
    );
  }
}

Image ImageNameMethod(String str) => Image.asset(str);
