package dev.partenon.museum.domain.commands;

import dev.partenon.global.domain.abstractcomponents.command.Command;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Data
@Builder
public class SaveBuildingPlanCommand extends Command {
    public String buildingPlan;
    public Long museumId;
}