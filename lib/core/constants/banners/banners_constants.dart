import 'package:riverpod_annotation/riverpod_annotation.dart';

part "banners_constants.g.dart";

final class Offer {
  final appbartitle = "offers";
  final txtdish = 'Dishes';
  final txtbanner = "Banner title";
  final txtitem = "Item name";
  final txtmayo = "Mayonise";
  final txthalf = "Half";
  final txt = "Text";
}

@riverpod
Offer offersConstants(OffersConstantsRef ref) {
  return Offer();
}
