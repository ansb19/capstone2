
package xml;

public class ApiInfo {
    private String certkey = "WNLFG28XCRV9OZ3BXENIY2VR1HK"; // 인증번호

   
   /*
    * 요청 파라미터 관련은 
    *  https://openapi.work.go.kr/opi/opi/opia/wantedApiListVw.do 에 들어가서 확인
    */


    //공통 코드 api
    public String CommoncodeApiurl(int commontype) { 
        String commonurl = String.format("http://openapi.work.go.kr/opi/commonCode/commonCode.do?returnType=XML&target=CMCD&authKey=%s&dtlGb=%d"
        , this.certkey, commontype);
        return commonurl;
    }

    //채용정보 api
    public String WantedApiurl(String type, int startpage, int display) { 
        String wantedapi = String.format("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do?authKey=%s&callTp=%s&returnType=XML&startPage=%d&display=%d"
        , this.certkey, type, startpage, display);
        return wantedapi;
    }
    
    //채용상세정보 api
    public String WantedDtlApiurl(String type, String no) { 
        String wantedapi = String.format("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do?authKey=%s&callTp=%s&returnType=XML&wantedAuthNo=%s&infoSvc=VALIDATION"
        , this.certkey, type, no);
        return wantedapi;
    }

    // 채용행사 api
    public String empEventApiurl(String type, int startpage, int display){
        String empeventapi = String.format("http://openapi.work.go.kr/opi/opi/opia/empEventApi.do?authKey=%s&returnType=XML&callTp=%s&startPage=%d&display=%d"
        , this.certkey, type, startpage, display);
        return empeventapi;
    }
    

    

}
