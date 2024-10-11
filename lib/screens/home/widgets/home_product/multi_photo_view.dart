import 'package:flutter/cupertino.dart';

class MultiPhotoViewInProudct extends StatelessWidget {
  final List<String> imageList;
  final double imageWidth;
  const MultiPhotoViewInProudct({super.key, required this.imageList, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return _imageCountBuilder();
  }

  Widget _imageCountBuilder() {
    switch (imageList.length) {
      case 2:
        return _buildTwoGrid();
      case 3:
        return _buildThreeGrid();
      default:
        return _buildOneGrid();
    }
  }

  Widget _buildOneGrid() {
    return Container(
      width: imageWidth,
      height: imageWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageList[0]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildThreeGrid() {
    return Row(
      children: [
        Container(
          height: (imageWidth / 1.5) - (10.0 * 2),
          width: (imageWidth / 1.5) - (10.0 * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageList[1]),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                debugPrint('Failed to load image: $exception');
              },
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        // Container(
        //   width: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 10,
        //   height: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 10,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     image: DecorationImage(
        //       image: NetworkImage(imageList[1]),
        //       fit: BoxFit.cover,
        //       onError: (exception, stackTrace) {
        //         debugPrint('Failed to load image: $exception');
        //       },
        //     ),
        //   ),
        // ),
        Flexible(
          child: Column(
            children: [
              Container(
                width: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 10,
                height: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageList[1]),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      debugPrint('Failed to load image: $exception');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                width: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 10,
                height: (((imageWidth / 1.5) - (10.0 * 2)) / 2) - 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageList[1]),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      debugPrint('Failed to load image: $exception');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTwoGrid() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: (imageWidth / 2) - (10.0 * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(imageList[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        Expanded(
          child: Container(
            height: (imageWidth / 2) - (10.0 * 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(imageList[1]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
