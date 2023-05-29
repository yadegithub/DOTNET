import 'package:flextrip/app/models/product_model.dart';
import 'package:flextrip/app/modules/hotel%20booking/core/route/app_route_name.dart';
import 'package:flextrip/app/modules/hotel%20booking/core/theme/app_color.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/detail_destionation/presentation/detail_destination_screen.dart';
import 'package:flextrip/app/modules/hotel%20booking/feature/home/model/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class PopularDestinationWidget extends StatelessWidget {
  const PopularDestinationWidget({super.key});

  @override
  Widget buildDetail(BuildContext context, int index) {
    ProductModel productModel = productList[index];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 320,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: popularDestionation.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
               Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailDestinationScreen(
              productModel: productModel,
            ),
          ),
        );
              // Navigator.pushNamed(
              //   context,
              //   AppRouteName.detailDestination,
              //   arguments: popularDestionation[index],
              // );
            },
            child: Container(
              height: 320,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          popularDestionation[index].asset,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDestionation[index].name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.place,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(popularDestionation[index].location),
                                ],
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${popularDestionation[index].price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: AppColor.primaryColor,
                                    ),
                              ),
                              const TextSpan(text: "\n"),
                              TextSpan(
                                text: "/Person",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildDetail(context,2);
  }
}
