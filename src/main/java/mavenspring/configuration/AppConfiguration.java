package mavenspring.configuration;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="mavenspring")
@PropertySource("classpath:pla9.properties")
public class AppConfiguration implements WebMvcConfigurer {

	@Autowired
	private Environment env;
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver=new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/vistas/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public DataSource dbDataSource() {
		ComboPooledDataSource dbDataSource = new ComboPooledDataSource();
		try {
			dbDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException ex) {
			throw new RuntimeException (ex);
		}
		dbDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		dbDataSource.setUser(env.getProperty("jdbc.user"));
		dbDataSource.setPassword(env.getProperty("jdbc.password"));
		dbDataSource.setInitialPoolSize(Integer.parseInt(env.getProperty("connection.pool.initialPoolSize")));
		dbDataSource.setMinPoolSize(Integer.parseInt(env.getProperty("connection.pool.minPoolSize")));
		dbDataSource.setMaxPoolSize(Integer.parseInt(env.getProperty("connection.pool.maxPoolSize")));
		dbDataSource.setMaxIdleTime(Integer.parseInt(env.getProperty("connection.pool.maxIdleTime")));
		return dbDataSource;
	}
	
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/").setCachePeriod(31556926);
        registry.addResourceHandler("/img/**").addResourceLocations("/resources/img/").setCachePeriod(31556926);
	}
}
