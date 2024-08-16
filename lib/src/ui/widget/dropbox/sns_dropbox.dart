import 'package:cosnect/src/model/sns_info.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SNSDropbox extends HookWidget {
  const SNSDropbox({
    super.key,
    this.initialSNS,
    required this.onSelected,
  });

  final SNSAccountInfo? initialSNS;
  final Function(SNSAccountInfo accountInfo) onSelected;

  @override
  Widget build(BuildContext context) {
    // id or name 상태정보를 저장하는 변수
    final accountInfo = useState(initialSNS ?? SNSAccountInfo.x);

    // 트위터 계정 정보를 토글하는 위젯
    // 위젯을 탭하면 id와 name을 번갈아가면서 토글
    return DropdownButtonHideUnderline(
      child: DropdownButton2<SNSAccountInfo>(
        value: accountInfo.value,
        onChanged: (value) {
          accountInfo.value = value ?? SNSAccountInfo.x;
          onSelected(accountInfo.value);
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.all(0),
        ),
        items: [
          DropdownMenuItem(
            value: SNSAccountInfo.x,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/logo/x.svg',
              height: 20,
              fit: BoxFit.fitHeight,
            ),
          ),
          DropdownMenuItem(
            value: SNSAccountInfo.instagram,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/logo/instagram.svg',
              height: 20,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
