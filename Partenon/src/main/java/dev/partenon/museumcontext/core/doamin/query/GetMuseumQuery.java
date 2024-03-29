package dev.partenon.museumcontext.core.doamin.query;

import dev.partenon.global.domain.abstractcomponents.query.Query;
import dev.partenon.museumcontext.core.doamin.Museum;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GetMuseumQuery extends Query<Museum> {
    private Long museumId;
}
