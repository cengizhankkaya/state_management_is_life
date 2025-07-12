import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_is_life/feature/travel/cubit/travel_cubit.dart';
import 'package:state_management_is_life/feature/travel/model/travel_model.dart';

import '../../../product/padding/page_padding.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final data = 'See all';
  final data2 = 'Popular destinations near you';
  final data3 = 'Hey Jhon! \n Where do you want to go today?';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelCubit>(
      create: (context) => TravelCubit()..fetchItems(),
      child: BlocConsumer<TravelCubit, TravelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const PagePadding.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data3,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      context.read<TravelCubit>().searchByItems(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data2,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),

                      InkWell(
                        onTap: () {
                          context.read<TravelCubit>().seeAllItems();
                        },
                        child: Text(
                          data,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: _itemsCastale(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state is TravelItemsSeeAll
                          ? state.images.length
                          : 0,
                      itemBuilder: (BuildContext context, int index) {
                        final image =
                            (state as TravelItemsSeeAll).images[index];
                        return Image.asset(image);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemsCastale(BuildContext context) {
    return BlocSelector<TravelCubit, TravelStates, List<TravelModel>>(
      selector: (state) {
        return state is TravelItemsLoaded
            ? state.items
            : context.read<TravelCubit>().allItems;
      },

      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        TravelModel.mockItmes[index].imagePath,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
