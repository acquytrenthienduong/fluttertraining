import 'package:flutter/material.dart';
import 'package:myapp/route_generator.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      initialRoute: '/',
      home: MyStatefulWidget(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var name = '';
  final nameController = TextEditingController();
  final String url =
      'http://10.0.2.2:8080/api/getUserProfile/606e75b35bd58f09ec8453ce';

  //fetch data from api
  void initData() async {
    final Dio dio = new Dio();
    try {
      var response = await dio.get(url);
      print(response.data['data']['name']);
      name = response.data['data']['name'];
      nameController.text = name;
    } on DioError catch (e) {
      throw e;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initData();
    nameController.text = name;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Page"),
            leading: GestureDetector(),
            actions: <Widget>[],
          ),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SafeArea(
                    child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('?????????-???'),
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: SafeArea(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  tabs: [
                    Tab(
                        child: Text('????????????',
                            style: TextStyle(color: Colors.black))),
                    Tab(
                        child: Text('????????????',
                            style: TextStyle(color: Colors.black))),
                    Tab(
                        child: Text('????????????',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    ListView(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: '??????'),
                          controller: nameController,
                          onTap: () => {
                            Navigator.of(context)
                                .pushNamed('enter-name', arguments: name)
                          },
                        ),
                        TextField(
                            decoration: InputDecoration(labelText: '????????????')),
                        TextField(decoration: InputDecoration(labelText: '??????')),
                        TextField(
                            decoration: InputDecoration(labelText: '????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '?????????????????????')),
                        TextField(decoration: InputDecoration(labelText: '??????')),
                        TextField(
                            decoration: InputDecoration(labelText: '???????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '?????????')),
                        TextField(
                            decoration:
                                InputDecoration(labelText: '???????????? ??? ????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '?????????')),
                        TextField(
                            decoration:
                                InputDecoration(labelText: '???????????????????????? ????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '?????????????????????')),
                        TextField(
                            decoration: InputDecoration(labelText: '?????????????????????')),
                        TextField(decoration: InputDecoration(labelText: '??????')),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(title: Text('January')),
                        ListTile(title: Text('February')),
                        ListTile(title: Text('March')),
                        ListTile(title: Text('April')),
                        ListTile(title: Text('May')),
                        ListTile(title: Text('June')),
                        ListTile(title: Text('July')),
                        ListTile(title: Text('August')),
                        ListTile(title: Text('September')),
                        ListTile(title: Text('October')),
                        ListTile(title: Text('November')),
                        ListTile(title: Text('December')),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        ListTile(title: Text('January')),
                        ListTile(title: Text('February')),
                        ListTile(title: Text('March')),
                        ListTile(title: Text('April')),
                        ListTile(title: Text('May')),
                        ListTile(title: Text('June')),
                        ListTile(title: Text('July')),
                        ListTile(title: Text('August')),
                        ListTile(title: Text('September')),
                        ListTile(title: Text('October')),
                        ListTile(title: Text('November')),
                        ListTile(title: Text('December')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '?????????',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_enhance),
          label: '??????',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video),
          label: '??????',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: '????????????',
          backgroundColor: Colors.yellow,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '???????????????',
          backgroundColor: Colors.yellow,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}

class EnterNamePage extends StatefulWidget {
  final String name;

  const EnterNamePage({Key key, this.name}) : super(key: key);

  @override
  _EnterNamePageState createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  final nameEditController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditController.text = widget.name;
  }

  void onSubmit() async {
    final Dio dio = new Dio();
    try {
      var response =
          await dio.post(url, data: {"name": nameEditController.text});
      print(response);
      // if(response)
      Navigator.of(context).pushNamed('/');
    } on DioError catch (e) {
      throw e;
    }
  }

  final String url =
      'http://10.0.2.2:8080/api/udpateUserProfile/606e75b35bd58f09ec8453ce';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("???????????????"),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.clear, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0, top: 15.0),
              child: GestureDetector(
                onTap: () {
                  onSubmit();
                },
                child: Text(
                  '??????',
                  style: TextStyle(fontSize: 20.0),
                ),
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: '??????'),
            controller: nameEditController,
          ),
          TextField(decoration: InputDecoration(labelText: '??????')),
        ],
      ),
    );
  }
}

class UserInfo {
  final String name;

  UserInfo({
    this.name,
  });

  static UserInfo fromJson(dynamic json) {
    return UserInfo(name: json["name"]);
  }

  Map<String, dynamic> toJson() => {'name': name};
}

class Response {
  final String success;
  final String message;
  final UserInfo data;

  Response({this.success, this.message, this.data});

  static Response fromJson(dynamic json) {
    return Response(
        success: json['success'],
        message: json['message'],
        data: UserInfo.fromJson('data'));
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.toJson(),
      };
}
