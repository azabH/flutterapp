import 'package:best_flutter_ui_templates/news1.dart';
import 'package:flutter/material.dart';

class EventsAndExperiences extends StatelessWidget {
  const EventsAndExperiences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            EventsAndExperiencesItems(
              newnumber:'1',
              title: 'عربيتك في أمان',
              description: 'قناة السويس تصدر برنامج إصدار وثيقة السيارات',
              lessonsCount: '13 Feb, Sunday ',
              imagePath: 'assets/images/news1.png',

            ),
            EventsAndExperiencesItems(
              newnumber:'2',
              title: 'وفر وقتك واشتري رحلتك',
              description: 'دولوقتي تقدر تامن عربيتك وانت في مكانك عن طريق تطبيق قناة السويس',
              lessonsCount: '13 Feb, Sunday',
              imagePath: 'assets/images/news2.jpg',
            ),

          ],
        ),
      ),
    );
  }
}

class EventsAndExperiencesItems extends StatelessWidget {
  const EventsAndExperiencesItems({
    Key? key, required this.newnumber, required this.title, required this.description, required this.lessonsCount, required this.imagePath,
  }) : super(key: key);
  final String newnumber;
  final String title;
  final String description;
  final String lessonsCount;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 20,bottom: 20),
        width: 250,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10
            )],
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all( 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(title,style: Theme.of(context).textTheme.bodyText2,),
                    Text(description,style: Theme.of(context).textTheme.bodyText1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lessonsCount,style: Theme.of(context).textTheme.headline2,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue,width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                          ),
                          onPressed: (){
                            if(newnumber=="1")
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => news1()));
                              }
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => news2()));

                              }

                          },
                            child: const Text('تفاصيل الخبر'),
                        )

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

