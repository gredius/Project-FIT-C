package team.project.one.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.one.vo.GameVO;
import team.project.one.vo.SteamVO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "C:\\SetupFile\\chromedriver.exe";

	public ArrayList<GameVO> getGameList() 
	{
		ChartMapper mapper = sqlsession.getMapper(ChartMapper.class);
		return mapper.gamelist();
	}

	public GameVO selectOneGame(GameVO vo) {
		ChartMapper mapper = sqlsession.getMapper(ChartMapper.class);
		return mapper.selectOneGame(vo);
	}

	public ArrayList<SteamVO> steamParsing() {
		ChartMapper mapper = sqlsession.getMapper(ChartMapper.class);
		return mapper.steamparsing();
	}

	public GameVO gameParsing(SteamVO steam) {
		String url = "https://store.steampowered.com/app/"+steam.getAppid(); //크롤링할 url지정
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		GameVO vo = new GameVO();
		vo.setFit_name(steam.getFit_name());
		ArrayList<Element> list = doc.select("ul.bb_ul");
		System.out.println(list.size());
		System.out.println("============================================================");
		if(list.size()==0){
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			System.out.println(vo.getFit_name());
			//Driver SetUp
			ChromeOptions options = new ChromeOptions();
			options.addArguments("headless");
			WebDriver driver = new ChromeDriver(options);
			try {
				
				String result = null;
				JavascriptExecutor js = (JavascriptExecutor)driver;
				driver.get(url);
				Select age = new Select(driver.findElement(By.id("ageYear")));
				age.selectByValue("1999");
				js.executeScript("return ViewProductPage()");
				
				Thread.sleep(2000);
				String image = driver.findElement(By.className("game_header_image_full")).getAttribute("src");
				System.out.println(image+"\n");
				List<WebElement> element = driver.findElements(By.className("bb_ul"));
				for(WebElement ele : element){ 
					if(ele.getText().contains("OS")){
							result = ele.getText();
					}
				}
				System.out.println(result);
				System.out.println("=========");
				String[] test = result.split("\n");
				String etc = "";
				for(String str : test) {
					if(str.contains("Processor"))
						vo.setGamecpu(str.substring(11));
					else if(str.contains("Graphics"))
						vo.setGamegpu(str.substring(10));
					else if(str.contains("Memory"))
						vo.setGameram(str.substring(8));
					else 
						etc = etc.concat(str+"\n");
				}
				vo.setImagelink(image);
				vo.setMemo(etc);
				if(vo.getGameram()==null){
					vo.setGameram("정보없음");
				}
				if(vo.getGamecpu()==null){
					vo.setGamecpu("정보없음");
				}
				if(vo.getGamegpu()==null){
					vo.setGamegpu("정보없음");
				}
				driver.close();
				return vo;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("Jsoup 사용");
			String image = doc.select("img.game_header_image_full").attr("src");
			System.out.println(image+"\n");

			int cnt = 0;
			for(int i = 0;i<list.size();i++){
				if(list.get(i).text().contains("OS")) {
						if(list.get(i).text().contains("Mac"))
							break;
					cnt = i;
				}
			}
			System.out.println();
			Iterator<Element> ie = list.get(cnt).select("li").iterator();
			String etc = "";
			while (ie.hasNext()) {
				String str = ie.next().text();
				if(str.contains("Processor"))
					vo.setGamecpu(str.substring(11));
				else if(str.contains("Graphics"))
					vo.setGamegpu(str.substring(10));
				else if(str.contains("Memory"))
					vo.setGameram(str.substring(8));
				else 
					etc = etc.concat(str+"\n");
			}
			vo.setImagelink(image);
			vo.setMemo(etc);
			return vo;
		}
		System.out.println("============================================================");
		
		return null;
	}
	
}
