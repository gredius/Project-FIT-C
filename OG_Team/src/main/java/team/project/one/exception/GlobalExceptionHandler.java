package team.project.one.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(NullPointerException.class)
	public String nullpointerHandler(Model model,NullPointerException ex)
	{
		model.addAttribute("msg","에러 발생");
		model.addAttribute("ex",ex);
		return "/exception/error";
	}
	
	
	@ExceptionHandler(ArithmeticException.class)
	public String aritnmeticHandler(Model model, ArithmeticException ex)
	{
		model.addAttribute("msg","에러 발생");
		model.addAttribute("ex",ex);
		return "/exception/error";
	}
	
	@ExceptionHandler(Exception.class)
	public String ExceptionHandler(Model model, Exception ex)
	{
		model.addAttribute("msg","에러 발생");
		model.addAttribute("ex",ex);
		return "/exception/error";
	}
	
}
