enum EmailDomain {
  gmail(url: 'gmail.com'),
  naver(url: 'naver.com'),
  daum(url: 'daum.net'),
  kakao(url: 'kakao.com'),
  nate(url: 'nate.com');

  const EmailDomain({required this.url});

  final String url;
}