
import 'dart:math';

import 'package:black_jack/Data/Modol/cardsModel.dart';
import 'package:flutter/widgets.dart';
import 'package:async/async.dart';

class CardRepository {
  List<Cards> cardsArray;
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
}
