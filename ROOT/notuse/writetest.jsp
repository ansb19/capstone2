<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %> 


<%
// API 호출
String apiURL = "http://openapi.work.go.kr/opi/commonCode/commonCode.do";
String apiKey = "WNLFG28XCRV9OZ3BXENIY2VR1HK";
String detailGb = "1";

StringBuilder params = new StringBuilder();
params.append("returnType=XML");
params.append("&target=CMCD");
params.append("&authKey=").append(apiKey);
params.append("&dtlGb=").append(detailGb);

URL url = new URL(apiURL + "?" + params.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();

// 응답 받기
BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
String line;
StringBuilder responseBuilder = new StringBuilder();
while ((line = rd.readLine()) != null) {
    responseBuilder.append(line);
}
rd.close();
conn.disconnect();
String responses = responseBuilder.toString();

// XML 파싱하여 JSON으로 변환
JSONObject json = new JSONObject(org.json.XML.toJSONObject(responses).toString());

// JSON 값 저장
String resultCode = json.getJSONObject("result").getString("code");
String resultMessage = json.getJSONObject("result").getString("message");
JSONObject commonCode = json.getJSONObject("message").getJSONObject("body").getJSONObject("items").getJSONObject("item");

String codeId = commonCode.getString("codeId");
String codeNm = commonCode.getString("codeNm");
String grpCd = commonCode.getString("grpCd");
String grpCdNm = commonCode.getString("grpCdNm");
%>

<%
    // 중첩된 항목 처리 및 저장
    JSONArray oneDepthArray = commonCode.getJSONArray("oneDepth");
    for (int i = 0; i < oneDepthArray.length(); i++) {
        JSONObject oneDepth = oneDepthArray.getJSONObject(i);
        String regionCd1 = oneDepth.getString("regionCd");
        String regionNm1 = oneDepth.getString("regionNm");
        out.println("oneDepth : " + regionCd1 + " - " + regionNm1 + "<br>");

        JSONArray twoDepthArray = oneDepth.optJSONArray("twoDepth");
        if (twoDepthArray != null) {
            for (int j = 0; j < twoDepthArray.length(); j++) {
                JSONObject twoDepth = twoDepthArray.getJSONObject(j);
                String regionCd2 = twoDepth.getString("regionCd");
                String regionNm2 = twoDepth.getString("regionNm");
                out.println("&nbsp;&nbsp;twoDepth : " + regionCd2 + " - " + regionNm2 + "<br>");
            }
        }
    }
%>
