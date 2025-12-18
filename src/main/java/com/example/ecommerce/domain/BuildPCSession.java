package com.example.ecommerce.domain;

import java.io.Serializable;

public class BuildPCSession implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long cpuId;
    private Long mainboardId;
    private Long ramId;
    private Long ssdId;
    private Long hddId;
    private Long vgaId;
    private Long psuId;
    private Long caseId;

    public Long getCpuId() {
        return cpuId;
    }

    public void setCpuId(Long cpuId) {
        this.cpuId = cpuId;
    }

    public Long getMainboardId() {
        return mainboardId;
    }

    public void setMainboardId(Long mainboardId) {
        this.mainboardId = mainboardId;
    }

    public Long getRamId() {
        return ramId;
    }

    public void setRamId(Long ramId) {
        this.ramId = ramId;
    }

    public Long getSsdId() {
        return ssdId;
    }

    public void setSsdId(Long ssdId) {
        this.ssdId = ssdId;
    }

    public Long getHddId() {
        return hddId;
    }

    public void setHddId(Long hddId) {
        this.hddId = hddId;
    }

    public Long getVgaId() {
        return vgaId;
    }

    public void setVgaId(Long vgaId) {
        this.vgaId = vgaId;
    }

    public Long getPsuId() {
        return psuId;
    }

    public void setPsuId(Long psuId) {
        this.psuId = psuId;
    }

    public Long getCaseId() {
        return caseId;
    }

    public void setCaseId(Long caseId) {
        this.caseId = caseId;
    }

}
