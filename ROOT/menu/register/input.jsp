<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/css/normal_style.css?after" rel="stylesheet" type="text/css">
    <link href="/css/register.css?after" rel="stylesheet" type="text/css">
    <link href="/css/menu.css?after" rel="stylesheet" type="text/css">

</head>
<body>
      <!--구글 번역 API-->                   
      <li><div id="google_translate_element" class="hd_lang" style="float: right;position: relative;"></div></li>
      <script>
        function googleTranslateElementInit() {
        new google.translate.TranslateElement({
        pageLanguage: 'ko',
        includedLanguages: 'af,sq,am,ar,hy,as,ay,az,bm,eu,be,bn,bho,bs,bg,ca,ceb,zh-CN,zh-TW,co,hr,cs,da,dv,doi,nl,en,eo,et,ee,fil,fi,fr,fy,gl,ka,de,el,gn,gu,ht,ha,haw,he,hi,hmn,hu,is,ig,ilo,id,ga,it,ja,jv,kn,kk,km,rw,gom,ko,kri,ku,ckb,ky,lo,la,lv,ln,lt,lg,lb,mk,mai,mg,ms,ml,mt,mi,mr,mni-Mtei,lus,mn,my,ne,no,ny,or,om,ps,fa,pl,pt,pa,qu,ro,ru,sm,sa,gd,nso,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tl,tg,ta,tt,te,th,ti,ts,tr,tk,ak,uk,ur,ug,uz,vi,cy,xh,yi,yo,zu',
        //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
        }, 'google_translate_element');
        }
      </script>             
      <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>                                        
    <!--구글 번역 API-->
<div class="register_wrap">
  <header class="container mt-3">
      <div class="top_sec">
        JSL
      </div>
  </header>
  <main class="container mt-5">
      <div class="row">
        <div class="mbody">
          <form action="/controller/signup.jsp" method="post" class="border rounded-3 p-4">
            <div class="msg_box _msg_box" id="msg_box_id">
              <input type="text" class="form-control" placeholder="아이디" id="txt_id" name="id" minlength="4">
              <div class="alert_block _id_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_pass">
              <input type="password" class="form-control" placeholder="비밀번호" id="txt_pass" name="pw" minlength="4">
              <div class="alert_block _pass_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_name">
              <input type="name" class="form-control" placeholder="이름" id="txt_name" name="name"> <!-- 새로운 회원 데이터, 페북 구글 로그인시 전화번호 가져오기도 해야함(기존 회원은 예외) -->
              <div class="alert_block _name_msg"></div>
              <div class="error_box" id="error_box_name"></div> 
            </div>
            <div class="msg_box _msg_box" id="msg_box_birth">
              <input type="birth" class="form-control" maxlength="6" placeholder="생일 [주민번호 앞자리 6자리]" id="txt_birth" name="birth"> <!-- 새로운 회원 데이터, 페북 구글 로그인시 전화번호 가져오기도 해야함(기존 회원은 예외) -->
              <div class="alert_block _birth_msg"></div>
              <div class="error_box" id="error_box_birth"></div> 
            </div>
            <div>
              <select class="select_box" id="sex" name="sex">
                <option value="man" label="남자"></option>
                <option value="woman" label="여자"></option>
              </select>
            </div>
            <div>        
              <select class="select_box" id="type" name="type">
                <option value="person" label="개인"></option>
                <option value="business" label="기업"></option>
              </select>          
            </div>
            <div class="msg_box _msg_box" id="msg_box_email">
              <input type="email" class="form-control" placeholder="이메일" id="txt_email" name="email">
              <div class="alert_block _email_msg"></div>
            </div>
            <div class="msg_box _msg_box" id="msg_box_phone">
              <input type="tel" class="form-control" placeholder="전화번호" id="txt_phone" name="phone"> <!-- 새로운 회원 데이터, 페북 구글 로그인시 전화번호 가져오기도 해야함(기존 회원은 예외) -->
              <div class="alert_block _phone_msg"></div>
              <div class="error_box" id="error_box_phone"></div> 
            </div>
            <div class="msg_box _msg_box" id="msg_box_adress">
              <input type="adress" class="form-control" placeholder="주소" id="txt_adress" name="address"> <!-- 새로운 회원 데이터, 페북 구글 로그인시 전화번호 가져오기도 해야함(기존 회원은 예외) -->
              <div class="alert_block _adress_msg"></div>
              <div class="error_box" id="error_box_adress"></div> 
            </div>
            <br>
            <div style="overflow:auto; width:600px; height:150px; border:1px solid; margin:0 auto;">
              제 1장 총칙

