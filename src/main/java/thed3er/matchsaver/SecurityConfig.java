package thed3er.matchsaver;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import java.util.List;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
        List<UserDetails> users = List.of(
                User.withUsername("sokoltrebic").password("$2a$10$yzNFyV7.ztg2E25a5CDSkOYPrOzjlPiI.dKCDrzic/ft3ZEFGFS2K").roles("USER").build(),
                User.withUsername("sokolrouchovany").password("$2a$10$Ct.wqKVwdP5fbqFqaPWdaenv0GGlsjsvXv/vAJ3gVe0mAaM3sTFjC").roles("USER").build(),
                User.withUsername("sokolvalec").password("$2a$10$BZdFRMcyTGv52PvT4ifotelvQtrfv.G/AuVByO8cs5275Oret2Rna").roles("USER").build(),
                User.withUsername("sokolnamestnadoslavou").password("$2a$10$8iNWD3OsXdd01H9riZKB0.SIzuyE9Ju7YQM6IzAMoFblQXgKT57Vm").roles("USER").build(),
                User.withUsername("admin").password("$2a$10$EZ7kByj/XHsra1c09JYjreKPAoYU6AXAxt9pyy5jv3kQQt3pHNDSS").roles("ADMIN").build()
        );

        return new InMemoryUserDetailsManager(users);
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> {
                auth.requestMatchers("/").permitAll();
                auth.requestMatchers("/seasons/**").permitAll();
                auth.requestMatchers("/team/stats").permitAll();
                auth.requestMatchers("/tournament/{tournamentId}").permitAll();
                auth.anyRequest().authenticated();
            })
                .csrf(AbstractHttpConfigurer::disable)
            .formLogin(form -> form.defaultSuccessUrl("/admin", true))
            .logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/seasons"))
            .httpBasic(withDefaults());

        return http.build();
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
}
