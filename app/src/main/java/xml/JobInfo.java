package xml;

import java.util.ArrayList;
import java.util.List;
import java.lang.Integer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class JobInfo {

    ApiInfo apiinfo = new ApiInfo();
    // 본인이 받은 api키를 추가

    public ArrayList<JobInfoObject> getJobInfo(int startpage, int display,
    String region, String occupation, String salTp, String minPay, String maxPay,
    String education, String career, String minCareerM, String maxCareerMm, String pref,
    String subway, String empTp, String termContractMmcnt, String holidayTp, String coTp,
    String busino, String dtlSmlgntYn, String workStudyJoinYn, String smlgntCoClcd,
    String workerCnt, String welfare, String certLic, String regDate, String keyword,
    String untilEmpWantedYn, String minWantedAuthDt, String maxWantedAuthDt, String empTpGb,
    String sortOrderBy, String major, String foreignLanguage, String comPreferential,
    String pfPreferential, String workHrCd) { // 채용정보 목록 및 검색

        String url = apiinfo.WantedApiurl("L", startpage, display);
        String url2 = url 
        + String.format("&region=%s&occupation=%s&salTp=%s&minPay=%s&maxPay=%s"
        , region, occupation, salTp, minPay, maxPay)
        + String.format("&education=%s&career=%s&minCareerM=%s&maxCareerMm=%s&pref=%s"
        , education, career, minCareerM, maxCareerMm, pref)
        + String.format("&subway=%s&empTp=%s&termContractMmcnt=%s&holidayTp=%s&coTp=%s"
        , subway, empTp, termContractMmcnt, holidayTp, coTp)
        + String.format("&busino=%s&dtlSmlgntYn=%s&workStudyJoinYn=%s&smlgntCoClcd=%s&workerCnt=%s"
        , busino, dtlSmlgntYn, workStudyJoinYn, smlgntCoClcd, workerCnt)
        + String.format("&welfare=%s&certLic=%s&regDate=%s&keyword=%s&untilEmpWantedYn=%s"
        , welfare, certLic, regDate, keyword, untilEmpWantedYn)
        + String.format("&minWantedAuthDt=%s&maxWantedAuthDt=%s&empTpGb=%s&sortOrderBy=%s&major=%s"
        , minWantedAuthDt, maxWantedAuthDt, empTpGb, sortOrderBy, major)
        + String.format("&foreignLanguage=%s&comPreferential=%s&pfPreferential=%s&workHrCd=%s"
        , foreignLanguage, comPreferential, pfPreferential, workHrCd);

        ArrayList<JobInfoObject> jobinfos = new ArrayList<JobInfoObject>();
        JobInfoObject jobinfo = null;

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url2);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("wanted");
            
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                jobinfo = new JobInfoObject();

                Element eElement = (Element) nNode;

                jobinfo.setWantedAuthNo((GetTagValue.getTagValue("wantedAuthNo", eElement)));
                jobinfo.setCompany(GetTagValue.getTagValue("company", eElement));
                jobinfo.setTitle(GetTagValue.getTagValue("title", eElement));
                jobinfo.setSalTpNm(GetTagValue.getTagValue("salTpNm", eElement));
                jobinfo.setSal(GetTagValue.getTagValue("sal", eElement));
                jobinfo.setRegion(GetTagValue.getTagValue("region", eElement));
                jobinfo.setHolidayTpNm(GetTagValue.getTagValue("holidayTpNm", eElement));
                jobinfo.setMinEdubg(GetTagValue.getTagValue("minEdubg", eElement));
                jobinfo.setMaxEdubg(GetTagValue.getTagValue("maxEdubg", eElement));
                jobinfo.setCareer(GetTagValue.getTagValue("career", eElement));
                jobinfo.setRegDt(GetTagValue.getTagValue("regDt", eElement));
                jobinfo.setCloseDt(GetTagValue.getTagValue("closeDt", eElement));
                jobinfo.setZipCd(GetTagValue.getTagValue("zipCd", eElement));
                jobinfo.setStrtnmCd(GetTagValue.getTagValue("strtnmCd", eElement));
                jobinfo.setDetailAddr(GetTagValue.getTagValue("detailAddr", eElement));
                jobinfo.setEmpTpCd(GetTagValue.getTagValue("empTpCd", eElement));
                jobinfo.setJobsCd(GetTagValue.getTagValue("jobsCd", eElement));
                jobinfo.setSmodifyDtm(GetTagValue.getTagValue("smodifyDtm", eElement));
                jobinfo.setPrefCd(GetTagValue.getTagValue("prefCd", eElement));

                jobinfos.add(jobinfo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobinfos;

    }

    public int getJobInfoNum() { // 채용정보 토탈 갯수
        int number = 0;
        String url = apiinfo.WantedApiurl("L", 1, 10);
        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();

            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("wantedRoot");
            JobInfoObject jobinfo = new JobInfoObject();
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

    public JobInfoDtlObject getJobInfoCorp(String no) { // 채용정보 세부정보
        JobInfoDtlObject jobinfodtl = new JobInfoDtlObject();
        String url = apiinfo.WantedDtlApiurl("D", no);

        try {
            // parsing할 url 지정(API 키 포함해서)

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);

            // 제일 첫번째 태그
            doc.getDocumentElement().normalize();
            // 파싱할 tag
            NodeList nList = doc.getElementsByTagName("corpInfo");
            
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setCorpNm((GetTagValue.getTagValue("corpNm", eElement)));
                jobinfodtl.setReperNm(GetTagValue.getTagValue("reperNm", eElement));
                jobinfodtl.setTotPsncnt(GetTagValue.getTagValue("totPsncnt", eElement));
                jobinfodtl.setCapitalAmt(GetTagValue.getTagValue("capitalAmt", eElement));
                jobinfodtl.setYrSalesAmt(GetTagValue.getTagValue("yrSalesAmt", eElement));
                jobinfodtl.setIndTpCdNm(GetTagValue.getTagValue("indTpCdNm", eElement));
                jobinfodtl.setBusiCont(GetTagValue.getTagValue("busiCont", eElement));
                jobinfodtl.setCorpAddr(GetTagValue.getTagValue("corpAddr", eElement));
                jobinfodtl.setHomePg(GetTagValue.getTagValue("homePg", eElement));
                jobinfodtl.setBusiSize(GetTagValue.getTagValue("busiSize", eElement));

                
            }

            doc.getDocumentElement().normalize();
            NodeList nList2 = doc.getElementsByTagName("wantedInfo");
            
            for (int temp = 0; temp < nList2.getLength(); temp++) {
                Node nNode = nList2.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setJobsNm(GetTagValue.getTagValue("jobsNm", eElement));
                jobinfodtl.setWantedTitle(GetTagValue.getTagValue("wantedTitle", eElement));
                jobinfodtl.setRelJobsNm(GetTagValue.getTagValue("relJobsNm", eElement));
                jobinfodtl.setJobCont(GetTagValue.getTagValue("jobCont", eElement));
                jobinfodtl.setReceiptCloseDt(GetTagValue.getTagValue("receiptCloseDt", eElement));
                jobinfodtl.setCollectPsncnt(GetTagValue.getTagValue("collectPsncnt", eElement));
                jobinfodtl.setSalTpNm(GetTagValue.getTagValue("salTpNm", eElement));
                jobinfodtl.setEnterTpNm(GetTagValue.getTagValue("enterTpNm", eElement));
                jobinfodtl.setEduNm(GetTagValue.getTagValue("eduNm", eElement));
                jobinfodtl.setForLang(GetTagValue.getTagValue("forLang", eElement));
                jobinfodtl.setMajor(GetTagValue.getTagValue("major", eElement));
                jobinfodtl.setCertificate(GetTagValue.getTagValue("certificate", eElement));
                jobinfodtl.setMltsvcExcHope(GetTagValue.getTagValue("mltsvcExcHope", eElement));
                jobinfodtl.setCompAbl(GetTagValue.getTagValue("compAbl", eElement));
                jobinfodtl.setPfCond(GetTagValue.getTagValue("pfCond", eElement));
                jobinfodtl.setEtcPfCond(GetTagValue.getTagValue("etcPfCond", eElement));
                jobinfodtl.setSelMthd(GetTagValue.getTagValue("selMthd", eElement));
                jobinfodtl.setRcptMthd(GetTagValue.getTagValue("rcptMthd", eElement));
                jobinfodtl.setSubmitDoc(GetTagValue.getTagValue("submitDoc", eElement));
                jobinfodtl.setEtcHopeCont(GetTagValue.getTagValue("etcHopeCont", eElement));
                jobinfodtl.setWorkRegion(GetTagValue.getTagValue("workRegion", eElement));
                jobinfodtl.setNearLine(GetTagValue.getTagValue("nearLine", eElement));
                jobinfodtl.setWorkdayWorkhrCont(GetTagValue.getTagValue("workdayWorkhrCont", eElement));
                jobinfodtl.setFourIns(GetTagValue.getTagValue("fourIns", eElement));
                jobinfodtl.setRetirepay(GetTagValue.getTagValue("retirepay", eElement));
                jobinfodtl.setEtcWelfare(GetTagValue.getTagValue("etcWelfare", eElement));
                jobinfodtl.setDisableCvntl(GetTagValue.getTagValue("disableCvntl", eElement));

                jobinfodtl.setAttachFileInfo(GetTagValue.getTagValue("attachFileInfo", eElement));
                jobinfodtl.setCorpAttachList(GetTagValue.getTagValue("corpAttachList", eElement));
                jobinfodtl.setKeywordList(GetTagValue.getTagValue("keywordList", eElement));

                jobinfodtl.setDtlRecrContUrl(GetTagValue.getTagValue("dtlRecrContUrl", eElement));
                jobinfodtl.setJobsCd(GetTagValue.getTagValue("jobsCd", eElement));
                jobinfodtl.setMinEdubgIcd(GetTagValue.getTagValue("minEdubgIcd", eElement));
                jobinfodtl.setMaxEdubgIcd(GetTagValue.getTagValue("maxEdubgIcd", eElement));
                jobinfodtl.setRegionCd(GetTagValue.getTagValue("regionCd", eElement));
                jobinfodtl.setEmpTpCd(GetTagValue.getTagValue("empTpCd", eElement));
                jobinfodtl.setEnterTpCd(GetTagValue.getTagValue("enterTpCd", eElement));
                jobinfodtl.setSalTpCd(GetTagValue.getTagValue("salTpCd", eElement));
                jobinfodtl.setStaAreaRegionCd(GetTagValue.getTagValue("staAreaRegionCd", eElement));
                jobinfodtl.setLineCd(GetTagValue.getTagValue("lineCd", eElement));
                jobinfodtl.setStaNmCd(GetTagValue.getTagValue("staNmCd", eElement));
                jobinfodtl.setExitNoCd(GetTagValue.getTagValue("exitNoCd", eElement));
                jobinfodtl.setWalkDistCd(GetTagValue.getTagValue("walkDistCd", eElement));
            }

            doc.getDocumentElement().normalize();
            NodeList nList3 = doc.getElementsByTagName("attachFileInfo");
            
            for (int temp = 0; temp < nList3.getLength(); temp++) {
                Node nNode = nList3.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setAattachFileUrl(GetTagValue.getTagValue("AattachFileUrl", eElement));
                
            }

            doc.getDocumentElement().normalize();
            NodeList nList4 = doc.getElementsByTagName("corpAttachList");
            
            for (int temp = 0; temp < nList4.getLength(); temp++) {
                Node nNode = nList4.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setCattachFileUrl(GetTagValue.getTagValue("CattachFileUrl", eElement));
                
            }

            doc.getDocumentElement().normalize();
            NodeList nList5 = doc.getElementsByTagName("keywordList");
            
            for (int temp = 0; temp < nList5.getLength(); temp++) {
                Node nNode = nList5.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setSrchKeywordNm(GetTagValue.getTagValue("srchKeywordNm", eElement));
                
            }

            doc.getDocumentElement().normalize();
            NodeList nList6 = doc.getElementsByTagName("empchargeInfo");
            
            for (int temp = 0; temp < nList6.getLength(); temp++) {
                Node nNode = nList6.item(temp);
                

                Element eElement = (Element) nNode;

                jobinfodtl.setEmpChargerDpt(GetTagValue.getTagValue("empChargerDpt", eElement));
                jobinfodtl.setContactTelno(GetTagValue.getTagValue("contactTelno", eElement));
                jobinfodtl.setChargerFaxNo(GetTagValue.getTagValue("chargerFaxNo", eElement));
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobinfodtl;

    }

    
}
