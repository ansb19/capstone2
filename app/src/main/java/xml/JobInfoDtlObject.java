package xml;

public class JobInfoDtlObject {
    private String corpNm, reperNm, totPsncnt, capitalAmt, yrSalesAmt, indTpCdNm, busiCont,
    corpAddr, homePg, busiSize; //corpInfo 대1

    private String jobsNm, wantedTitle, relJobsNm, jobCont, receiptCloseDt,
    empTpNm, collectPsncnt, salTpNm, enterTpNm, eduNm, forLang, major,
    certificate, mltsvcExcHope, compAbl, pfCond, etcPfCond, selMthd, rcptMthd,
    submitDoc, etcHopeCont, workRegion, nearLine, workdayWorkhrCont, fourIns,
    retirepay, etcWelfare, disableCvntl, attachFileInfo, corpAttachList, keywordList;
    
    private String AattachFileUrl; // attachFileInfo 중1
    private String CattachFileUrl; // corpAttachList 중2
    private String srchKeywordNm; // keywordList 중3

    private String dtlRecrContUrl, jobsCd, minEdubgIcd, maxEdubgIcd,
    regionCd, empTpCd, enterTpCd, salTpCd, staAreaRegionCd, lineCd, staNmCd,
    exitNoCd, walkDistCd; //wantedInfo 대2

    private String empChargerDpt, contactTelno, chargerFaxNo; //empchargeInfo 대3

    public String getCorpNm() {
        return this.corpNm;
    }

    public void setCorpNm(String corpNm) {
        this.corpNm = corpNm;
    }

    public String getReperNm() {
        return this.reperNm;
    }

    public void setReperNm(String reperNm) {
        this.reperNm = reperNm;
    }

    public String getTotPsncnt() {
        return this.totPsncnt;
    }

    public void setTotPsncnt(String totPsncnt) {
        this.totPsncnt = totPsncnt;
    }

    public String getCapitalAmt() {
        return this.capitalAmt;
    }

    public void setCapitalAmt(String capitalAmt) {
        this.capitalAmt = capitalAmt;
    }

    public String getYrSalesAmt() {
        return this.yrSalesAmt;
    }

    public void setYrSalesAmt(String yrSalesAmt) {
        this.yrSalesAmt = yrSalesAmt;
    }

    public String getIndTpCdNm() {
        return this.indTpCdNm;
    }

    public void setIndTpCdNm(String indTpCdNm) {
        this.indTpCdNm = indTpCdNm;
    }

    public String getBusiCont() {
        return this.busiCont;
    }

    public void setBusiCont(String busiCont) {
        this.busiCont = busiCont;
    }

    public String getCorpAddr() {
        return this.corpAddr;
    }

    public void setCorpAddr(String corpAddr) {
        this.corpAddr = corpAddr;
    }

    public String getHomePg() {
        return this.homePg;
    }

    public void setHomePg(String homePg) {
        this.homePg = homePg;
    }

    public String getBusiSize() {
        return this.busiSize;
    }

    public void setBusiSize(String busiSize) {
        this.busiSize = busiSize;
    }

    public String getJobsNm() {
        return this.jobsNm;
    }

    public void setJobsNm(String jobsNm) {
        this.jobsNm = jobsNm;
    }

    public String getWantedTitle() {
        return this.wantedTitle;
    }

    public void setWantedTitle(String wantedTitle) {
        this.wantedTitle = wantedTitle;
    }

    public String getRelJobsNm() {
        return this.relJobsNm;
    }

    public void setRelJobsNm(String relJobsNm) {
        this.relJobsNm = relJobsNm;
    }

    public String getJobCont() {
        return this.jobCont;
    }

    public void setJobCont(String jobCont) {
        this.jobCont = jobCont;
    }

    public String getReceiptCloseDt() {
        return this.receiptCloseDt;
    }

    public void setReceiptCloseDt(String receiptCloseDt) {
        this.receiptCloseDt = receiptCloseDt;
    }

