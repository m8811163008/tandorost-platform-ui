import 'package:domain_model/domain_model.dart';

extension ProfileCMX on ProfileCM {
  ProfileCM copyWith({
    DateTime? birthday,
    String? userName,
    bool? isMale,
    BodyCompositionCM? bodyComposition,
  }) =>
      ProfileCM()
        ..birthday = birthday ?? this.birthday
        ..userName = userName ?? this.userName
        ..isMale = isMale ?? this.isMale
        ..bodyComposition = bodyComposition ?? this.bodyComposition;
}
