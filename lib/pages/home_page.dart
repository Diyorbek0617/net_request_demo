import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_request_demo/model/post_model.dart';
import 'package:net_request_demo/service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id="home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String getdata="";
  String get_id_data = "";
  String createdata = "";
  String putdata = "";
  String updatedata = "";
  String deletedata = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post(id: 19, name: "test", salary:123, age: 23);
    _apiPostList();
    _apiPostList2(post);
    _apiPostCreate(post);
    _apiPostUpdate(post);
    _apiPostDelete(post);
  }
  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      setState(() {
        getdata=response!;
      }),
    });
  }
  void _apiPostList2(Post post) {
    Network.GET(Network.API_LIST_id+post.id.toString(), Network.paramsEmpty()).then((response) => {
      setState(() {
        get_id_data=response!;
      }),
    });
  }

  void _apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
      setState(() {
        createdata=response!;
      }),

    });
  }

  void _apiPostUpdate(Post post) {
    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
      setState(() {
        updatedata=response!;
      }),
    });
  }

  void _apiPostDelete(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) =>
    {
      setState(() {
        deletedata = response!;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(25),
            children: [
              Text("\'get method\' network request",style: TextStyle(color: Colors.blue),),
              Text(getdata,style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.bold),),
              Text("\'get id method\' network request",style: TextStyle(color: Colors.blue),),
              Text(get_id_data),
              Text("\'create method\' network request",style: TextStyle(color: Colors.blue),),
              Text(createdata),
              Text("\'update method\' network request",style: TextStyle(color: Colors.blue),),
              Text(updatedata),
              Text("\'delete method\' network request",style: TextStyle(color: Colors.blue),),
              Text(deletedata),


            ],
          ),
      ),
    );
  }
}
