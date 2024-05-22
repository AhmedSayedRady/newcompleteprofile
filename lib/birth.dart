import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdateCard extends StatefulWidget {
  const BirthdateCard({super.key});

  @override
  State<BirthdateCard> createState() => _EditBirthdateContentState();
}

class _EditBirthdateContentState extends State<BirthdateCard> {
  String currentDate = "2000-01-01";

  @override
  Widget build(BuildContext context) {
    // final personalInfoCubit = BlocProvider.of<PersonalInfoCubit>(context);
    return
        // BlocListener<ProfileCubit, ProfileState>(
        // listener: (context, state) {
        //   if (state is ProfileFailure) {
        //     context.showFlushBar(
        //       type: FlushBarType.error,
        //       description: state.errorMessage,
        //     );
        //   }
        // },
        // child:
        Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 2,
          width: MediaQuery.of(context).copyWith().size.width,
          child: CupertinoDatePicker(
            initialDateTime: DateTime(2000),
            onDateTimeChanged: (DateTime date) {
              currentDate = "${date.year}-${date.month}-${date.day}";
              // personalInfoCubit.changeDate(currentDate);
            },
            use24hFormat: true,
            maximumYear: DateTime.now().year - 16,
            minimumYear: DateTime.now().year - 100,
            mode: CupertinoDatePickerMode.date,
          ),
        ),
      ],
    );
  }
}
