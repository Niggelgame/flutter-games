
// import 'package:flutter/material.dart';
// import 'package:games/games/uno/models/uno_card.dart';
// import 'dart:math' as math;

// // Cool code, but totally unusable because its too slow.
// /*class UnoCardAssetLoader {
//   late List<List<Image>> cardImages;
//   late Completer<void> completer;

//   UnoCardAssetLoader() {
//     _load();
//   }

//   Future<void> _load() async {
//     completer = Completer<void>();
//     print('Loading card asset...');
//     final asset = await rootBundle.load("assets/uno/deck.png");
//     print('Computing card images...');
//     final result = await compute(_processCardImages,  asset.buffer.asUint8List());
//     cardImages = result;
//     print('Computed card images!');
//     completer.complete();
//   }

//   List<List<Image>> _processCardImages(Uint8List imgbytes) {
//     print('Starting computation in Isolate...');
//     imglib.Image? image = imglib.decodePng(imgbytes);
//     if(image == null) {
//       throw Exception('Failed to decode image');
//     }

//     print('Decoded image in Isolate...');

//     final int xLength = (image.width / 14).round();
//     final int yLength = (image.height / 8).round();

//     final pieceList = <List<imglib.Image>>[];

//     for (int y = 0; y < 14; y++) {
//       final piece = <imglib.Image>[];
//       for (int x = 0; x < 8; x++) {
//         final imglib.Image pieceImage =
//             imglib.copyCrop(image, x * xLength, y * yLength, xLength, yLength);
//         piece.add(pieceImage);
//       }
//       pieceList.add(piece);
//     }
    

//     List<List<Image>> cardImages = <List<Image>>[];

//     print('Starting computation in Isolate...');
//     for (var imgL in pieceList) {
//       List<Image> outputImg = <Image>[];
//       for (var img in imgL) {
//         outputImg.add(Image.memory(Uint8List.fromList(imglib.encodePng(img))));
//       }
//       cardImages.add(outputImg);
//     }

//     print('Finished computation in Isolate!');

//     return cardImages;
//   }
// }*/

// int _getCardColorOffset(UnoCard card) {
//   switch (card.color) {
//     case UnoCardColor.blue:
//       return 3;
//     case UnoCardColor.green:
//       return 2;
//     case UnoCardColor.yellow:
//       return 1;
//     case UnoCardColor.red:
//       return 0;
//   }
// }

// class IntOffset {
//   final int x;
//   final int y;

//   const IntOffset(this.x, this.y);
// }

// IntOffset _getCardOffset(UnoCard? card) {
//   if (card == null) {
//     return const IntOffset(0, 4);
//   }

//   switch (card.type) {
//     // Wild Cards are on the right side of the asset
//     case UnoCardType.wildDrawFour:
//       return const IntOffset(13, 4);
//     case UnoCardType.wild:
//       return const IntOffset(13, 0);
//     case UnoCardType.drawTwo:
//       return IntOffset(12, _getCardColorOffset(card));
//     case UnoCardType.reverse:
//       return IntOffset(11, _getCardColorOffset(card));
//     case UnoCardType.skip:
//       return IntOffset(10, _getCardColorOffset(card));
//     case UnoCardType.nine:
//       return IntOffset(9, _getCardColorOffset(card));
//     case UnoCardType.eight:
//       return IntOffset(8, _getCardColorOffset(card));
//     case UnoCardType.seven:
//       return IntOffset(7, _getCardColorOffset(card));
//     case UnoCardType.six:
//       return IntOffset(6, _getCardColorOffset(card));
//     case UnoCardType.five:
//       return IntOffset(5, _getCardColorOffset(card));
//     case UnoCardType.four:
//       return IntOffset(4, _getCardColorOffset(card));
//     case UnoCardType.three:
//       return IntOffset(3, _getCardColorOffset(card));
//     case UnoCardType.two:
//       return IntOffset(2, _getCardColorOffset(card));
//     case UnoCardType.one:
//       return IntOffset(1, _getCardColorOffset(card));
//     case UnoCardType.zero:
//       return IntOffset(0, _getCardColorOffset(card));
//   }
// }

// final _emptyCardOffset = _getCardOffset(null);

// class CardWidget extends StatefulWidget {
//   final UnoCard? card;

//   const CardWidget({Key? key, this.card})
//       : super(key: key);

//   @override
//   State<CardWidget> createState() => _CardWidgetState();
// }

// class _CardWidgetState extends State<CardWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   UnoCard? displayedCard;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//       value: widget.card == null ? 0 : 1,
//     );

//     final tween = Tween(begin: -math.pi, end: math.pi);

//     _animation =
//         CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo)
//             .drive(tween);
//   }

//   @override
//   void didUpdateWidget(covariant CardWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cardOffset = _getCardOffset(widget.card);
//     return FutureBuilder(
//       future: widget.assetLoader.completer.future,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return AnimatedBuilder(
//             animation: _animation,
//             builder: (BuildContext context, Widget? child) {
//               return Transform(
//                 transform: Matrix4.zero()..rotateY(_animation.value),
//                 child: Container(
//                   color: Colors.red,
//                 ),
//               );
//             },
//             child: widget.assetLoader.cardImages[cardOffset.y][cardOffset.x],
//           );
//         } else {
//           return const Text('Loading assets');
//         }
//       },
//     );
//   }
// }
