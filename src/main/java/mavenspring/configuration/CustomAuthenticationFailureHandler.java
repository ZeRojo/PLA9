package mavenspring.configuration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {   	
    	String location=httpServletRequest.getContextPath();
    	String interno=httpServletRequest.getParameter("intform");
    	if (interno.equals("true")) {	
    		location+="/?error";
    	} else {
    		location+="/login?error";
    	}
    	httpServletResponse.sendRedirect(location);
    }
}
