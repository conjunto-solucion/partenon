package dev.partenon.museumcontext.banner.infrastructure;

import dev.partenon.global.domain.abstractcomponents.command.CommandBus;
import dev.partenon.museumcontext.banner.doamin.SaveBannerCommand;
import dev.partenon.museumcontext.banner.doamin.BannerRestModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;

@RestController
@RequestMapping("/api/museums")
public class SaveBannerResource {
    private final CommandBus commandBus;

    @Autowired
    public SaveBannerResource(CommandBus commandBus){
        this.commandBus = commandBus;
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/banners")
    public HttpEntity<Void> saveBanners(@RequestBody @Valid BannerRestModel banner,
                                        @RequestParam("key") String museumId) throws Exception{
        var command = SaveBannerCommand.builder()
                .museumBanner(banner.getBanner())
                .museumId(Long.valueOf(museumId))
                .build();
        commandBus.handle(command);
        return ResponseEntity.created(
                        new URI("http://localhost:8080/api/museums/banners&key=".concat(museumId)))
                .build();
    }
}
