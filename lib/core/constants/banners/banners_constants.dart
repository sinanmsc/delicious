import 'package:riverpod_annotation/riverpod_annotation.dart';

part "banners_constants.g.dart";

final class Offer {
  final appbartitle = "offers";
  final txtdish = 'Dishes';
  final txtbanner = "Banner title";
}

@riverpod
Offer offersConstants(OffersConstantsRef ref) {
  return Offer();
}
