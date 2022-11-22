import 'package:flutter/material.dart';
import 'theme.dart';
import '../models/person.dart';
import '../ui/widgets/info_person_widget.dart';

class PersonInfoScreen extends StatelessWidget {
  final Person person;
  const PersonInfoScreen(this.person, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        leading: const SizedBox(width: 0),
        title: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Row(
            children: [
              IconButton(
          padding: const EdgeInsets.only(top:22.25, bottom: 21.7, left:14, right: 20.75),
          icon: Image.asset('assets/images/Arrow.png',),
          onPressed: () => Navigator.of(context).pop(),
        ),
              Text(
                person.name,
                style: ThemeConfig.txtStyleAppBTit,
              ),
            ],
          ),
        ),
      ),
      body: Hero(
        tag:person.id,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top:16, left: 14,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: ThemeConfig.colorSubTitles,
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name, style: ThemeConfig.txtStyleTitU,),
                        Text(person.username, style: ThemeConfig.txtStyleSubTitU,),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top:16.0),
                  //child: Text(StrConst.strTitListPeople, style: ThemeConfig.txtStyleTitListU,),
                ),
                InfoPersonWidget(title: 'Email',   data: person.email,),
                InfoPersonWidget(title: 'Address', data: person.address),
                InfoPersonWidget(title: 'Phone',   data: person.phone),
                InfoPersonWidget(title: 'Website', data: person.website),
              ],
            ),
          ),
        ),
      ),
    );
  }
}