import 'package:flutter/material.dart';


class RecommendedItems extends StatelessWidget {
  final double height, price, rating, top, bottom, left, right, radius;
  final String image, title;
  final int sale;
  const RecommendedItems({
    Key? key,
  required  this.height,
   required  this.image,
   required  this.price,
   required  this.rating,
   required  this.title,
  required   this.sale,
   required  this.top,
   required  this.bottom,
   required  this.left,
   required  this.right,
   required  this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF26A69A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Color(0xFF26A69A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 10.0,
              left: 4.0,
            ),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF303030).withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              left: 10.0,
            ),
            child: Text("\$ ${price.toString()}"),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              left: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: rating.toString(),
                          style: TextStyle(
                            color: Color(0xFF303030).withOpacity(0.4),
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.top,
                          child: Icon(
                            Icons.star,
                            size: 16.0,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "${sale.toString()} Sale",
                  style: TextStyle(
                    color: Color(0xFF303030).withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
