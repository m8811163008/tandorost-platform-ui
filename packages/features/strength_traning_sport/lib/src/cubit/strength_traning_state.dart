part of 'strength_traning_cubit.dart';

class StrengthTraningState {
  final ProcessAsyncStatus puchaseSubscriptionStatus;

  StrengthTraningState({
    this.puchaseSubscriptionStatus = ProcessAsyncStatus.initial,
  });

  StrengthTraningState copyWith({
    ProcessAsyncStatus? puchaseSubscriptionStatus,
  }) {
    return StrengthTraningState(
      puchaseSubscriptionStatus:
          puchaseSubscriptionStatus ?? this.puchaseSubscriptionStatus,
    );
  }
}

class StrengthTraningProgram {
  final String resourceUrl;
  final String label;

  StrengthTraningProgram({required this.resourceUrl, required this.label});

  static List<StrengthTraningProgram> get strengthTrainingPrograms => [
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/kn6agrhujraholvtv909p/Warming-Up-Stretching.pdf?rlkey=r4aiz58vsl4eqbf4rp8p4y35k&st=qgb0apow&dl=0',
          label: 'Warming Up, Stretching',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/utg7nnqltem0ows6jgc5m/Beginner-Whole-Body-Training-Split-Gym-1day.pdf?rlkey=iafy6tds88tyb4kodlsui8th4&st=x6ckchgb&dl=0',
          label: 'Beginner Whole-Body Training Split Gym 1day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/32d1hxcuazm20jeg010a7/Beginner-Whole-Body-Training-Split-Home-1day.pdf?rlkey=a57ctd3odim4xnswb6ubgacx5&st=n66w23bj&dl=0',
          label: 'Beginner Whole-Body Training Split Home 1day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/034p2vc85wfvy7t8r7blw/Two-Day-Training-Split-Gym-2day.pdf?rlkey=vomio2tcx41dpq4wrk8q3vjcj&st=03dpieda&dl=0',
          label: 'Two-Day Training Split Gym 2day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/faqajtptnf4wj8y6vvj2t/Two-Day-Training-Split-Home-2day.pdf?rlkey=jl6xwncofozbni49cbs6p1o8m&st=gd9s5v27&dl=0',
          label: 'Two-Day Training Split Home 2day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/07zyqea46chf5w2y7k1ob/Beginner-Basic-Fat-Loss-Program-Gym-3day.pdf?rlkey=t4htlp4ytdi3ygada46ywqzpi&st=ysuku4kc&dl=0',
          label: 'Beginner Basic Fat-Loss Program Gym 3day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/acoopq2wa0zcj76cx03s0/Beginner-Basic-Fat-Loss-Program-Home-3day.pdf?rlkey=2n1zniwd1vt25gzga8muui8p8&st=bt9wgse5&dl=0',
          label: 'Beginner Basic Fat-Loss Program Home 3day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/0rz8r4c7h03jqxo88dutd/Feel-the-Burn-Workout-Gym-4day.pdf?rlkey=tjgwjkin1higgcd8z00y0o9yk&st=ngs71csn&dl=0',
          label: 'Feel the Burn Workout Gym 4day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/w9qiiigrynilij3o29qd8/Feel-the-Burn-Workout-Home-4day.pdf?rlkey=vh2256fph55rxv7kzkgkuf77b&st=d7yhlbjr&dl=0',
          label: 'Feel the Burn Workout Home 4day',
        ),
        StrengthTraningProgram(
          resourceUrl:
              'https://www.dropbox.com/scl/fi/q6tnr79ei14e7o0w48jky/Full-Body-Intermediate-Fat-Loss-Workouts-5day.pdf?rlkey=na5a96n9nnet7a89ieoa347s8&st=4sa62625&dl=0',
          label: 'Full-Body Intermediate Fat-Loss Workouts 5day',
        ),
      ];

  @override
  bool operator ==(covariant StrengthTraningProgram other) {
    if (identical(this, other)) return true;

    return other.resourceUrl == resourceUrl && other.label == label;
  }

  @override
  int get hashCode => resourceUrl.hashCode ^ label.hashCode;
}