제 1 조(목적)

본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조(약관의 효력과 변경)

1. 국가공간정보포털은 이용자가 본 약관 내용에 동의하는 경우, 국가공간정보포털의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 국가공간정보포털은 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 국가공간정보포털의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 국가공간정보포털은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.
3. 변경된 약관은 국가공간정보포털 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.

제 3 조(약관 외 준칙)

본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.

제 4 조(용어의 정의)

본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 국가공간정보포털이 제공하는 서비스를 받는 자
2. 가입 : 국가공간정보포털이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
3. 회원 : 국가공간정보포털에 개인 정보를 제공하여 회원 등록을 한 자로서 국가공간정보포털이 제공하는 서비스를 이용할 수 있는 자.
4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 국가공간정보포털에서 부여하는 문자와 숫자의 조합
5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합
6. 탈퇴 : 회원이 이용계약을 종료시키는 행위
7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.


제 2장 서비스 제공 및 이용

제 5 조 (이용계약의 성립)

1. 이용계약은 이용자가 온라인으로 국가공간정보포털에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
2. 국가공간정보포털은 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
 1) 다른 사람의 명의를 사용하여 신청하였을 때
 2) 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
 3) 다른 사람의 국가공간정보포털 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
 4) 국가공간정보포털을 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
 5) 기타 국가공간정보포털이 정한 이용신청요건이 미비 되었을 때

제 6 조 (회원정보 사용에 대한 동의)

1. 회원의 개인정보는 「공공기관의개인정보보호에관한법률」에 의해 보호됩니다.
2. 국가공간정보포털의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
 1) 개인정보의 사용 : 국가공간정보포털는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습 니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 이용자 스스로 개인정보를 공개한 경우에는 그러 하지 않습니다.
 2) 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다.
 3) 개인정보의 보호 : 회원의 개인정보는 오직 본인만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 회원의 계정과 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 계정과 비밀번호를 알려주어서는 안되며, 작업 종료시에는 반드시 로그아웃해 주시기 바랍니다.
3. 회원이 본 약관에 따라 이용신청을 하는 것은, 국가공간정보포털의 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주 됩니다.

제 7 조 (사용자의 정보 보안)

1. 이용자는 국가공간정보포털 서비스 가입 절차를 완료하는 순간부터 본인이 입력한 정보의 비밀을 유지할 책임이 있으며, 회원이 고의나 중대한 실수로 회원의 계정과 비밀번호를 사용하여 발생한 피해에 대한 책임은 회원 본인에게 있습니다.
2. 계정과 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 계정이나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 국가공간정보포털에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
3. 이용자는 국가공간정보포털 서비스의 사용 종료시마다 정확히 접속을 종료해야 하며, 정확히 종료하지 아니함으로써 제3자가 이용자에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 국가공간정보포털은 책임을 부담하지 아니합니다.

제 8 조 (서비스의 변경)

1. 당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
2. 당 사이트는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의,과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.

제 9 조 (이용기간 및 자격의 정지 및 상실)

