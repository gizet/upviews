package com.program.upviews.configuration;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "reset.password")
public class ForgotPasswordTokenConfiguration {

    private Integer tokenExpirationTime;
}
