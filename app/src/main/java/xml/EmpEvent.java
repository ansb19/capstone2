package xml;

import java.util.ArrayList;
import java.lang.Integer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class EmpEvent {

    ApiInfo apiinfo = new ApiInfo();
    // 본인이 받은 api키를 추가
    public static int page = 1;
    public static int display = 100;

    String url = apiinfo.empEventApiurl("L", page, display);

    public void addoption() {

    }

    public ArrayList<EmpEventObject> getEmpEvent(String srchBgnDt, String srchEndDt,
    String keyword, String areaCd) { // 채용행사 목록
        String url2;
        url2 = url + String.format("&srchBgnDt=%s&srchEndDt=%s&keyword=%s&areaCd=%s",
        srchBgnDt, srchEndDt, keyword, areaCd);
        ArrayList<EmpEventObject> empevents = new ArrayList<EmpEventObject>();
        EmpEventObject empevent = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url2);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("empEvent");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                empevent = new EmpEventObject();

                Element eElement = (Element) nNode;

                empevent.setAreaCd((GetTagValue.getTagValue("areaCd", eElement)));
                empevent.setArea((GetTagValue.getTagValue("area", eElement)));
                empevent.setEventNo((GetTagValue.getTagValue("eventNo", eElement)));
                empevent.setEventNm((GetTagValue.getTagValue("eventNm", eElement)));
                empevent.setEventTerm((GetTagValue.getTagValue("eventTerm", eElement)));
                empevent.setStartDt((GetTagValue.getTagValue("startDt", eElement)));

                empevents.add(empevent);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return empevents;

    }

    public int getEmpEventNum() { // 채용행사 토탈 갯수
        int number = 0;
        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("empEventList");
            EmpEventObject empevent = new EmpEventObject();
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);

                Element eElement = (Element) nNode;

                number = Integer.parseInt(GetTagValue.getTagValue("total", eElement));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return number;

    }

    public ArrayList<EmpEventDtlObject> getEmpEventdetail(String areaCd, String eventNo) { // 채용행사 상세

        String addurl = apiinfo.empEventApiurl("D", page, display);
        String detailurl = addurl + String.format("&areaCd=%s&eventNo=%s", areaCd, eventNo);

        ArrayList<EmpEventDtlObject> empeventdtls = new ArrayList<EmpEventDtlObject>();
        EmpEventDtlObject empeventdtl = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(detailurl);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("empEventDtl");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                empeventdtl = new EmpEventDtlObject();

                Element eElement = (Element) nNode;

                empeventdtl.setEventNm((GetTagValue.getTagValue("eventNm", eElement)));
                empeventdtl.setEventTerm((GetTagValue.getTagValue("eventTerm", eElement)));
                empeventdtl.setJoinCoWantedInfo((GetTagValue.getTagValue("joinCoWantedInfo", eElement)));
                empeventdtl.setSubMatter((GetTagValue.getTagValue("subMatter", eElement)));
                empeventdtl.setEventPlc((GetTagValue.getTagValue("eventPlc", eElement)));
                empeventdtl.setInqTelNo((GetTagValue.getTagValue("inqTelNo", eElement)));
                empeventdtl.setFax((GetTagValue.getTagValue("fax", eElement)));
                empeventdtl.setCharger((GetTagValue.getTagValue("charger", eElement)));
                empeventdtl.setEmail((GetTagValue.getTagValue("email", eElement)));
                empeventdtl.setVisitPath((GetTagValue.getTagValue("visitPath", eElement)));

                empeventdtls.add(empeventdtl);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return empeventdtls;

    }
}
