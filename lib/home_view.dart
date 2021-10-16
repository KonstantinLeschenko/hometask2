import 'package:flutter/material.dart';
import 'package:hometask2/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {

  List<User> users = [
  User('John', 'Agnew', 'Stanford University', 'assets/default_user_photo.png', true),
  User('Joshua', 'Allison', 'Hooli Inc', 'assets/default_user_photo.png', false),
  User('Lauren', 'Davis', 'Google inc', 'assets/default_user_photo.png', false),
  User('Sam', 'Barnard', 'UC Berkely', 'assets/default_user_photo.png', false),
  User('Megan', 'Blakely', 'Husky energy', 'assets/default_user_photo.png', false),
  User('Joel', 'Cannon', 'Hooli Inc', 'assets/default_user_photo.png', true)

  ];


  @override
  Widget build(BuildContext context) {


    users.sort((a, b) => a.lastName.compareTo(b.lastName));

    return Container(
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) =>
              buildUserCard(context, index)),
    );
  }

  buildUserCard(BuildContext context, int index) {
    final user = users[index];
    final username = '${user.firstName}  ${user.lastName}';
    bool fav = user.isFavorite;
   
    return Container(
      color: Colors.grey[400],
      child: Card(
        color: Colors.grey[100],
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.star,
                        color: fav ? Colors.blue : Colors.transparent,),
                    onPressed: () {
                      setState(() {
                        fav == false ? true: false;
                        user.isFavorite = fav;
                      });
                    },
                   )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(user.photoURL.toString()),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username.toString(),
                    style: const TextStyle(fontSize: 30.0),
                  ),
                  Text(
                    user.company.toString(),
                    style: const TextStyle(fontSize: 12.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
