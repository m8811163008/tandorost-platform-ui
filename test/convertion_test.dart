import 'dart:convert';

class Nutrition {
  String name;
  int calorie;
  int gramsPerUnit;
  MacroNutrition macroNutrition;

  Nutrition(
      {required this.name,
      required this.calorie,
      required this.gramsPerUnit,
      required this.macroNutrition});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calorie': calorie,
      'gramsPerUnit': gramsPerUnit,
      'macroNutrition': macroNutrition.toJson(),
    };
  }
}

class MacroNutrition {
  double protein;
  double fat;
  double carbohydrate;
  bool isVegetable;

  MacroNutrition(
      {required this.protein,
      required this.fat,
      required this.carbohydrate,
      required this.isVegetable});

  Map<String, dynamic> toJson() {
    return {
      'protein': num.parse(protein.toStringAsFixed(2)),
      'fat': num.parse(fat.toStringAsFixed(2)),
      'carbohydrate': num.parse(carbohydrate.toStringAsFixed(2)),
      'isVegetable': isVegetable,
    };
  }
}

List<Nutrition> convertTableToNutrition(List<List<dynamic>> table) {
  List<Nutrition> nutritionList = [];
  for (int i = 1; i < table.length; i++) {
    try {
      nutritionList.add(
        Nutrition(
          name: table[i][5],
          calorie: int.parse(table[i][3]),
          gramsPerUnit: int.parse(table[i][4]),
          macroNutrition: MacroNutrition(
            protein: double.parse(table[i][1]),
            fat: double.parse(table[i][0]),
            carbohydrate: double.parse(table[i][2]),
            isVegetable: bool.parse(table[i][6]),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  return nutritionList;
}

void main() {
  List<List<dynamic>> table = [
    '29.00	39.00	167.00	1089	250	آلبالو پلو با سینه مرغ آب پز	false'.split('	'),
    '34.00	22.00	132.00	926	250	استانبولی پلو با گوشت	false'.split('	'),
    '34.00	30.00	125.00	938	250	باقلا پلو با مغز ران	false'.split('	'),
    '34.00	49.00	125.00	1015	250	ته چین مرغ	false'.split('	'),
    '29.00	40.00	141.00	1036	250	زرشک پلو با ران مرغ	false'.split('	'),
    '45.00	35.00	133.00	946	250	سبزی پلو با ماهی	false'.split('	'),
    '41.00	44.00	243.00	1505	250	شیرین پلو	false'.split('	'),
    '38.00	33.00	170.00	1151	250	عدس پلو با گوشت چرخ کرده	false'.split('	'),
    '38.00	27.00	136.00	996	250	قیمه پلو با گوشت چرخ کرده	false'.split('	'),
    '54.00	21.00	119.00	965	250	کلم پلو با گوشت چرخ کرده	false'.split('	'),
    '50.00	22.00	125.00	1041	250	لوبیا پلو با گوشت چرخ کرده	false'.split('	'),
    '42.00	45.00	267.00	1604	250	مرصع پلو یا سینه مرغ	false'.split('	'),
    '35.00	31.00	127.00	953	250	نخود پلو با مغز ران	false'.split('	'),
    '35.00	40.00	140.00	1037	250	هویج پلو با سینه مرغ	false'.split('	'),
    '34.00	18.00	7.00	404	200	خورشت آلو اسفناج با گوشت بدون پلو	false'
        .split('	'),
    '41.00	17.00	11.00	480	200	خورشت بادنجان با گوشت بدون پلو	false'.split('	'),
    '26.00	16.00	4.00	334	200	خورشت بامیه با گوشت	false'.split('	'),
    '16.00	16.00	1.00	216	200	خورشت ریواس با گوشت	false'.split('	'),
    '52.00	29.00	27.00	687	200	خورشت فسنجان با چرخ کرده	false'.split('	'),
    '52.00	29.00	27.00	673	200	خورشت فسنجان با سینه مرغ	false'.split('	'),
    '29.00	20.00	37.00	479	200	خورشت قرمه سبزی با گوشت	false'.split('	'),
    '40.00	23.00	29.00	579	200	خورشت قیمه با گوشت	false'.split('	'),
    '35.00	19.00	9.00	428	200	خورشت کدو با گوشت	false'.split('	'),
    '25.00	16.00	3.00	301	200	خورشت کرفس با گوشت	false'.split('	'),
    '24.00	17.00	8.00	326	200	خورشت کنگر با گوشت	false'.split('	'),
    '18.00	26.00	77.00	450	170	آش آلو	false'.split('	'),
    '1.5	5.00	24.00	130	100	آش جو	false'.split('	'),
    '4.36	18.8	36.03	250	100	آش رشته	false'.split('	'),
    '1.4	2.6	9.4	260	100	آش شله قلمکار	false'.split('	'),
    '8.8	10.2	32.3	258	100	آش ماست	false'.split('	'),
    '6.00	13.2	20.8	193	100	آش برنج	false'.split('	'),
    '5.2	5.3	16.4	132	100	آش عدس	false'.split('	'),
    '3.03	4.63	18.04	118	100	آش دوغ	false'.split('	'),
    '5.59	2.56	12.39	107	100	سوپ جو	false'.split('	'),
    '0.3	0.8	7.00	30	100	سوپ گوجه فرنگی	false'.split('	'),
    '0.16	0.45	3.36	15	100	سوپ سبزیجات	false'.split('	'),
    '7.52	4.28	14.52	137	100	سوپ جو با شیر	false'.split('	'),
    '24.1	8	52.1	446	100	سوپ خامه ای سبزیجات	false'.split('	'),
    '3.45	6.5	11.73	96	100	سوپ مرغ	false'.split('	'),
    '3.4	5.28	13.84	105	100	سوپ شیر با مرغ	false'.split('	'),
    '3.53	2.28	5.03	59	100	سوپ قارچ	false'.split('	'),
    '1.22	3.39	13.84	78	100	سوپ ورمیشل	false'.split('	'),
    '11.00	18.00	29.00	285	150	تاس کباب با گوشت	false'.split('	'),
    '39.00	23.00	24.00	536	150	حلیم بادنجان با گوشت	false'.split('	'),
    '29.00	18.00	14.00	386	150	خوراک لوبیا سبز با گوشت	false'.split('	'),
    '44.00	11.00	17.00	504	300	کشک بادمجان	false'.split('	'),
    '5.39	4.49	11.07	108	100	عدسی با کمی روغن	false'.split('	'),
    '2.95	7.09	21.38	136	100	خوراک لوبیا	false'.split('	'),
    '13.47	4.63	12.35	184	100	حلیم بدون روغن	false'.split('	'),
    '4.73	21.81	10.26	170	100	حلیم بادمجان	false'.split('	'),
    '34.00	22.00	57.00	611	250	آبگوشت بزباش	false'.split('	'),
    '10.00	23.00	31.00	305	250	آبگوشت ساده	false'.split('	'),
    '5.00	53.00	0.00	271	220	جوجه کباب سینه بدون پوست	false'.split('	'),
    '14.00	45.00	0.00	314	220	جوجه کباب ران بدون پوست	false'.split('	'),
    '30.00	44.00	0.00	458	220	جوجه کباب بال با پوست	false'.split('	'),
    '27.00	33.00	0.00	376	150	کباب برگ گوسفندی	false'.split('	'),
    '13.00	32.00	0	255	150	کباب برگ گوساله با چربی	false'.split('	'),
    '8.00	33.00	0.00	214	150	کباب برگ گوساله بدون چربی	false'.split('	'),
    '42.00	51.00	0.00	597	250	کباب شیشیلیگ راسته با چربی	false'.split('	'),
    '61.00	45.00	0.00	733	250	کباب شیشیلیگ اطراف دنده با چربی	false'.split('	'),
    '15.00	40.00	0.00	292	150	کباب فیله گوساله	false'.split('	'),
    '39.00	15.00	1.00	408	100	کباب تابه ای گوشت گوسفندی با روغن کم	false'
        .split('	'),
    '38.00	16.00	1.00	402	100	کباب تابه ای گوشت گوساله با روغن کم	false'
        .split('	'),
    '13.00	13.00	0.00	211	100	کباب کوبیده	false'.split('	'),
    '1.00	3.00	0.00	24	30	دل کبابی	false'.split('	'),
    '43.00	28.00	40.00	611	70	کتلت آرد نخودچی با چرخ کرده	false'.split('	'),
    '39.00	15.00	10.00	453	70	کتلت گوشت	false'.split('	'),
    '13.00	26.00	46.00	406	120	کوفته برنجی	false'.split('	'),
    '14.00	30.00	55.00	467	120	کوفته تبریزی	false'.split('	'),
    '33.00	8.00	3.00	343	300	کوکو سبزی	false'.split('	'),
    '31.00	9.00	9.00	342	170	کوکوسیب زمینی	false'.split('	'),
    '1.00	4.00	0.00	32	30	دل تفت داده شده	false'.split('	'),
    '2.00	7.00	0.00	51	80	دل مرغ پخته	false'.split('	'),
    '3.00	7.00	0.00	57	160	جگر گوسفند تفت داده شده	false'.split('	'),
    '4.00	11.00	1.00	85	120	جگر گوساله تفت داده شده	false'.split('	'),
    '2.00	6.00	0.00	43	120	جگر مرغ پخته با آب کم	false'.split('	'),
    '27.00	17.00	33.00	446	220	سالاد الویه	false'.split('	'),
    '41.00	28.00	46.00	654	200	لازانیا	false'.split('	'),
    '39.00	23.00	51.00	646	300	ماکارونی	false'.split('	'),
    '3.36	5.96	36.82	199	100	فرنی	false'.split('	'),
    '2.02	4.06	14.65	94	100	شیر برنج	false'.split('	'),
    '4.22	1.86	16.81	113	100	پوره سیب زمینی با شیر و کره	false'.split('	'),
    '2.82	1.65	14.65	89	100	پوره سیب زمینی	false'.split('	'),
    '9.83	10.58	26.97	241	100	پیتزا مخلوط	false'.split('	'),
    '7.44	9.8	28.36	220	100	پیتزا گوشت	false'.split('	'),
    '9.49	17.01	19.33	232	100	پیتزا مرغ	false'.split('	'),
    '5.55	5.5	31.83	201	100	پیتزا قارچ و مرغ	false'.split('	'),
    '4.3	17.8	8.5	140	100	همبرگر منجمد	false'.split('	'),
    '11.24	14.74	33.71	295	100	ساندویچ همبرگر معمولی	false'.split('	'),
    '2.59	8.92	21.49	143	100	ساندویچ همبرگر گوشت و قارچ	false'.split('	'),
    '11.97	8.52	25.57	238	100	فلافل	false'.split('	'),
    '11.84	3.53	46.62	304	100	حلوا	false'.split('	'),
    '21.04	10.03	56.69	437	100	حلوا ارده	false'.split('	'),
    '3.5	16.00	75.00	300	100	سمنو	false'.split('	'),
    '3.88	5.56	19.3	134	100	دلمه برگ مو	false'.split('	'),
    '12.00	11.00	0.6	154	100	املت	false'.split('	'),
    '3.00	3.5	7.6	70	100	آب دوغ خیار	false'.split('	'),
  ];

  List<Nutrition> nutritionList = convertTableToNutrition(table);
  String json = jsonEncode(nutritionList.map((e) => e.toJson()).toList());
  print(json);
}