1. 국가공간정보포털 회원이용기간은 조직통폐합에 따른 불가항력을 제외하고 회원신청에서 탈퇴까지로 합니다.
2. 국가공간정보포털은 이용자가 본 약관에 명시된 내용을 위배하는 행동을 한 경우, 이용자격을 일시적으로 정지하고 30일 이내에 시정하도록 이용자에게 요구할 수 있으며, 이후 동일한 행위를 2회 이상 반복할 경우에 30일간의 소명기회를 부여한 후 이용자격을 상실시킬 수 있습니다.
3. 국가공간정보포털 회원이 신청 후 12개월이상 장시간 이용하지 않은 회원은 휴면아이디로 분류하여, 자격 정지 및 상실이 가능합니다.

제 10 조 (계약해제, 해지 등)

1. 회원은 언제든지 서비스 초기화면의 마이페이지 또는 정보수정 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, 국가공간정보포털은 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
2. 회원이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 국가공간정보포털이 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸됩니다.
3. 회원이 계약을 해지하는 경우, 회원이 작성한 게시물 중 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 단, 타인에 의해 스크랩 되어 재게시되거나, 공용게시판에 등록된 게시물 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.

제 11 조 (게시물의 저작권)

1. 이용자가 게시한 게시물의 저작권은 이용자가 소유하며, 국가공간정보포털는 서비스 내에 이를 게시할 수 있는 권리를 갖습니다.
2. 국가공간정보포털은 다음 각 호에 해당하는 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
 1) 본서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
 2) 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
 3) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
 4) 불법복제 또는 해킹을 조장하는 내용인 경우
 5) 영리를 목적으로 하는 광고일 경우
 6) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
 7) 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
 8) 국가공간정보포털에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
 9) 기타 관계법령에 위배된다고 판단되는 경우
3. 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 이용자가 부담하여야 합니다.


제 3장 의무 및 책임


제 12 조 (국가공간정보포털의 의무)

1. 국가공간정보포털은 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 단, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.
2. 국가공간정보포털은 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적·안정적으로 서비스를 제공하기 위해 노력 할 의무가 있습니다.
3. 국가공간정보포털은 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.

제 13 조 (회원의 의무)

1. 회원 가입시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 회원에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 계정 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
2. 회원은 국가공간정보포털의 사전 승낙없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 그 영업활동의 결과에 대해 국가공간정보포털은 일절 책임을 지지 않습니다. 또한 회원은 이와 같은 영업활동으로 국가공간정보포털이 손해를 입은 경우 손해배상의무를 지며, 국가공간정보포털은 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.
3. 회원은 국가공간정보포털 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.
 1) 회원가입 신청 또는 회원정보 변경 시 허위내용을 기재하거나 다른 회원의 비밀번호와 ID를 도용하여 부정 사용하는 행위
 2) 저속, 음란, 모욕적, 위협적이거나 타인의 Privacy를 침해할 수 있는 내용을 전송, 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
 3) 국가공간정보포털 운영진, 직원 또는 관계자를 사칭하는 행위
 4) 서비스를 통하여 전송된 내용의 출처를 위장하는 행위
 5) 법률, 계약에 의해 이용할 수 없는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
 6) 서버 해킹 및 컴퓨터바이러스 유포, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
 7) 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
 8) 국가공간정보포털의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
 9) 다른 사용자의 개인정보를 수집, 저장, 공개하는 행위
 10) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
 11) 선량한 풍은 이용자간 또는 이용자와 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 이용자가 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.

제 16 조 (재판관할)

국가공간정보포털과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할법원에 제기합니다.
부 칙 1. (시행일) 본 약관은 2016년 1월 1일부터 시행됩니다.속, 기타 사회질서를 해하는 행위
 12) 타인의 명예를 훼손하거나 모욕하는 행위
 13) 타인의 지적재산권 등의 권리를 침해하는 행위
 14) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
 15) 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
 17) 본 약관을 포함하여 기타 국가공간정보포털이 정한 제반 규정 또는 이용 조건을 위반하는 행위
 18) 기타 관계법령에 위배되는 행위


제 4장 기타


제 14 조 (양도금지)

회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.

제 15조 (면책조항)

