package com.example.ecommerce.domain;

public class BuildPCSession {

    private Long cpuId;
    private Long mainboardId;
    private Long ramId;

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

}
