package dev.partenon.museumcontext.tours.infrastructure;

import dev.partenon.global.domain.abstractcomponents.query.QueryBus;
import dev.partenon.museumcontext.tours.domain.GetTourByMuseumQuery;
import dev.partenon.museumcontext.tours.domain.entity.MuseumTour;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/museums")
public class GetToursByMuseumResource {
    private final QueryBus queryBus;

    @Autowired
    public GetToursByMuseumResource(QueryBus queryBus) {
        this.queryBus = queryBus;
    }

    @GetMapping("/tours")
    public HttpEntity<List<MuseumTour>> getMuseum(@RequestParam("key") String museumId)
            throws Exception {
        var query = GetTourByMuseumQuery.builder()
                .museumId(Long.parseLong(museumId))
                .build();

        var response = queryBus.handle(query);

        return ResponseEntity.ok(response);
    }
}
