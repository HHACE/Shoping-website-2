/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author namti
 */
public class Specification {
        private String cpu;
        private String gpu;
        private String ram;
        private String storage;
        private String screen;
        private String pin;
        private String weight;
        private String os;

    public Specification() {
    }

    public Specification(String cpu, String gpu, String ram, String storage, String screen, String pin, String weight, String os) {
        this.cpu = cpu;
        this.gpu = gpu;
        this.ram = ram;
        this.storage = storage;
        this.screen = screen;
        this.pin = pin;
        this.weight = weight;
        this.os = os;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getScreen() {
        return screen;
    }

    public void setScreen(String screen) {
        this.screen = screen;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    @Override
    public String toString() {
        return "Specification{" + "cpu=" + cpu + ", gpu=" + gpu + ", ram=" + ram + ", storage=" + storage + ", screen=" + screen + ", pin=" + pin + ", weight=" + weight + ", os=" + os + '}';
    }
}
