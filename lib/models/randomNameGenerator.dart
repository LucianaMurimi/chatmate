import 'package:english_words/english_words.dart';

String generateRandomName(){
  String randomName =  generateWordPairs().take(1).elementAt(0).toString();
  return randomName;
}