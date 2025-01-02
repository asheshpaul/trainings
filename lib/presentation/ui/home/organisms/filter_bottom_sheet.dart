import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/data_sources/dummy_trainings.dart';
import '../../../cubits/training_cubit.dart';
import '../../../cubits/training_state.dart';
import '../../shared/atoms/colors.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingCubit, TrainingState>(
      builder: (context, state) {
        final cubit = context.read<TrainingCubit>();
        final addresses = cubit.getAddresses;
        final trainingNames = cubit.getTrainings;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeaderSection(context),
            const Divider(height: 0),
            Expanded(
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: FilterCategoryList(
                      categories: filterCategories,
                      selectedIndex: state.currentFilterTabIndex,
                      onCategorySelected: (index) =>
                          context.read<TrainingCubit>().changeFilterOptions(index),
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: state.currentFilterTabIndex == 1
                          ? ListView.builder(
                              itemCount: addresses.length,
                              itemBuilder: (context, index) {
                                final address = addresses[index];
                                return FilterOptionItem(
                                  text: '${address.city}, ${address.countryCode}',
                                  isSelected: state.selectedLocations
                                      .contains(address.city),
                                  onChanged: (bool? value) {
                                    context
                                        .read<TrainingCubit>()
                                        .addOrRemoveLocationFilter(
                                        address.city);
                                  },
                                );
                              },
                            )
                          : state.currentFilterTabIndex == 2
                              ? ListView.builder(
                                  itemCount: trainingNames.length,
                                  itemBuilder: (context, index) {
                                    final trainingName = trainingNames[index];
                                    return FilterOptionItem(
                                      text: trainingName,
                                      isSelected: state.selectedTrainings
                                          .contains(trainingName),
                                      onChanged: (bool? value) {
                                        context
                                            .read<TrainingCubit>()
                                            .addOrRemoveTrainingFilter(trainingName);
                                      },
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text("No options!"),
                                ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ),
          ],
        );
      },
    );
  }

  Padding buildHeaderSection(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: const Text(
                'Sort and Filter',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    context.read<TrainingCubit>().clearFilters();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
            ),
          );
  }
}

class FilterCategoryItem extends StatelessWidget {
  const FilterCategoryItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.onPrimary,
      dense: true,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Container(
        width: 4,
        color: isSelected ? AppColors.primary : null,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.onPrimary,
      onTap: onTap,
    );
  }
}

class FilterCategoryList extends StatelessWidget {
  const FilterCategoryList(
      {super.key,
      required this.categories,
      required this.selectedIndex,
      required this.onCategorySelected});

  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.greyBG,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return FilterCategoryItem(
            text: categories[index],
            isSelected: selectedIndex == index,
            onTap: () => onCategorySelected(index),
          );
        },
      ),
    );
  }
}

class FilterOptionItem extends StatelessWidget {
  const FilterOptionItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onChanged,
  });

  final String text;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      horizontalTitleGap: 4,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(text, style: const TextStyle(fontSize: 16)),
        value: isSelected,
        onChanged: onChanged,
      ),
    );
  }
}
