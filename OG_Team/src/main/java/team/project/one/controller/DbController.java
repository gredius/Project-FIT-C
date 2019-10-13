package team.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.one.servicce.ParsingService;

@Controller
@RequestMapping(value="/db")
public class DbController 
{
	@Autowired
	ParsingService parsingserv;
	
	
	@RequestMapping(value = "makedb", method = RequestMethod.GET)
	public void makediv() 
	{
		System.out.println("==============================================");
		System.out.println("DB 구성을 시작합니다.");
		System.out.println("1.CPUPARSING Start");
		parsingserv.cpuParsing();
		System.out.println("1.CPUPARSING End");
		System.out.println("2.MainBoard PARSING Start");
		parsingserv.mainBoardParsing();
		System.out.println("2.MainBoard PARSING End");
		System.out.println("3.Power PARSING Start");
		parsingserv.powerParsing();
		System.out.println("3.Power PARSING End");
		System.out.println("4.Case PARSING Start");
		parsingserv.Caseparsing();
		System.out.println("4.Case PARSING End");
		System.out.println("5.Gpu PARSING Start");
		parsingserv.gpuParsing();
		parsingserv.updategpu();
		System.out.println("5.Gpu PARSING End");
		System.out.println("6.Ram PARSING Start");
		parsingserv.ramParsing();
		System.out.println("6.Ram PARSING End");
		System.out.println("7.Steam PARSING Start");
		parsingserv.steamAppidParsing();
		System.out.println("7.Steam PARSING End");
		System.out.println("==============================================");
	}
	
	
	
}
