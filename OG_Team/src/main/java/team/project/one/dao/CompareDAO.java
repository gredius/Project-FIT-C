package team.project.one.dao;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import team.project.one.vo.CaseVO;
import team.project.one.vo.CompareVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PCEstimateVO;
import team.project.one.vo.PcVO;
import team.project.one.vo.PowerVO;
import team.project.one.vo.RamVO;

@Repository
public class CompareDAO {

	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	AutoDAO autodao;
	
	public ArrayList<CpuVO> searchCPU(String cpuname){
		CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
		return mapper.searchCPU(cpuname);
	}
	
	public ArrayList<MainBoardVO> searchMB(String name){
		CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
		return mapper.searchMB(name);
	}
	
	public ArrayList<GpuVO> searchGP(String product_name){
		CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
		return mapper.searchGP(product_name);
	}
	
	public ArrayList<RamVO> searchRAM(String name){
		CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
		return mapper.searchRAM(name);
	}
	
	public ArrayList<String> tesseract(MultipartFile file){

		ArrayList<String> result = new ArrayList<String>();
		ITesseract tess = new Tesseract();
		tess.setDatapath("C:/Tesseract-OCR/tessdata/");
		tess.setLanguage("eng");
		
		Calendar cal = Calendar.getInstance();
		long todayMil = cal.getTimeInMillis();
		long oneDayMil = 24*60*60*1000;
		Calendar fileCal = Calendar.getInstance() ;
		Date fileDate = null;
		
		// �뙆�씪 寃쎈줈 �닔�젙 �슂留�
		File path = new File("C:/springworkspace/OG_Team/src/main/webapp/resources/image/") ;
		File[] list = path.listFiles();
		
		try{

			File convert = new File(file.getOriginalFilename());
			convert.createNewFile(); 
		    FileOutputStream fos = new FileOutputStream(convert); 
		    fos.write(file.getBytes());
		    fos.close(); 
		    
		    // adding random number, length of 5
		    int math = (int)(Math.random() * 100000); 
		    
		    // �뙆�씪 寃쎈줈 �닔�젙 �슂留�
			String resizeImage = "C:/springworkspace/OG_Team/src/main/webapp/resources/image/"
												+ file.getName() + "_resized_" + math + ".jpg";
			String machineLearningImage = "C:/springworkspace/OG_Team/src/main/webapp/resources/machine/"
					+ file.getName() + "_machineLearning_" + math + ".jpg";
			
			Image image = ImageIO.read(convert);
			int imageWidth = image.getWidth(null);
			int imageHeight = image.getHeight(null);
			int ratio = 2;
			int resizeWidth = imageWidth * ratio;
			int resizeHeight = imageHeight * ratio;
			
			Image resized = image.getScaledInstance(resizeWidth, resizeHeight, Image.SCALE_SMOOTH);
			BufferedImage newImage = new BufferedImage(resizeWidth, resizeHeight, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImage.getGraphics();
			g.drawImage(resized, 0, 0, null);
			g.dispose();
			
			ImageIO.write(newImage, "jpg", new File(resizeImage));
			ImageIO.write(newImage, "jpg", new File(machineLearningImage));

			try {
				
				String str = tess.doOCR(new File(resizeImage));
				String[] split = str.split("\n");
				System.out.println("======tesseract's Value=======");
				for(String tmvo : split)
				{
					System.out.println(tmvo);
				}
				System.out.println("=============================");
				// CPU
				ArrayList<String> cpulist = autodao.getlist(split[1], "fit_cpu");
				for(String tmvo:cpulist)
				{
					System.out.println(tmvo);
				}
				if(!(cpulist.size()>0))
				{
					result.add(split[1]);
				} else result.add(cpulist.get(0));
				
				// Split Check
				for(int i = 0 ; i < split.length ; i++){
					if(split[i].contains("[")){
						
						// Mainboard
						ArrayList<String> mainboardlist = autodao.getlist(split[i], "fit_mainboard");
						if(!(mainboardlist.size()>0))
						{
							result.add(split[i]);
						} else result.add(mainboardlist.get(0));

						// Graphics
						ArrayList<String> gpulist = autodao.getlist(split[i+2], "fit_gpu");
						if(!(gpulist.size()>0))
						{
							result.add(split[i + 2]);
						} else result.add(gpulist.get(0));	
					
					}
					if(split[i].contains("GB"))
					{
						String[] ram = split[i].split("GB");
						result.add(ram[0]+"GB");
					}
				}
				System.out.println(result);
				return result;
				
			} catch (TesseractException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		// Image File Delete Method
		for(int j=0 ; j < list.length; j++){
		    fileDate = new Date(list[j].lastModified()) ;
		    fileCal.setTime(fileDate);
		    long diffMil = todayMil - fileCal.getTimeInMillis() ;
		    int diffDay = (int)(diffMil/oneDayMil) ;
		    if(diffDay > 7 && list[j].exists()){
		        list[j].delete() ;
		    }
		}
		return result;
		
	}
	
	
	
	
	/////////////////////////////////////////////add 1005////////////////////////////////////////////////
	public PcVO lowestPrice(PcVO vo){
		WebDriver driver;

		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "C:\\SetupFile\\chromedriver.exe";

		//�겕濡ㅻ쭅 �븷 URL
		String cpu_url = "http://prod.danawa.com/list/?cate=112747";
		String gpu_url = "http://prod.danawa.com/list/?cate=112753";
		String ram_url = "http://prod.danawa.com/list/?cate=1131326";
		String motherboard_url = "http://prod.danawa.com/list/?cate=112751";
		String case_url = "http://prod.danawa.com/list/?cate=112775";
		String power_url = "http://prod.danawa.com/list/?cate=112777";

		PcVO lowest = new PcVO();
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");

		driver = new ChromeDriver(options);
		
		String[] parts = {vo.getCpu(), vo.getRam(),vo.getGpu(),vo.getMainboard(), vo.getPower(), vo.getPc_case(), vo.getCpu_amd(), vo.getMainboard_amd()};
		String[] url = {cpu_url, ram_url, gpu_url, motherboard_url, power_url, case_url, cpu_url, motherboard_url};
		ArrayList<String> result = new ArrayList<String>();
		for(int i = 0; i<8;i++){
			try {

				System.out.println("=========================================================================");
				driver.get(url[i]);

				Thread.sleep(750);

				System.out.println(parts[i]);
				driver.findElement(By.className("search_input")).sendKeys(parts[i]);
				driver.findElement(By.className("submit_search_list")).click();

				Thread.sleep(750);

				driver.findElement(By.xpath("//*[@id='productListArea']/div[2]/div[1]/ul/li[3]/a")).click();

				Thread.sleep(750);
				WebElement element  = driver.findElement(By.className("price_sect"));

				String[] price = element.getAttribute("innerHTML").split("strong");
				
				System.out.println(price[1].substring(1, price[1].length()-2));
				result.add(price[1].substring(1, price[1].length()-2));

				System.out.println("=========================================================================");

			} catch (Exception e) {

				e.printStackTrace();

			}
		}
		lowest.setCpu(result.get(0));
		lowest.setRam(result.get(1));
		lowest.setGpu(result.get(2));
		lowest.setMainboard(result.get(3));
		lowest.setPower(result.get(4));
		lowest.setPc_case(result.get(5));
		lowest.setCpu_amd(result.get(6));
		lowest.setMainboard_amd(result.get(7));
		
		System.out.println(lowest);
		driver.close();
		return lowest;
	}
	
	///////////////////////////////////////////add 1007

	public GameVO selectGame(String fit_name) {
		CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
		Map<String, String> tempmap = new HashMap<String, String>();
		tempmap.put("searchkey", fit_name);
		return mapper.selectGame(tempmap);
	}

	public String ramtrim(String str){
		String tempstr = "";
		char[] charlist = str.toCharArray();
		for(int i = 0 ; i<charlist.length;i++) 
		{
			int temp = (int)charlist[i];
			if(temp==64) 
			{
				break;
			} 
			if((temp>=48&&temp<=57)||(temp==46)) 
			{
				tempstr=tempstr+charlist[i];	
			} else {
				tempstr = tempstr + " ";
			}
		}
		tempstr = tempstr.replaceAll(" ", "");
		return tempstr;
	}
	
	public CompareVO comparetwo(CompareVO vo) 
	{
		ArrayList<String> compare = new ArrayList<>();
		String[] tempgcpu = vo.getGamecpu().split(" or ");
		String[] tempggpu = vo.getGamegpu().split(" or ");
		if(tempgcpu.length>0)
		{
			compare.add(strtrim(tempgcpu[0]));
		} else {
			compare.add(strtrim(vo.getGamecpu()));
		}
		compare.add(strtrim(vo.getUsercpu()));
		if(tempggpu.length>0)
		{
			compare.add(strtrim(tempggpu[0]));
		} else {
			compare.add(strtrim(vo.getGamegpu()));
		}
		
		compare.add(strtrim(vo.getUsergpu()));
		
		CompareVO resultvo = getBench(compare);
		resultvo.setUserram(ramtrim(vo.getUserram()));
		resultvo.setGameram(ramtrim(vo.getGameram()));
		return resultvo;
	}
	
	public CompareVO getBench(ArrayList<String> compare)
	   {
	      WebDriver driver;
	      
	      String WEB_DRIVER_ID = "webdriver.chrome.driver";
	      String WEB_DRIVER_PATH = "C:\\SetupFile\\chromedriver.exe";
	      String url = "https://cpu.userbenchmark.com/";

	      
	      System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	      ChromeOptions options = new ChromeOptions();
	      options.addArguments("headless");

	      driver = new ChromeDriver();
	      String result = "";
	      ArrayList<String> resultlist = new ArrayList<>();
	      CompareVO vo = new CompareVO();
	      try {
	      System.out.println("=========================================================================");
	      driver.get(url);

	      
	      for(int i = 0; i<compare.size();i++){
	    	  if(i==2){
	    		  url ="https://gpu.userbenchmark.com/";
	    		  driver.get(url);
	    	  }
	    	  if(!(compare.get(i)==null))
	    	  {
	    		  driver.findElement(By.xpath("//*[@id='tableDataForm:mhtddyntac']/table/thead/tr/th[2]/div/input")).sendKeys(compare.get(i)+"\n");
			      Thread.sleep(750);
			      WebElement element = driver.findElement(By.xpath("//*[@id='tableDataForm:mhtddyntac']/table/tbody/tr[1]/td[5]/div[1]/div"));
			      Thread.sleep(200);
			      result = element.getText().split("\n")[0];
			      System.out.println("bench value : "+result);
			      resultlist.add(element.getText().split("\n")[0]);
			      Thread.sleep(750);
		      }
	    	  driver.findElement(By.xpath("//*[@id='tableDataForm:mhtddyntac']/table/thead/tr/th[2]/div/input")).clear();
	      }
	      if(resultlist.size()>0){
	    	  vo.setGamecpubench(resultlist.get(0));
	    	  vo.setUsercpubench(resultlist.get(1));
	    	  vo.setGamegpubench(resultlist.get(2));
	    	  vo.setUsergpubench(resultlist.get(3));
	      }
	      System.out.println(vo);
	      driver.close();
	      return vo;
	      } catch (InterruptedException e) {
	         e.printStackTrace();
	      }
	      
	      System.out.println("=========================================================================");
	      
	      driver.close();
	      return vo;

	   }
	
	
	
	
	public String getCpuUrl(String str)
	{
		String url = "https://cpu.userbenchmark.com/Search?searchTerm=%2BSubdomain%3A\"cpu\"+%2B"+str;
		String cpuurl = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Iterator<Element> element =doc.select(".tl-tag").iterator();
			while(element.hasNext()) 
			{
				String temp = element.next().outerHtml();
				String[] templist = temp.split("href=");
				for(String tmvo : templist) 
				{
					if(tmvo.contains("https")) 
					{
						String[] templistt = tmvo.split("\"");
						cpuurl = templistt[1];
					}
				}
				System.out.println(cpuurl);
				System.out.println("==============================");
			}
			
			return cpuurl;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getGpuUrl(String str)
	{
		String url = "https://cpu.userbenchmark.com/Search?searchTerm=%2BSubdomain%3A%22gpu%22+%2B"+str;
		String gpuurl = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Iterator<Element> element =doc.select(".tl-tag").iterator();
			System.out.println("==========gpu============");
			while(element.hasNext()) 
			{
				String temp = element.next().outerHtml();
				System.out.println(temp);
				String[] templist = temp.split("href=");
				for(String tmvo : templist) 
				{
					if(tmvo.contains("https")) 
					{
						String[] templistt = tmvo.split("\"");
						gpuurl = templistt[1];
					}
				}
				System.out.println(gpuurl);
			}
			System.out.println("==============================");
			
			return gpuurl;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getCpuBench(String str)
	{
		String url = "https://cpu.userbenchmark.com/Search?searchTerm=%2BSubdomain%3A%22cpu%22+%2B"+str;
		System.out.println(url);
		String cpubench = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Iterator<Element> element =doc.select(".tl-desc").iterator();
			System.out.println("========== CPU BENCH ============");
			if(element.hasNext()) 
			{
				String temp = element.next().text();
				System.out.println(temp);
				String[] listtemp = temp.split("bench ");
				cpubench = listtemp[listtemp.length-1];
				System.out.println(listtemp[listtemp.length-1]);
			}
			System.out.println("===============================");
			return cpubench;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getGpuBench(String str)
	{
		String url = "https://cpu.userbenchmark.com/Search?searchTerm=%2BSubdomain%3A%22gpu%22+%2B"+str;
		String gpubench = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Iterator<Element> element =doc.select(".tl-desc").iterator();
			System.out.println("========== GPU BENCH ============");
			if(element.hasNext()) 
			{
				String temp = element.next().text();
				System.out.println(temp);
				String[] listtemp = temp.split("bench ");
				gpubench = listtemp[listtemp.length-1];
				System.out.println(listtemp[listtemp.length-1]);
			}
			System.out.println("==================================");

			return gpubench;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	   public String getGpuBenchh(String str)
	   {
	      WebDriver driver;

	      String WEB_DRIVER_ID = "webdriver.chrome.driver";
	      String WEB_DRIVER_PATH = "C:\\SetupFile\\chromedriver.exe";

	      //�겕濡ㅻ쭅 �븷 URL
	      String url = "https://gpu.userbenchmark.com/";

	      
	      System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	      ChromeOptions options = new ChromeOptions();
	      options.addArguments("headless");

	      driver = new ChromeDriver();
	      String result = "";
	      
	      try {
	      System.out.println("=========================================================================");
	      driver.get(url);

	      Thread.sleep(750);

	      driver.findElement(By.xpath("//*[@id='tableDataForm:mhtddyntac']/table/thead/tr/th[2]/div/input")).sendKeys(str+"\n");
	      
	      
	      Thread.sleep(750);
	      WebElement element = driver.findElement(By.xpath("//*[@id='tableDataForm:mhtddyntac']/table/tbody/tr[1]/td[5]/div[1]/div"));
	      result = element.getText().split("\n")[0];
	      
	      System.out.println(element.getText().split("\n")[0]);
	      
	      
	      } catch (InterruptedException e) {
	         e.printStackTrace();
	      }

	      System.out.println("=========================================================================");
	      
	      driver.close();
	      return result;
	   }
	
	   public String strtrim(String str)
		{
			String tempstr = "";
			char[] charlist = str.toCharArray();
			for(int i = 0 ; i<charlist.length;i++) 
			{
				int temp = (int)charlist[i];
				if(temp==64) 
				{
					break;
				} 
				if((temp>=48&&temp<=57)||(temp>=65&&temp<=90)||(temp>=97&&temp<=122)) 
				{
					tempstr=tempstr+charlist[i];	
				} else {
					tempstr = tempstr + " ";
				}
			}
			System.out.println("strtrim2: "+tempstr);
			return tempstr;
		}
	   
	   public CompareVO allcompare(CompareVO vo) 
		{
			CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
			ArrayList<String> compare = new ArrayList<>();
			CompareVO resultvo = new CompareVO();
			String[] tempgcpu = vo.getGamecpu().split(" or ");
			String[] tempggpu = vo.getGamegpu().split(" or ");
			if(tempgcpu.length>0)
			{
				compare.add(strtrim(tempgcpu[0]));
			} else {
				compare.add(strtrim(vo.getGamecpu()));
			}
			compare.add(strtrim(vo.getUsercpu()));
			if(tempggpu.length>0)
			{
				compare.add(strtrim(tempggpu[0]));
			} else {
				compare.add(strtrim(vo.getGamegpu()));
			}
			compare.add(strtrim(vo.getUsergpu()));
			resultvo = getBench(compare);
			resultvo.setUserram(ramtrim(vo.getUserram()));
			resultvo.setGameram(ramtrim(vo.getGameram()));
			//////////////////////////////////mainboard & cpu compare
			CompareVO tempvo = comparemandc(vo);
			System.out.println("allcompare : "+tempvo);
			resultvo.setMaincpu(tempvo.getMaincpu());
			resultvo.setMaincase(tempvo.getMaincase());
			System.out.println(resultvo);
			return resultvo;
		}
		
		public CompareVO comparemandc(CompareVO vo)
		{
			CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
			System.out.println("Comparemandc : "+vo);
			/////////////////////////////////
			ArrayList<CpuVO> cpuvo = new ArrayList<>();
			ArrayList<MainBoardVO> mainvo = new ArrayList<>();
			ArrayList<CaseVO> casevo = new ArrayList<>();
			ArrayList<PowerVO> powervo = new ArrayList<>();
			HashMap<String, String> cpumap = new HashMap<>();
			HashMap<String, String> mainmap = new HashMap<>();
			HashMap<String, String> casemap = new HashMap<>();
			HashMap<String, String> powermap = new HashMap<>();
			cpumap.put("value", vo.getUsercpu());
			cpumap.put("table", "fit_cpu");
			mainmap.put("value", vo.getUsermainboard());
			mainmap.put("table", "fit_mainboard");
			casemap.put("value", vo.getUsercase());
			casemap.put("table", "fit_case");
			powermap.put("value", vo.getUserpower());
			powermap.put("table", "fit_power");
			/////////////////////////////////////////////////
			cpuvo = mapper.getcpu(cpumap);
			mainvo = mapper.getmain(mainmap);
			casevo = mapper.getcase(casemap);
			powervo = mapper.getpower(powermap);
			CompareVO resultvo = new CompareVO();
			resultvo = comparematerial(cpuvo,mainvo,casevo,powervo);
			
			return resultvo;
		}

		public CompareVO comparematerial(ArrayList<CpuVO> cpuvo, ArrayList<MainBoardVO> mainvo, ArrayList<CaseVO> casevo, ArrayList<PowerVO> powervo) 
		{
			System.out.println("===========CompareMatrerial==========");
			System.out.println(cpuvo.size());
			System.out.println(mainvo.size());
			System.out.println(casevo.size());
			System.out.println(powervo.size());
			CompareVO result = new CompareVO();
			
			if(cpuvo==null||mainvo==null||casevo==null||powervo==null){
				System.out.println("null이 존재합니다.");
				return null;
			}
			String cpus = cpuvo.get(0).getSocket().toUpperCase();
			String mains = mainvo.get(0).getSockets().toUpperCase();
			String mainsize = mainvo.get(0).getFormFactor().toUpperCase();
			String casesize = casevo.get(0).getMainboardsize().toUpperCase();
			System.out.println("===========upper");
			String[] tempcpu = cpus.split(" ");
			System.out.println(cpus);
			System.out.println(mains);
			System.out.println(mainsize);
			System.out.println(casesize);
			//////////////////////////////////////////
			if(!(tempcpu.length>0))
			{
				tempcpu = cpus.split("BGA");
			}
			if(mains.contains(tempcpu[tempcpu.length-1]))
			{
				result.setMaincpu("CPU와 호환됩니다.");
			} else result.setMaincpu("CPU와 호환되지 않습니다");
			////////////////////////////////////////
			if(casesize.contains(mainsize)){
				result.setMaincase("MAINBOARD와 호환됩니다.");
			} else result.setMaincase("MAINBOARD와 호환되지않습니다.");
			System.out.println(result);
			return result;
		}

		public void saveesti(PCEstimateVO vo)
		{
			CompareMapper mapper = sqlSession.getMapper(CompareMapper.class);
			mapper.saveesti(vo);
		}
	   
	
}
