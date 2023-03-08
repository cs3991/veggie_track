import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:veggie_track/calendar/ui/calendar/month_view.dart';
import 'package:veggie_track/date_format/date_utils.dart';

import '../../bloc/month_days_bloc/month_days_bloc.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    foregroundColor: colors.onPrimaryContainer,
                  ),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    var bloc = context.read<MonthDaysBloc>();
                    bloc.updateMonth(
                      DateTime(bloc.state.month.year, bloc.state.month.month - 1),
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    elevation: 0,
                    fixedSize: const Size(150, 40),
                  ),
                  onPressed: () {},
                  child: BlocBuilder<MonthDaysBloc, MonthDaysState>(
                    builder: (context, state) {
                      if (state is MonthDaysInitial) {
                        context.read<MonthDaysBloc>().updateMonth(DateTime.now());
                      }
                      return Text(
                        DateFormat.yMMMM().format(state.month).camelCase(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: colors.onPrimaryContainer,
                            ),
                      );
                    },
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    foregroundColor: colors.onPrimaryContainer,
                  ),
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    var bloc = context.read<MonthDaysBloc>();
                    bloc.updateMonth(
                      DateTime(bloc.state.month.year, bloc.state.month.month + 1),
                    );
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(height: 440, child: MonthView()),
          ),
        ],
      ),
    );
  }
}
