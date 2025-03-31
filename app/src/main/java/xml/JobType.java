package xml;

import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class JobType {

    ApiInfo apiinfo = new ApiInfo();
    // 본인이 받은 api키를 추가

    String url = apiinfo.CommoncodeApiurl(2);



    public ArrayList<JobTypeObject> getOneJobType() { // 1단계(최상위) 직종코드

        ArrayList<JobTypeObject> jobtypes = new ArrayList<JobTypeObject>();
        JobTypeObject jobtype = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("oneDepth");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                jobtype = new JobTypeObject();

                Element eElement = (Element) nNode;

                jobtype.setOnejobsCd((GetTagValue.getTagValue("jobsCd", eElement)));
                jobtype.setOnejobsNm(GetTagValue.getTagValue("jobsNm", eElement));
                

                jobtypes.add(jobtype);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobtypes;

    }

    public ArrayList<JobTypeObject> getTwoJobType() { // 2단계 상위 직종코드

        ArrayList<JobTypeObject> jobtypes = new ArrayList<JobTypeObject>();
        JobTypeObject jobtype = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList2 = doc.getElementsByTagName("twoDepth");

            for (int temp = 0; temp < nList2.getLength(); temp++) {
                Node nNode = nList2.item(temp);
                jobtype = new JobTypeObject();

                Element eElement = (Element) nNode;

                jobtype.setTwojobsCd((GetTagValue.getTagValue("jobsCd", eElement)));
                jobtype.setTwojobsNm(GetTagValue.getTagValue("jobsNm", eElement));
                jobtype.setTwosuperCd(GetTagValue.getTagValue("superCd", eElement));

                jobtypes.add(jobtype);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobtypes;

    }

    public ArrayList<JobTypeObject> getThreeJobType() { // 3단계 직종코드

        ArrayList<JobTypeObject> jobtypes = new ArrayList<JobTypeObject>();
        JobTypeObject jobtype = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList2 = doc.getElementsByTagName("threeDepth");

            for (int temp = 0; temp < nList2.getLength(); temp++) {
                Node nNode = nList2.item(temp);
                jobtype = new JobTypeObject();

                Element eElement = (Element) nNode;

                jobtype.setThreejobsCd((GetTagValue.getTagValue("jobsCd", eElement)));
                jobtype.setThreejobsNm(GetTagValue.getTagValue("jobsNm", eElement));
                jobtype.setThreesuperCd(GetTagValue.getTagValue("superCd", eElement));

                jobtypes.add(jobtype);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobtypes;

    }
}
