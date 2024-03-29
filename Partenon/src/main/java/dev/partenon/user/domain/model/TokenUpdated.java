package dev.partenon.user.domain.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class TokenUpdated {
    private String accessToken;
    private String refreshToken;
    private String museumId;
}
