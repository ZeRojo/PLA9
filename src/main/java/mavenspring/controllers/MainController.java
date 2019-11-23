package mavenspring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String inicio() {
		return "index";
	}
	
	@GetMapping("/editor")
	public String editor() {
		return "editor";
	}
	
	@GetMapping("/admin")
	public String administrador() {
		return "administrador";
	}
	
	@GetMapping("/colabora")
	public String colaborador() {
		return "colaborador";
	}
	
	@GetMapping("/login")
	public String indLogin() {
		return "login";
	}
	
	@GetMapping("/denegado")
	public String prohibido() {
		return "403";
	}
}
