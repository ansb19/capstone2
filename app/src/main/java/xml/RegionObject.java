/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package xml;

/**
 *
 * @author dhkdw
 */
public class RegionObject {
    private String regionCd, regionNm, superCd; // regionCd 지역코드 regionNm 지역명 superCd 상위단계 지역코드
    private String superRegionNm,superRegionCd;
    public String getRegionCd() {
        return regionCd;
    }

    public String getSuperRegionNm() {
        return this.superRegionNm;
    }

    public void setSuperRegionNm(String superRegionNm) {
        this.superRegionNm = superRegionNm;
    }

    public String getSuperRegionCd() {
        return this.superRegionCd;
    }

    public void setSuperRegionCd(String superRegionCd) {
        this.superRegionCd = superRegionCd;
    }

    public void setRegionCd(String regionCd) {
        this.regionCd = regionCd;
    }

    public String getRegionNm() {
        return regionNm;
    }

    public void setRegionNm(String regionNm) {
        this.regionNm = regionNm;
    }

    public String getSuperCd() {
        return superCd;
    }

    public void setSuperCd(String superCd) {
        this.superCd = superCd;
    }
}
