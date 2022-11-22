import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/get_people.dart';
import '../models/person.dart';
import '../common/strings_masseges.dart';
import 'theme.dart';
import '../ui/person_info_screen.dart';
import '../ui/widgets/loading_widget.dart';
import 'widgets/navigationbar_widget.dart';

class PeopleScreen extends StatefulWidget {
  static String route = 'People';
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<dynamic> resultPeopleList;
  List<Person> peopleList = [];
  bool _isFirstLoading = true;//true to show Loading Indicator on top Page
  int pageIndex = 1;
  late ScrollController _listController;
  
  @override
  void initState() {
    _loadFirstPage();
    _listController = ScrollController();
    super.initState();
  }
  @override
  dispose(){
    _listController.dispose();
    super.dispose();
  }
  
  //Second suggestion solution use provider to listen liste loaded data and be notified 
  _loadFirstPage() async{
    try{
      resultPeopleList = PeopleService.getPeople(pageIndex);
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    setState(()=>_isFirstLoading=false);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Container(
            margin: const EdgeInsets.only(left:14, top:20, bottom: 20),
            height: 16,
            width: 58,
            child: Image.asset( "assets/images/Logo.png")),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom:18, top:18, right: 16),
                height: 24,
                width: 24,
                child: Image.asset("assets/images/Notification.png",),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top:18.78, bottom: 18, right: 22.28),
                height: 19.22,
                width: 18.76,
                child: Image.asset("assets/images/Search.png",),
              ),
            ),
            ],
        ),
        bottomNavigationBar: const NavigationBarWidget(),
        body: _isFirstLoading
         ? const LoadingWidget(true)
         : FutureBuilder(
          future: resultPeopleList,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasError) {
              return Container(
                margin: const EdgeInsets.only(top:16),
                width: double.maxFinite,
                child: const Text(
                  StrConst.strErrorLoading, 
                  textAlign: TextAlign.center,
                  style: ThemeConfig.txtStyleErrorData, 
                ),
              );
            }
            else if(peopleList.isEmpty && snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget(true);
            }
            else if(snapshot.connectionState == ConnectionState.done) {
              if(peopleList.isEmpty) {
                peopleList = List<Person>.from(snapshot.data as List<Person>);
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _listController,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemExtent: 86,
                      itemCount: peopleList.length,
                      itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Container(
                           height: 72,
                           margin: const EdgeInsets.only(left:14.0, right:14, bottom: 14),
                           padding: EdgeInsets.zero,
                            child: Hero(
                              tag: peopleList[index].id,
                              child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(ThemeConfig.cardRadius),
                                  side: const BorderSide(
                                    color: ThemeConfig.colorBorders,
                                    width:1
                                  )
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero, 
                                  horizontalTitleGap: 0,
                                  minVerticalPadding: 0, 
                                  leading: Container(
                                    width: 56,
                                    height: 56,
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                                      border: Border.all(
                                        color:ThemeConfig.colorBorders,
                                        width:1
                                      )),
                                    child:  peopleList[index].pic!=null
                                            ? Image.asset( peopleList[index].pic!)
                                            : const Icon(Icons.person),
                                  ),
                                  title: Container(
                                    height: 43,
                                    margin: const EdgeInsets.only(left:12, top: 14, bottom: 15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 21,
                                          child: Text(
                                            peopleList[index].name, style: ThemeConfig.txtStyleTitListU,),
                                        ),
                                        if (peopleList[index].username.trim().isNotEmpty)
                                        SizedBox(
                                          height: 16,
                                          child: Text(
                                            peopleList[index].username, 
                                            style: ThemeConfig.txtStyleSubTitList,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 60,
                                    height: 30,
                                    margin: const EdgeInsets.only(right:10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                                      border: Border.all(
                                        color:ThemeConfig.colorBorders,
                                        width:1
                                      )
                                    ),
                                    child: TextButton(
                                      child: const Text(StrConst.strBtnView, style: ThemeConfig.txtStyleButton,),
                                      onPressed: (){
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>
                                          PersonInfoScreen(peopleList[index])));
                                     }, 
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
                  ),
                ],
              );
            }
            return const LoadingWidget(true);
          }
        ),
      ),
    );
  }
}