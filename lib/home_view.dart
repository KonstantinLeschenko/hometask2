import 'package:flutter/material.dart';
import 'package:hometask2/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<User> users = [
    User('John', 'Agnew', 'Stanford University', 'assets/john_agnew.jpg', true),
    User('Joshua', 'Allison', 'Hooli Inc', 'assets/joshua_allison.jpg', false),
    User('Lauren', 'Davis', 'Google inc', 'assets/lauren_davis.jpg', false),
    User('Sam', 'Barnard', 'UC Berkely', 'assets/sam_barnard.jpg', false),
    User('Megan', 'Blakely', 'Husky energy', 'assets/megan_blakely.jpg', false),
    User('Joel', 'Cannon', 'Hooli Inc', 'assets/joel_cannon.jpg', true),
    User('Jhon', 'Lennon', 'The Beatles', 'assets/jhon_lennon.jpg', true),
    User('Igor', 'Smelyanskiy', 'UkrPochta', 'assets/igor_smelyanskiy.jpg',
        false)
  ];

  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => a.lastName.compareTo(b.lastName));

    return Container(
      color: Colors.grey[100],
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
        color: Colors.grey[100],
          child: Card(
            color: Colors.grey[100],
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.star,
                            color: fav ? Colors.blue : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              fav == false ? true : false;
                              user.isFavorite = fav;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username.toString(),
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            user.company.toString(),
                            style: TextStyle(fontSize: 12.0, color: Colors.grey[500]),
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
