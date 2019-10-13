package team.project.one.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import team.project.one.dao.CompareDAO;
import team.project.one.vo.CompareVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PCEstimateVO;
import team.project.one.vo.PcVO;
import team.project.one.vo.RamVO;

@Controller
@RequestMapping("/compare")
public class CompareController {
		
	@Autowired
	private CompareDAO dao;	

	@RequestMapping(value = "infoCheck", method = RequestMethod.GET)
	public String infoCheck(Model model,String fit_name,String pageflag) 
	{
		GameVO vo = dao.selectGame(fit_name);
		System.out.println("=======================");
		System.out.println(fit_name);
		System.out.println(pageflag);
		System.out.println(vo);
		System.out.println("=======================");
		if(vo!=null)
		{
			model.addAttribute("game",vo);
		} else model.addAttribute("game","nf");
		return "/compare/infoCheck";
	}
	
	@RequestMapping(value = "comInfo", method = RequestMethod.GET)
	public String comInfo(Model model,String fit_name,String pageflag) 
	{
		System.out.println("=======================");
		System.out.println(fit_name);
		System.out.println(pageflag);
		GameVO vo = dao.selectGame(fit_name);
		System.out.println("=======================");
		System.out.println(vo);
		if(vo!=null)
		{
			model.addAttribute("game",vo);
		} else model.addAttribute("game","nf");
		if(pageflag==null)
		{
			model.addAttribute("pageflag","false");
		} else model.addAttribute("pageflag","true"); 
		return "/compare/comInfo";
	}
	
