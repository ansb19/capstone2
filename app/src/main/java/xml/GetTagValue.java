/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package xml;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 *
 * @author dhkdw
 */
public class GetTagValue { // tagvalue 가져오는 클래스
    // tag값의 정보를 가져오는 함수
    public static String getTagValue(String tag, Element eElement) {

        // 결과를 저장할 result 변수 선언
        String result = "";

        NodeList nlList = eElement.getElementsByTagName(tag);
        if (nlList != null && nlList.getLength() > 0) {
            nlList = nlList.item(0).getChildNodes();
            if (nlList != null && nlList.getLength() > 0) {
                result = nlList.item(0).getTextContent();
            }
        }

        return result;
    }

    // tag값의 정보를 가져오는 함수
    public static String getTagValue(String tag, String childTag, Element eElement) {

        // 결과를 저장할 result 변수 선언
        String result = "";

        NodeList nlList = eElement.getElementsByTagName(tag);
        if (nlList != null && nlList.getLength() > 0) {
            for (int i = 0; i < nlList.getLength(); i++) {
                Element element = (Element) nlList.item(i);
                NodeList childList = element.getElementsByTagName(childTag);
                if (childList != null && childList.getLength() > 0) {
                    result += childList.item(0).getTextContent() + " ";
                }
            }
        }

        return result;
    }
}
