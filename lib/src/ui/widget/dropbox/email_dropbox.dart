import 'package:cosnect/src/model/email_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EmailDropbox extends HookWidget {
  const EmailDropbox({
    super.key,
    required this.onChanged,
    this.initialValue = EmailDomain.gmail,
  });

  final Function(EmailDomain accountInfo) onChanged;
  final EmailDomain initialValue;

  @override
  Widget build(BuildContext context) {
    final currentValue = useState<EmailDomain>(initialValue);

    return DropdownButton2(
      value: currentValue.value,
      items: EmailDomain.values
          .map(
            (domain) => DropdownMenuItem(
              value: domain,
              child: Text(domain.url),
            ),
          )
          .toList(),
      onChanged: (domain) {
        currentValue.value = domain ?? EmailDomain.gmail;
        onChanged(currentValue.value);
      },
    );
  }
}
