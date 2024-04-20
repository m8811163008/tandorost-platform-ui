
// class Profile {
//   Profile(
//       {required this.userName,
//       this.birthday,
//       this.birthdayShamsi,
//       this.isMale,
//       this.bodyComposition});

//   factory Profile.empty() {
//     return Profile(
//       userName: '',
//       birthday: DateTime.now(),
//       birthdayShamsi: '--/--/----',
//       isMale: false,
//       bodyComposition: BodyComposition(
//         startBodycompositionChanging: DateTime.now(),
//       ),
//     );
//   }

//   final String userName;
//   final DateTime? birthday;

//   /// in format of --/--/----
//   final String? birthdayShamsi;

//   final bool? isMale;

//   final BodyComposition? bodyComposition;

//   Profile copyWith(
//       {String? userName,
//       ValueGetter<DateTime?>? birthday,
//       ValueGetter<String?>? birthdayShamsi,
//       ValueGetter<bool?>? isMale,
//       ValueGetter<BodyComposition?>? bodyComposition}) {
//     return Profile(
//         userName: userName ?? this.userName,
//         birthday: birthday != null ? birthday() : this.birthday,
//         birthdayShamsi:
//             birthdayShamsi != null ? birthdayShamsi() : this.birthdayShamsi,
//         isMale: isMale != null ? isMale() : this.isMale,
//         bodyComposition:
//             bodyComposition != null ? bodyComposition() : this.bodyComposition);
//   }
// }
