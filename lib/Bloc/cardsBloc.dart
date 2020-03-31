import 'dart:async';
import 'dart:math';

import 'package:black_jack/Data/Modol/cardsModel.dart';
import 'package:flutter/material.dart';
import '../Data/Repositories/cardsRepository.dart';

class CardsBloc {
  List<Cards> cardsArray = [];
  List<Cards> deck = [];
  getCardsArray() {
    cardsArray = [
      Cards(value: 1, cardImage: Image.asset("Assets/AC.png")),
      Cards(value: 1, cardImage: Image.asset("Assets/AD.png")),
      Cards(value: 1, cardImage: Image.asset("Assets/AH.png")),
      Cards(value: 1, cardImage: Image.asset("Assets/AS.png")),
      
      Cards(value: 2, cardImage: Image.asset("Assets/2C.png")),
      Cards(value: 2, cardImage: Image.asset("Assets/2D.png")),
      Cards(value: 2, cardImage: Image.asset("Assets/2H.png")),
      Cards(value: 2, cardImage: Image.asset("Assets/2S.png")),
      
      Cards(value: 3, cardImage: Image.asset("Assets/3C.png")),
      Cards(value: 3, cardImage: Image.asset("Assets/3D.png")),
      Cards(value: 3, cardImage: Image.asset("Assets/3H.png")),
      Cards(value: 3, cardImage: Image.asset("Assets/3S.png")),
      
      Cards(value: 4, cardImage: Image.asset("Assets/4C.png")),
      Cards(value: 4, cardImage: Image.asset("Assets/4D.png")),
      Cards(value: 4, cardImage: Image.asset("Assets/4H.png")),
      Cards(value: 4, cardImage: Image.asset("Assets/4S.png")),
      
      Cards(value: 5, cardImage: Image.asset("Assets/5C.png")),
      Cards(value: 5, cardImage: Image.asset("Assets/5D.png")),
      Cards(value: 5, cardImage: Image.asset("Assets/5H.png")),
      Cards(value: 5, cardImage: Image.asset("Assets/5S.png")),
      
      Cards(value: 6, cardImage: Image.asset("Assets/6C.png")),
      Cards(value: 6, cardImage: Image.asset("Assets/6D.png")),
      Cards(value: 6, cardImage: Image.asset("Assets/6H.png")),
      Cards(value: 6, cardImage: Image.asset("Assets/6S.png")),
      
      Cards(value: 7, cardImage: Image.asset("Assets/7C.png")),
      Cards(value: 7, cardImage: Image.asset("Assets/7D.png")),
      Cards(value: 7, cardImage: Image.asset("Assets/7H.png")),
      Cards(value: 7, cardImage: Image.asset("Assets/7S.png")),
      
      Cards(value: 8, cardImage: Image.asset("Assets/8C.png")),
      Cards(value: 8, cardImage: Image.asset("Assets/8D.png")),
      Cards(value: 8, cardImage: Image.asset("Assets/8H.png")),
      Cards(value: 8, cardImage: Image.asset("Assets/8S.png")),
      
      Cards(value: 9, cardImage: Image.asset("Assets/9C.png")),
      Cards(value: 9, cardImage: Image.asset("Assets/9D.png")),
      Cards(value: 9, cardImage: Image.asset("Assets/9H.png")),
      Cards(value: 9, cardImage: Image.asset("Assets/9S.png")),
      
      Cards(value: 10, cardImage: Image.asset("Assets/10C.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/10D.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/10H.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/10S.png")),
      
      Cards(value: 10, cardImage: Image.asset("Assets/KC.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/KD.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/KH.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/KS.png")),
      
      Cards(value: 10, cardImage: Image.asset("Assets/JC.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/JD.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/JH.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/JS.png")),
      
      Cards(value: 10, cardImage: Image.asset("Assets/QC.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/QD.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/QH.png")),
      Cards(value: 10, cardImage: Image.asset("Assets/QS.png")),
      ];
  return cardsArray;
  }
shuffeledCards() {
    var cards = getCardsArray();
  var newPos, tempDeck;
  var random = new Random();
  try {
    for (var i = cards.length-1; i > 0; i--) {
    newPos = random.nextInt(i + 1);
    tempDeck = cards[i];
    cards[i] = cards[newPos];
    cards[newPos] = tempDeck;
  }
  for (var i = 0; i < cards.length; i++) {
    deck.add(cards[i]);
  }
  } catch (e) {
    print("Array is empty : $e");
  }
  return deck;
}








