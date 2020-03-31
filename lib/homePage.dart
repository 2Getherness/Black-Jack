import 'package:flutter/material.dart';
import 'Data/Modol/cardsModel.dart';
import 'Bloc/cardsBloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CardsBloc _cardsBloc = CardsBloc();
  int dealeScore = 0;
  int myScore = 0;

  bool hidePlayButton = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cardsBloc.dispose();
    super.dispose();
  }

  hideOrShowButtons() {
    setState(() {
      if (hidePlayButton == true) {
        hidePlayButton = false;
      } else {
        hidePlayButton = true;
      }
    });
    return hidePlayButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Material(
          color: Colors.black54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _scoreRow(),
              _cardsDisplay(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _floatingActionButtons());
  }

  Widget _scoreRow() {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              //color: Colors.cyan,
              child: Row(
                children: <Widget>[
                  Text(
                    "My Score ",
                    style: TextStyle(color: Colors.white),
                  ),
                  StreamBuilder<int>(
                    stream: _cardsBloc.dealerScoreStream,
                    //initialData: initialData ,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.data == null) {
                        return Text("0",
                            style: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold));
                      } else {
                        //print(snapshot.data);
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  ),
                  Icon(
                    Icons.fiber_new,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Dealers Score ",
                    style: TextStyle(color: Colors.white),
                  ),
                  StreamBuilder<int>(
                    stream: _cardsBloc.playScoreStream,
                    //initialData: initialData ,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.data == null) {
                        return Text(
                          "0",
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        );
                      } else {
                        //print(snapshot.data);
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.thumb_up,
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardsDisplay() {
    return Column(children: <Widget>[
      Container(
        child: StreamBuilder<List<Cards>>(
          stream: _cardsBloc.dealersCardsListStream,
          //initialData: initialData ,
          builder: (BuildContext context, AsyncSnapshot<List<Cards>> snapshot) {
            if (snapshot.data == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.games),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext _context, int i) {
                        //return _cardsToShow(i);
                        return Container(
                          height: 150,
                          child: snapshot.data[i].cardImage,
                        );
                      },
                    ),
                  ),
                ],
              ));
            }
          },
        ),
      ),
      Container(
        child: StreamBuilder<List<Cards>>(
          stream: _cardsBloc.playersCardsListStream,
          //initialData: initialData ,
          builder: (BuildContext context, AsyncSnapshot<List<Cards>> snapshot) {
            if (snapshot.data == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.games),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext _context, int i) {
                        //return _cardsToShow(i);
                        return Container(
                          height: 150,
                          child: snapshot.data[i].cardImage,
                        );
                      },
                    ),
                  ),
                ],
              ));
            }
          },
        ),
      )
    ]);
  }

  Widget _floatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: hidePlayButton
              ? FloatingActionButton(
                  onPressed: () {
                    _cardsBloc.drawFirstCards();
                    _cardsBloc.showScore();
                    hideOrShowButtons();
                  },
                  child: Icon(Icons.play_arrow),
                )
              : null,
        ),
        Container(
            margin: EdgeInsets.only(bottom: 40),
            child: !hidePlayButton
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        _cardsBloc.drawNewCard();
                        _cardsBloc.showScore();
                        //hideOrShowButtons();
                      },
                      child: Icon(Icons.play_circle_filled),
                    ),
                  )
                : null),
        Container(
          margin: EdgeInsets.only(
            bottom: 40,
          ),
          child: !hidePlayButton
              ? Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _cardsBloc.showHands();
                      //_cardsBloc.showScore();
                      hideOrShowButtons();
                    },
                    child: Icon(Icons.score),
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
