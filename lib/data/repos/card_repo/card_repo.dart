import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contest/data/models/card_model/card_model.dart';

class CardRepo {
  final FirebaseFirestore _fireStore;

  CardRepo({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  Future<void> addCard({
    required CardModel cardModel
  }) async {

      var newCard = await _fireStore.collection("cards").add(cardModel.toJson());
      await _fireStore.collection("cards").doc(newCard.id).update({"card_id": newCard.id});

  }

  Future<void> updateCardData({required CardModel cardModel, required String docId}) async {
    try {
      await _fireStore.collection("cards").doc(docId).update(cardModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Stream<List<CardModel>> getUserCards({required String userId}) =>
      _fireStore.collection('cards')
          .where("user_id", isEqualTo: userId)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => CardModel.fromJson(doc.data()))
          .toList(),
      );

  Future<void> deleteCard({
    required String docId,
  }) async {
    try {
      await _fireStore.collection("cards").doc(docId).delete();
    } catch (e) {
      throw Exception();
    }
  }
}