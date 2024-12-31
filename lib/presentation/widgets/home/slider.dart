import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/colors.dart';
import '../../cubits/slider_cubit.dart';
import 'slider_buttons.dart';
import '../../styles/slider_styles.dart';

class HomeSlider extends StatelessWidget {
  final List<String> imgList;

  const HomeSlider({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SliderCubit(),
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          return Container(
            color: AppColors.primary,
            child: Row(
              children: [
                sliderChangeButton(
                  onTap: () => context.read<SliderCubit>().previousPage(),
                  iconData: Icons.arrow_back_ios_new,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child: CarouselSlider.builder(
                      carouselController: state.controller,
                      options: CarouselOptions(
                        height: 158,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500),
                        onPageChanged: (index, reason) {
                          context.read<SliderCubit>().changeIndex(index);
                        },
                      ),
                      itemCount: imgList.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: const ColorFilter.mode(
                                Colors.black54,
                                BlendMode.darken,
                              ),
                              image: AssetImage(imgList[itemIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Text(
                                  'Training Title',
                                  style: titleTextStyle(),
                                ),
                                subtitle: Text(
                                  'Place, City - 11 Jan - 13 Jan',
                                  style: subTitleTextStyle(),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          "\$900",
                                          style: actualPriceTextStyle(),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "\$700",
                                          style: offerPriceTextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: const Text('View Details'),
                                    iconAlignment: IconAlignment.end,
                                    icon: const Icon(Icons.arrow_forward),
                                    style: viewDetailsButtonStyle(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                sliderChangeButton(
                  onTap: () => state.controller.nextPage(),
                  iconData: Icons.arrow_forward_ios,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
