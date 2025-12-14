package com.example.ecommerce.domain.dto;

import com.example.ecommerce.domain.Product;

public class PCBuildDTO {

    private Product cpu;
    private Product mainboard;
    private Product ram;
    private Product hdd;
    private Product ssd;
    private Product vga;
    private Product psu;
    private Product casePC;

    public long getTotalPrice() {
        long total = 0;
        if (cpu != null)
            total += cpu.getPrice();
        if (mainboard != null)
            total += mainboard.getPrice();
        // ...
        return total;
    }

    public Product getCpu() {
        return cpu;
    }

    public void setCpu(Product cpu) {
        this.cpu = cpu;
    }

    public Product getMainboard() {
        return mainboard;
    }

    public void setMainboard(Product mainboard) {
        this.mainboard = mainboard;
    }

    public Product getRam() {
        return ram;
    }

    public void setRam(Product ram) {
        this.ram = ram;
    }

    public Product getHdd() {
        return hdd;
    }

    public void setHdd(Product hdd) {
        this.hdd = hdd;
    }

    public Product getSsd() {
        return ssd;
    }

    public void setSsd(Product ssd) {
        this.ssd = ssd;
    }

    public Product getVga() {
        return vga;
    }

    public void setVga(Product vga) {
        this.vga = vga;
    }

    public Product getPsu() {
        return psu;
    }

    public void setPsu(Product psu) {
        this.psu = psu;
    }

    public Product getCasePC() {
        return casePC;
    }

    public void setCasePC(Product casePC) {
        this.casePC = casePC;
    }

}