	@RequestMapping(value = "tesseract", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ArrayList<String> tesseract(@RequestParam("uploadFile") MultipartFile file){
		ArrayList<String> list = dao.tesseract(file);
		if(list != null){
			return list;
		} else {
			System.out.println("Error");
			return list;
		}
	}
	
	@RequestMapping(value = "searchCPU", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ArrayList<CpuVO> searchCPU(String cpuname){
		ArrayList<CpuVO> list = dao.searchCPU(cpuname);
		if(list == null) return null;
		return list;
	}
	
	@RequestMapping(value = "searchCPU_window", method = RequestMethod.GET)
	public String searchCPU_window(){
		return "/compare/searchCPU_window";
	}
	
	@RequestMapping(value = "searchMB", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ArrayList<MainBoardVO> searchMB(String name){
		ArrayList<MainBoardVO> list = dao.searchMB(name);
		if(list == null) return null;
		return list;
	}
	
	@RequestMapping(value = "searchMB_window", method = RequestMethod.GET)
	public String searchMB_window(){
		return "/compare/searchMB_window";
	}
	
	@RequestMapping(value = "searchGP", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ArrayList<GpuVO> searchGP(String product_name){
		ArrayList<GpuVO> list = dao.searchGP(product_name);
		if(list == null) return null;
		return list;
	}
	
	@RequestMapping(value = "searchGP_window", method = RequestMethod.GET)
	public String searchGP_window(){
		return "/compare/searchGP_window";
	}
	
	@RequestMapping(value = "searchRAM", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ArrayList<RamVO> searchRAM(String name){
		ArrayList<RamVO> list = dao.searchRAM(name);
		if(list == null) return null;
		return list;
	}
	
	@RequestMapping(value = "searchRAM_window", method = RequestMethod.GET)
	public String searchRAM_window(){
		return "/compare/searchRAM_window";
	}
	
	@RequestMapping(value = "compareAll", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> compareAll(String cpu, String mainboard, String graphic, String ram){
		ArrayList<String> list = new ArrayList<String>();
		list.add(cpu);
		list.add(mainboard);
		list.add(graphic);
		list.add(ram);
		return list;
	}
	
	@RequestMapping(value = "compareTo", method = RequestMethod.GET)
	public String compareTo(CompareVO vo,Model model,String gamename,String pageflag)
	{
		System.out.println(pageflag);
		System.out.println(gamename);
		return "/compare/compareTo";
	}
	
	@RequestMapping(value = "/gameSpec", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> gameSpec(String cpuname, String memory, String gpuname) {
		ArrayList<String> list = new ArrayList<String>();
		list.add(cpuname);
		list.add(memory);
		list.add(gpuname);
		return list;
	}
	
	@RequestMapping(value = "/comRecommend", method = RequestMethod.GET)
	public String comRecommend() {
		return "/compare/comRecommend";
	}
	
	@RequestMapping(value = "/lowest", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public PcVO lowest(String cpu, String ram, String gpu, String mainboard, String power, String pc_case, String cpu_amd, String mainboard_amd) {
		PcVO vo = new PcVO();
		vo.setCpu(cpu);
		vo.setRam(ram);
		vo.setGpu(gpu);
		vo.setMainboard(mainboard);
		vo.setPower(power);
		vo.setPc_case(pc_case);
		vo.setCpu_amd(cpu_amd);
		vo.setMainboard_amd(mainboard_amd);
		System.out.println(vo);
		PcVO result = dao.lowestPrice(vo);
		return result;
	}
	@RequestMapping(value = "/recommend", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public PcVO recommend(String cpu, String ram, String gpu) {
		PcVO vo = new PcVO();
		String recommend_cpu = null;
		String recommend_gpu = null;
		String cpu_amd = null;
		
		String Power = "";
		if(cpu.contains("i7")||cpu.contains("I7")){
			recommend_cpu="인텔 코어i5-9세대 9400F";
			cpu_amd = "AMD 라이젠 5 3600";
		} else 
			recommend_cpu="인텔 코어i3-9세대 9100F";
			cpu_amd = "AMD 라이젠 5 3400G";
		if(gpu.contains("GTX")){
			String[] temp = gpu.split("GTX");
			int num = 0 ;
			try {
				num = Integer.parseInt(temp[1].substring(1,5).trim());
			} catch (Exception e) {
				num = Integer.parseInt(temp[1].substring(1,4).trim());
			}
			if(num < 780){
				recommend_gpu = "GTX 1650";
			} else if(num < 980){
				recommend_gpu = "GTX 1660";
			} else 
				recommend_gpu = "GTX 1660 Ti";
		} else 
			recommend_gpu = "GTX 1650";
		
		String Mainboard = "Asus TUF B360-Pro Gaming";
		String mainboard_amd = "Asus Prime B450-Plus";
		String Case = "ABKO NCORE 새턴 풀 아크릴 슬렌더";
		
		if(recommend_gpu.equals("GTX 1650"))
			Power = "잘만 Wattbit 400W 83+";
		else
			Power = "COOLMAX ELITE 500W +12V Single Rail 84+";
		
		
		String Ram = null;
		if(ram.equalsIgnoreCase("16Gb"))
			Ram = "삼성전자 DDR4 16G";
		else if(ram.equalsIgnoreCase("8Gb"))
			Ram = "삼성전자 DDR4 8G";
		else 
			Ram = "삼성전자 DDR4 8G";
		
		vo.setCpu(recommend_cpu);
		vo.setRam(Ram);
		vo.setGpu(recommend_gpu);
		vo.setMainboard(Mainboard);
		vo.setPc_case(Case);
		vo.setPower(Power);
		vo.setCpu_amd(cpu_amd);
		vo.setMainboard_amd(mainboard_amd);
		System.out.println(cpu_amd);
		return vo;
	}
	
	////////////////////////////////add 1008
	@RequestMapping(value = "comparetwo", method = RequestMethod.POST)
	@ResponseBody
	public CompareVO comparetwo(Model model,CompareVO vo) {
		vo = dao.comparetwo(vo);
		System.out.println("======= compare return value========");
		System.out.println(vo);
		System.out.println("===================================");
		return vo;
	}
	
	@RequestMapping(value = "/saveesti", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void saveesti(PCEstimateVO vo,HttpSession session) 
	{
		String userid = (String) session.getAttribute("fitc_id");
		vo.setFit_userid(userid);
		System.out.println(vo);
		dao.saveesti(vo);
	}
	
	@RequestMapping(value = "allcompare", method = RequestMethod.POST)
	@ResponseBody
	public CompareVO allcompare(Model model,CompareVO vo) {
		CompareVO resultvo = dao.allcompare(vo);
		System.out.println("======= all compare ========");
		System.out.println(resultvo);
		System.out.println("===================================");
		return resultvo;
	}
	
	
	
	
}
