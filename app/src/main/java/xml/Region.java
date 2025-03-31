package xml;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Region {

    ApiInfo apiinfo = new ApiInfo();
    // 본인이 받은 api키를 추가

    public ArrayList<RegionObject> getRegions(boolean isSuperRegion) {
        ArrayList<RegionObject> regions = new ArrayList<RegionObject>();
        RegionObject region = null;
    
        try {
            ApiInfo apiinfo = new ApiInfo();
            String url = apiinfo.CommoncodeApiurl(1);
    
            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            Document doc = dBuilder.parse(url);
    
            doc.getDocumentElement().normalize();
    
            String tagName = isSuperRegion ? "oneDepth" : "twoDepth";
            NodeList nList = doc.getElementsByTagName(tagName);
    
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                region = new RegionObject();
    
                Element eElement = (Element) nNode;
    
                if (isSuperRegion) {
                    region.setSuperRegionCd(GetTagValue.getTagValue("regionCd", eElement));
                    region.setSuperRegionNm(GetTagValue.getTagValue("regionNm", eElement));
                } else {
                    region.setRegionCd(GetTagValue.getTagValue("regionCd", eElement));
                    region.setRegionNm(GetTagValue.getTagValue("regionNm", eElement));
                    region.setSuperCd(GetTagValue.getTagValue("superCd", eElement));
                }
    
                regions.add(region);
            }
    
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return regions;
    }
    
}
