<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>카톡 공유</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <input type="button" onClick="sendLinkCustom();" value="내 작성글 공유"/>
<!--     <input type="button" onClick="sendLinkDefault();" value="Default"/> -->

<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("a6a0a102a62de18dd2236ad0a22dd021");
        Kakao.Link.sendCustom({
            templateId: 45347 
        });
    }
</script>

<script>
// try {
//   function sendLinkDefault() {
//     Kakao.init('a6a0a102a62de18dd2236ad0a22dd021')
//     Kakao.Link.sendDefault({
//       objectType: 'feed',
//       content: {
//         title: '딸기 치즈 케익',
//         description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
//         imageUrl:
//           'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
//         link: {
//           mobileWebUrl: 'https://developers.kakao.com',
//           webUrl: 'https://developers.kakao.com',
//         },
//       },
//       social: {
//         likeCount: 286,
//         commentCount: 45,
//         sharedCount: 845,
//       },
//       buttons: [
//         {
//           title: '웹으로 보기',
//           link: {
//             mobileWebUrl: 'https://developers.kakao.com',
//             webUrl: 'https://developers.kakao.com',
//           },
//         },
//         {
//           title: '앱으로 보기',
//           link: {
//             mobileWebUrl: 'https://developers.kakao.com',
//             webUrl: 'https://developers.kakao.com',
//           },
//         },
//       ],
//     })
//   }
// ; window.kakaoDemoCallback && window.kakaoDemoCallback() }
// catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
</script>
   
</body>
</html>