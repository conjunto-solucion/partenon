package dev.partenon.museumcontext.plan.infrastructure;

import dev.partenon.global.domain.abstractcomponents.command.CommandBus;
import dev.partenon.museumcontext.plan.doamin.SaveBuildingPlanCommand;
import dev.partenon.museumcontext.plan.doamin.BuildingPlanRestModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;

@RestController
@RequestMapping("/api/museums")
public class SaveBuildingPlanResource {
    private final CommandBus commandBus;

    @Autowired
    public SaveBuildingPlanResource(CommandBus commandBus){
        this.commandBus = commandBus;
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/plans")
    public HttpEntity<Void> saveBuildingPlan(@RequestBody @Valid BuildingPlanRestModel buildingPlan,
                                             @RequestParam("key") String museumId) throws Exception{
        var command = SaveBuildingPlanCommand.builder()
                .buildingPlan(buildingPlan.getBuildingPlan())
                .museumId(Long.parseLong(museumId))
                .build();

        commandBus.handle(command);

        return ResponseEntity.created(
                new URI("http://localhost:8080/api/museums/plans&key=".concat(museumId)))
                .build();
    }
}
