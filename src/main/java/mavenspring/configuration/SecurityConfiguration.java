package mavenspring.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/colabora/**").hasRole("COLABORADOR")
			.antMatchers("/editor/**").hasRole("EDITOR")
			.antMatchers("/").permitAll()
			.and()
			.formLogin().loginPage("/login")
            .defaultSuccessUrl("/").loginProcessingUrl("/autenticarUsuario")
            .failureHandler(customAuthenticationFailureHandler())
            .permitAll()
            .and()           
			.logout().logoutUrl("/logoutUsuario").logoutSuccessUrl("/").permitAll()
			.and().exceptionHandling().accessDeniedPage("/denegado");
	}	
	
	@Bean
    public AuthenticationFailureHandler customAuthenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler();
    }
}
