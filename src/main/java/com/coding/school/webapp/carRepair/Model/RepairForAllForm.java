package com.coding.school.webapp.carRepair.Model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

public class RepairForAllForm {

    private static final String COST_PATTERN = "[0-9]+([,.][0-9]{1,2})?";

    private String ID;
//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime dateTime;

    @NotNull(message = "{register.stage.null}")
    private String repairStage;

    @NotNull(message = "{register.repairType.null}")
    private String repairType;

    private String plateNumber;

    private List<PartsForm> partsForms;

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getRepairStage() {
        return repairStage;
    }

    public void setRepairStage(String repairStage) {
        this.repairStage = repairStage;
    }

    public String getRepairType() {
        return repairType;
    }

    public void setRepairType(String repairType) {
        this.repairType = repairType;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public List<PartsForm> getPartsForms() {
        return partsForms;
    }

    public void setPartsForms(List<PartsForm> partsForms) {
        this.partsForms = partsForms;
    }
}