import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class SelectBirthdayButton extends StatefulWidget {
  const SelectBirthdayButton({
    super.key,
    this.onSelectDate,
    this.initialDate,
  });
  final ValueSetter<DateTime>? onSelectDate;

  final DateTime? initialDate;

  @override
  State<SelectBirthdayButton> createState() => _SelectBirthdayButtonState();
}

class _SelectBirthdayButtonState extends State<SelectBirthdayButton> {
  late Jalali _selectedDate;
  late String _buttonLabel;
  @override
  void initState() {
    // if initial date is not specified the initial would be 2000
    if (widget.initialDate == null) {
      _selectedDate = Jalali.fromDateTime(DateTime.now()).addYears(-20);
    } else {
      _selectedDate = Jalali.fromDateTime(widget.initialDate!);
    }

    _buttonLabel =
        widget.initialDate == null ? 'انتخاب کنید' : _buildLabel(_selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        Jalali? picked = await showPersianDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: Jalali(1340, 1),
          lastDate: Jalali(1386, 1),
        );
        if (picked == null) return;

        widget.onSelectDate?.call(picked.toDateTime());

        setState(() {
          _selectedDate = picked;
          _buttonLabel = _buildLabel(_selectedDate);
        });
      },
      icon: Icon(Ionicons.calendar),
      label: Text(_buttonLabel),
    );
  }

  String _buildLabel(Jalali selectedDate) {
    final formatter = selectedDate.formatter;

    return '${formatter.dd} ${formatter.mN} ${formatter.yyyy}';
  }
}