1. 국가공간정보포털은 서비스 이용과 관련하여 이용자에게 발생한 손해에 대하여 국가공간정보포털의 중대한 과실, 고의 또는 범죄행위로 인해 발생한 손해를 제외하고 이에 대하여 책임을 부담하지 않으며, 이용자가 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
2. 국가공간정보포털은 서비스 이용과 관련하여 이용자에게 발생한 손해 중 이용자의 고의, 실수에 의한 손해에 대하여 책임을 부담하지 아니합니다.
3. 국가공간정보포털
          </div>

            <input type="checkbox">위의 약관에 동의 합니다.
            <div class="d-grid">
              <br>
              <button class="btn" type="submit">가입</button>
              <button class="btn" type="button" onclick="location.href='../../../'">돌아가기</button>
            </div>
          </form>
        </div>
      </div>

  </main>
</div>

<footer class="container-fluid mt-5 p-5 border-top">
  <p class="lead text-muted text-center">made by DOIT</p>
</footer>
</body>
<script>

  //$("#txt_phone").on('keydown').check_callnum();

  $("#txt_id").on('focusout', function(){
      check_input_empty('id'); //이름 공백체크
  });

  $("#txt_email").on('focusout', function(){
      check_input_empty('email'); //이메일 공백체크
  });

  $("#txt_pass").on('focusout', function(){
      check_input_empty('pass'); //비밀번호 공백체크
  });

  $("#txt_repass").on('focusout', function(){
      check_input_empty('repass'); //비밀번호 공백체크
  });

  $("#txt_phone").on('focusout', function(){
      check_input_empty('phone'); //핸드폰 공백체크
  });
  $("#txt_name").on('focusout', function(){
      check_input_empty('name'); //이름 공백체크
  });
  $("#txt_birth").on('focusout', function(){
      check_input_empty('birth'); //생일 공백체크
  });
  $("#txt_adress").on('focusout', function(){
      check_input_empty('adress'); //생일 공백체크
  });




  //각 항목 공백체크 함수
  function check_input_empty(type){
      var input = $("#txt_"+type).val();
      var msg = $("._"+type+"_msg");
      var msg_box = $("#msg_box_"+type);

      if(input === ''){
          switch(type){
              case 'id':
                  msg.text('아이디을 입력해 주세요.');
                  break;
              case 'email':
                  msg.text('이메일을 입력해 주세요.');
                  break;
              case 'pass':
                  msg.text('비밀번호를 입력해 주세요.');
                  break;
              case 'repass':
                  msg.text('비밀번호 확인을 입력해 주세요.');
                  break;
              case 'phone':
                  msg.text('전화번호를 입력해주세요.');
                  break;
              case 'name':
                  msg.text('이름을 입력해주세요.');
                  break;
              case 'birth':
                  msg.text('생일을 입력해주세요.');
                  break;
              case 'adress':
                  msg.text('주소를 입력해주세요.');
                  break;
          }
          msg_box.addClass('out');
      } else {
          if(type === 'pass' && input.length < 8) {
              msg.text('비밀번호는 8자리 이상이여야 합니다.');
              msg_box.addClass('out');
          }else{
              msg.text('');
              msg_box.removeClass('out');
          }
          if (type === 'repass' && 'pass' !== 'repass'){
              msg.text('비밀번호가 일치하지않습니다.')
              msg_box.removeClass('out');
          }
          email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;    
          if(type === 'email' && !email_regex.test(input)){
              msg.text('이메일 양식이 맞지 않습니다.');
              msg_box.addClass('out');
          }
          else{
              msg.text('');
              msg_box.removeClass('out');
          }
      }
  };
</script>
<script>
$(document).ready(function(){

$('ul.tabs li').click(function(){
var tab_id = $(this).attr('data-tab');

$('ul.tabs li').removeClass('current');
$('.tab-content').removeClass('current');

$(this).addClass('current');
$("#"+tab_id).addClass('current');
})

})
</script>
</html>