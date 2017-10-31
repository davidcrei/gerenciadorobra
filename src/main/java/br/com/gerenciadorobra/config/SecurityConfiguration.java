package br.com.gerenciadorobra.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
@Override
protected void configure(HttpSecurity http) throws Exception {
	// TODO Auto-generated method stub
	
	http.authorizeRequests()
	.antMatchers(HttpMethod.POST,"/cadastro").hasRole("ADMIN")
	.antMatchers(HttpMethod.GET,"/cadastro/listar").permitAll()
	.antMatchers(HttpMethod.POST,"/cadastro/gravar").hasRole("ADMIN")
	
	.antMatchers("/resources/**").permitAll()
	.antMatchers("/").permitAll()
	.anyRequest().authenticated()
	.and().formLogin()
	.and().formLogin().loginPage("/login").permitAll();
	
}


}