    public String getEmpTpNm() {
        return this.empTpNm;
    }

    public void setEmpTpNm(String empTpNm) {
        this.empTpNm = empTpNm;
    }

    public String getCollectPsncnt() {
        return this.collectPsncnt;
    }

    public void setCollectPsncnt(String collectPsncnt) {
        this.collectPsncnt = collectPsncnt;
    }

    public String getSalTpNm() {
        return this.salTpNm;
    }

    public void setSalTpNm(String salTpNm) {
        this.salTpNm = salTpNm;
    }

    public String getEnterTpNm() {
        return this.enterTpNm;
    }

    public void setEnterTpNm(String enterTpNm) {
        this.enterTpNm = enterTpNm;
    }

    public String getEduNm() {
        return this.eduNm;
    }

    public void setEduNm(String eduNm) {
        this.eduNm = eduNm;
    }

    public String getForLang() {
        return this.forLang;
    }

    public void setForLang(String forLang) {
        this.forLang = forLang;
    }

    public String getMajor() {
        return this.major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCertificate() {
        return this.certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getMltsvcExcHope() {
        return this.mltsvcExcHope;
    }

    public void setMltsvcExcHope(String mltsvcExcHope) {
        this.mltsvcExcHope = mltsvcExcHope;
    }

    public String getCompAbl() {
        return this.compAbl;
    }

    public void setCompAbl(String compAbl) {
        this.compAbl = compAbl;
    }

    public String getPfCond() {
        return this.pfCond;
    }

    public void setPfCond(String pfCond) {
        this.pfCond = pfCond;
    }

    public String getEtcPfCond() {
        return this.etcPfCond;
    }

    public void setEtcPfCond(String etcPfCond) {
        this.etcPfCond = etcPfCond;
    }

    public String getSelMthd() {
        return this.selMthd;
    }

    public void setSelMthd(String selMthd) {
        this.selMthd = selMthd;
    }

    public String getRcptMthd() {
        return this.rcptMthd;
    }

    public void setRcptMthd(String rcptMthd) {
        this.rcptMthd = rcptMthd;
    }

    public String getSubmitDoc() {
        return this.submitDoc;
    }

    public void setSubmitDoc(String submitDoc) {
        this.submitDoc = submitDoc;
    }

    public String getEtcHopeCont() {
        return this.etcHopeCont;
    }

    public void setEtcHopeCont(String etcHopeCont) {
        this.etcHopeCont = etcHopeCont;
    }

    public String getWorkRegion() {
        return this.workRegion;
    }

    public void setWorkRegion(String workRegion) {
        this.workRegion = workRegion;
    }

    public String getNearLine() {
        return this.nearLine;
    }

    public void setNearLine(String nearLine) {
        this.nearLine = nearLine;
    }

    public String getWorkdayWorkhrCont() {
        return this.workdayWorkhrCont;
    }

    public void setWorkdayWorkhrCont(String workdayWorkhrCont) {
        this.workdayWorkhrCont = workdayWorkhrCont;
    }

    public String getFourIns() {
        return this.fourIns;
    }

    public void setFourIns(String fourIns) {
        this.fourIns = fourIns;
    }

    public String getRetirepay() {
        return this.retirepay;
    }

    public void setRetirepay(String retirepay) {
        this.retirepay = retirepay;
    }

    public String getEtcWelfare() {
        return this.etcWelfare;
    }

    public void setEtcWelfare(String etcWelfare) {
        this.etcWelfare = etcWelfare;
    }

    public String getDisableCvntl() {
        return this.disableCvntl;
    }

    public void setDisableCvntl(String disableCvntl) {
        this.disableCvntl = disableCvntl;
    }

    public String getAttachFileInfo() {
        return this.attachFileInfo;
    }

    public void setAttachFileInfo(String attachFileInfo) {
        this.attachFileInfo = attachFileInfo;
    }

    public String getCorpAttachList() {
        return this.corpAttachList;
    }

    public void setCorpAttachList(String corpAttachList) {
        this.corpAttachList = corpAttachList;
    }

    public String getKeywordList() {
        return this.keywordList;
    }

    public void setKeywordList(String keywordList) {
        this.keywordList = keywordList;
    }

    public String getAattachFileUrl() {
        return this.AattachFileUrl;
    }

    public void setAattachFileUrl(String AattachFileUrl) {
        this.AattachFileUrl = AattachFileUrl;
    }

    public String getCattachFileUrl() {
        return this.CattachFileUrl;
    }

    public void setCattachFileUrl(String CattachFileUrl) {
        this.CattachFileUrl = CattachFileUrl;
    }

    public String getSrchKeywordNm() {
        return this.srchKeywordNm;
    }

    public void setSrchKeywordNm(String srchKeywordNm) {
        this.srchKeywordNm = srchKeywordNm;
    }

    public String getDtlRecrContUrl() {
        return this.dtlRecrContUrl;
    }

    public void setDtlRecrContUrl(String dtlRecrContUrl) {
        this.dtlRecrContUrl = dtlRecrContUrl;
    }

    public String getJobsCd() {
        return this.jobsCd;
    }

    public void setJobsCd(String jobsCd) {
        this.jobsCd = jobsCd;
    }

    public String getMinEdubgIcd() {
        return this.minEdubgIcd;
    }

    public void setMinEdubgIcd(String minEdubgIcd) {
        this.minEdubgIcd = minEdubgIcd;
    }

    public String getMaxEdubgIcd() {
        return this.maxEdubgIcd;
    }

    public void setMaxEdubgIcd(String maxEdubgIcd) {
        this.maxEdubgIcd = maxEdubgIcd;
    }

    public String getRegionCd() {
        return this.regionCd;
    }

    public void setRegionCd(String regionCd) {
        this.regionCd = regionCd;
    }

    public String getEmpTpCd() {
        return this.empTpCd;
    }

    public void setEmpTpCd(String empTpCd) {
        this.empTpCd = empTpCd;
    }

    public String getEnterTpCd() {
        return this.enterTpCd;
    }

    public void setEnterTpCd(String enterTpCd) {
        this.enterTpCd = enterTpCd;
    }

    public String getSalTpCd() {
        return this.salTpCd;
    }

    public void setSalTpCd(String salTpCd) {
        this.salTpCd = salTpCd;
    }

    public String getStaAreaRegionCd() {
        return this.staAreaRegionCd;
    }

    public void setStaAreaRegionCd(String staAreaRegionCd) {
        this.staAreaRegionCd = staAreaRegionCd;
    }

    public String getLineCd() {
        return this.lineCd;
    }

    public void setLineCd(String lineCd) {
        this.lineCd = lineCd;
    }

    public String getStaNmCd() {
        return this.staNmCd;
    }

    public void setStaNmCd(String staNmCd) {
        this.staNmCd = staNmCd;
    }

    public String getExitNoCd() {
        return this.exitNoCd;
    }

    public void setExitNoCd(String exitNoCd) {
        this.exitNoCd = exitNoCd;
    }

    public String getWalkDistCd() {
        return this.walkDistCd;
    }

    public void setWalkDistCd(String walkDistCd) {
        this.walkDistCd = walkDistCd;
    }

    public String getEmpChargerDpt() {
        return this.empChargerDpt;
    }

    public void setEmpChargerDpt(String empChargerDpt) {
        this.empChargerDpt = empChargerDpt;
    }

    public String getContactTelno() {
        return this.contactTelno;
    }

    public void setContactTelno(String contactTelno) {
        this.contactTelno = contactTelno;
    }

    public String getChargerFaxNo() {
        return this.chargerFaxNo;
    }

    public void setChargerFaxNo(String chargerFaxNo) {
        this.chargerFaxNo = chargerFaxNo;
    }
   
}
