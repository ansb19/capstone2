package xml;

import java.util.ArrayList;

import dbconn.*;

public class main {
    public static void main(String[] args) {
        /* 
        //  지역 코드 xml 쓰는 거
        Region xml = new Region();
        ArrayList<RegionObject> regions = xml.getRegion();

        for(RegionObject region : regions){

            
            System.out.println(region.getRegionNm());
            System.out.println(region.getRegionCd());
            System.out.println(region.getSuperCd());
            
            
        }
        
         
        ArrayList<RegionObject> superregions = xml.getSuperRegion();

        for(RegionObject superregion : superregions){

            
            System.out.println(superregion.getSuperRegionCd());
            System.out.println(superregion.getSuperRegionNm());
            
        }
        */


        JobInfo jobxml = new JobInfo();
        JobInfoDtlObject jobdtl = jobxml.getJobInfoCorp("K172112306070112");
        System.out.println(jobdtl.getReceiptCloseDt());
        
    }
     
}