  static CardRepository cardRepository;
  List<Cards> _dealerCards = [];
  List<Cards> deckShuffeledCards;
  List<Cards> _playerCards = [];
  
  int playerScore = 0;
  int dealerScore = 0;

  final _shuffledcardsListStreamController = StreamController<List<Cards>>();

  final _dealersCardsSortoutStreamController = StreamController<List<Cards>>();
  final _playersCardsSortoutStreamController = StreamController<List<Cards>>();
  final _playerScoreController = StreamController<int>();
  final _dealerScoreController = StreamController<int>();

  //getters
  Stream<List<Cards>> get cardsListStream => _shuffledcardsListStreamController.stream;
  StreamSink<List<Cards>> get _cardsListSink => _shuffledcardsListStreamController.sink;
  
  Stream<List<Cards>> get dealersCardsListStream => _dealersCardsSortoutStreamController.stream;
   Stream<List<Cards>> get playersCardsListStream => _playersCardsSortoutStreamController.stream;
  StreamSink<List<Cards>> get _dealersCardsListSink => _dealersCardsSortoutStreamController.sink;
  StreamSink<List<Cards>> get _playersCardsListSink => _playersCardsSortoutStreamController.sink;
  Stream<int> get playScoreStream => _playerScoreController.stream;
  StreamSink<int> get _playScoreSink => _playerScoreController.sink;
  Stream<int> get dealerScoreStream => _dealerScoreController.stream;
  StreamSink<int> get _dealerScoreSink => _dealerScoreController.sink;

  CardsBloc() {
    _shuffledcardsListStreamController.stream.listen(shuffle());
    
    _dealersCardsSortoutStreamController.add(_dealerCards);
    _playersCardsSortoutStreamController.add(_playerCards);
  }
  shuffle() {
    List<Cards> allShuffledCards = shuffeledCards();
    deckShuffeledCards = allShuffledCards;
    for (var card = 0; card <= allShuffledCards.length-1; card++) {
      //print(allShuffledCards[card].value);
    }
  }

  void dispose() {
    _shuffledcardsListStreamController.close();
    _dealersCardsSortoutStreamController.close();
    _playersCardsSortoutStreamController.close();
    _playerScoreController.close();
    _dealerScoreController.close();
  }

  drawFirstCards() {
    var delarsFirstCard = deckShuffeledCards.first;
    _dealerCards.add(delarsFirstCard);
    deckShuffeledCards.remove(delarsFirstCard);
    var playersFirstCard = deckShuffeledCards.first;
    _playerCards.add(playersFirstCard);
    deckShuffeledCards.remove(playersFirstCard);
  }

  startGame() {
    drawFirstCards();
    
  }

  drawNewCard() {
    drawFirstCards();
    print("drawFirstCards clicked and dealersCards length is ${_dealerCards.length} - ${deckShuffeledCards.length}");
  }

  showScore() {
    for (var playerCard in _playerCards) {
      playerBlackJack(playerCard);
    }
    _playScoreSink.add(playerScore);
    for (var dealersCard in _dealerCards) {
      dealerBlackJack(dealersCard);
    }
    _dealerScoreSink.add(dealerScore);
  }

  playerBlackJack(Cards card) {
    var score = card.value;
    if (score == 1 && score+10 <= 21) {
      playerScore += 10;
    } else {
      playerScore += score;
    }
    countScore();
  }

  dealerBlackJack(Cards card) {
    var score = card.value;
    if (score == 1 && score+10 <= 21) {
      dealerScore += 10;
    } else {
      dealerScore += score;
    }
    countScore();
  }

  showHands() {
    try {
      _dealersCardsListSink.add(_dealerCards);
      _playersCardsListSink.add(_playerCards);
    } catch (e) {
      print("Cant set shuffled cards $e");
    }
    print("player card function is fired");
    countScore();
  }

  countScore() {
    if (dealerScore <=21 && dealerScore < playerScore) {
      print("player won");
      return "I Won!";
    } else if (dealerScore == playerScore) {
      print("Match draw");
      return "Match draw!";
    } else {
      print("Dealer won");
      return "Dealer Won!";
    }
  }

}
