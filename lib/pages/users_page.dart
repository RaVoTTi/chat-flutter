import 'package:chat_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(uid: '1', name: 'Valen', email: 'test1@gmail.com', isConnected: true),
    User(uid: '2', name: 'pipi', email: 'test2@gmail.com', isConnected: true),
    User(
        uid: '3', name: 'carlos', email: 'test3@gmail.com', isConnected: false),
    User(uid: '4', name: 'Agus', email: 'test4@gmail.com', isConnected: true),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: null, child: Icon(Icons.exit_to_app_rounded)),
          title: Container(
            height: 40,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                ),
                SizedBox(width: 10),
                Text(
                  'MI CUENTA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                // child: Icon(Icons.check_circle, color: Color(0xFFeeeeee),)
                child: Icon(
                  Icons.offline_bolt,
                  color: Color(0xFFeeeeee),
                )),
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: WaterDropHeader(),
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1000)); // delay 1000
              // if failed,use refreshFailed()
              _refreshController.refreshCompleted();
            },
            child: _listViewUsers()));
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _UsersListTale(users: users[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: users.length,
    );
  }


}

class _UsersListTale extends StatelessWidget {
  final User users;
  const _UsersListTale({
    Key key,
    @required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.users.name),
      subtitle: Text(
        this.users.email,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.orangeAccent[100],
        child: Text((this.users.name)
            .substring(0, 2)
            .toLowerCase()), // substring corta el string
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: this.users.isConnected ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
