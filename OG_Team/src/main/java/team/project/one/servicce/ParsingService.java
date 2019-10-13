package team.project.one.servicce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.project.one.dao.ParsingDAO;
import team.project.one.vo.CaseVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PowerVO;
import team.project.one.vo.RamVO;
import team.project.one.vo.SteamVO;

@Service
public class ParsingService 
{
	int cpucnt = 0;
	int casecnt = 0;
	int gamecnt = 0;
	int ramcnt = 0;
	int gpucnt = 0;
	int powercnt = 0;
	int mainboardcnt = 0;

	//WebDriver
	WebDriver driver;

	@Autowired
	ParsingDAO dao;

	//Properties
	public final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public final String WEB_DRIVER_PATH = "C:\\SetupFile\\chromedriver.exe";
	private String base_url;


	public void connSelenium() {
		//System Property SetUp
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		//Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		driver = new ChromeDriver();
	}

	public void mainBoardParsing() {
		mainboardcnt = 1;
		try {
			connSelenium();
			//get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
			ArrayList<MainBoardVO> list = new ArrayList<MainBoardVO>();
			for(int page = 1 ; page < 84 ; page++){
				System.out.println(page+" 페이지");
				base_url = "https://motherboarddb.com/motherboards/?dt=list&so=y&year=2010,2019&page=" + page;
				driver.get(base_url);
				Thread.sleep(5000);
				String pagesize = driver.findElement(By.xpath("//*[@id='table-wrapper']/div[1]/div[1]/ul/li[2]")).getText();
				String[] tempp = pagesize.split("-");
				String[] temppp = tempp[0].split(" ");
				String[] tempppp = tempp[tempp.length - 1].split(" ");
				int startnum = Integer.parseInt(temppp[temppp.length - 1]);
				int endnum = Integer.parseInt(tempppp[tempppp.length - 3]);
				for(int num = 2 ; num < endnum - startnum + 3 ; num++){
					MainBoardVO vo = new MainBoardVO();
					//메인보드 제품명	
					String name = driver.findElement(By.xpath("//*[@id='table-wrapper']/div[" + num + "]/div[2]/div[1]/a/h4")).getText();
					vo.setFit_name(name);
					//제품정보1
					String info1 = driver.findElement(By.xpath("//*[@id='table-wrapper']/div[" + num + "]/div[2]/div[2]/div[1]/ul")).getText();
					String[] data1 = info1.split("\n");
					for(int x = 0 ; x < data1.length ; x++){
						String[] result = data1[x].split(":");
						for(int y = 0 ; y < result.length; y++){
							if(result.length == 2 && result[y].contains("Socket(s)")){
								vo.setSockets(result[y+1]);
							} else if(result.length == 1 && result[y].contains("Socket(s)")){
								vo.setSockets("NA");
							} else if(result.length == 2 && result[y].contains("Form Factor")){
								vo.setFormFactor(result[y+1]);
							} else if(result.length == 1 && result[y].contains("Form Factor")){
								vo.setFormFactor("NA");
							} else if(result.length == 2 && result[y].contains("Chipset")){
								vo.setChipSet(result[y+1]);
							} else if(result.length == 1 && result[y].contains("Chipset")){
								vo.setChipSet("NA");
							} else if(result.length == 2 && result[y].contains("RAM")){
								vo.setRAM(result[y+1]);
							} else if(result.length == 1 && result[y].contains("RAM")){
								vo.setRAM("NA");
							} else if(result.length == 2 && result[y].contains("Release Year")){
								vo.setReleaseDate(result[y+1]);
							} else if(result.length == 1 && result[y].contains("Release Year")){
								vo.setReleaseDate("NA");
							} else {

							}
						}
					}
					//제품정보2
					String info2 = driver.findElement(By.xpath("//*[@id='table-wrapper']/div[" + num + "]/div[2]/div[2]/div[2]")).getText();
					String[] data2 = info2.split("\n");
					for(int x = 0 ; x < data2.length ; x++){
						String[] result = data2[x].split(":");
						for(int y = 0 ; y < result.length; y++){
							if(result.length == 2 && result[y].contains("Audio Chip")){
								vo.setAudioChip(result[y+1]);
							} else if(result.length == 1 && result[y].contains("Audio Chip")){
								vo.setAudioChip("NA");
							} else if(result.length == 2 && result[y].contains("USB 2.0 Header")){
								vo.setUsb2(result[y+1]);
							} else if(result.length == 1 && result[y].contains("USB 2.0 Header")){
								vo.setUsb2("NA");
							} else if(result.length == 2 && result[y].contains("USB 3.0 Header")){
								vo.setUsb3(result[y+1]);
							} else if(result.length == 1 && result[y].contains("USB 3.0 Header")){
								vo.setUsb3("NA");
							} else if(result.length == 2 && result[y].contains("SATA3")){
								vo.setSata(result[y+1]);
							} else if(result.length == 1 && result[y].contains("SATA3")){
								vo.setSata("NA");
							} else {
							}
						}
					} // last for end
					vo.setNum(mainboardcnt);
					mainboardcnt++;
					list.add(vo);
				} // second for end   
			} // first for end
			dao.insertMainBoard(list);
			System.out.println(mainboardcnt-1+"개의 MainBoard DB를 Fit_Mainboard 테이블에 저장하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		} // first try end
		
		
	} // class end

	public void powerParsing() 
	{
		powercnt = 1;
		try 
		{
			ArrayList<PowerVO> list = new ArrayList<PowerVO>();
			connSelenium();
			for(int page = 10127 ; page < 10135 ; page++){ // 10127 ~ 10135
				base_url = "https://search.shopping.naver.com/search/all.nhn?origQuery=%EC%BB%B4%ED%93%A8%ED%84%B0%20%ED%8C%8C%EC%9B%8C&spec=M1863%7CM"+ 
						page+"&pagingIndex=1&pagingSize=20&viewType=list&sort=rel&frm=NVSHATT&query=%EC%BB%B4%ED%93%A8%ED%84%B0%20%ED%8C%8C%EC%9B%8C";
				driver.get(base_url);
				Thread.sleep(5000);

				By myList = By.className("info");
				List<WebElement> elements = driver.findElements(myList);
				for(WebElement e : elements){ 
					if(!e.getText().contains("광고")){
						PowerVO vo = new PowerVO();
						String[] data = e.getText().split("\n");

						// 제품명 data[0]
						//System.out.println(data[0]);
						vo.setFit_name(data[0]);

						// 제품가격 data[1]
						String[] price = data[1].split("원");
						if(price[0].contains("최저")){
							String[] price1 = price[0].split("저");
							//System.out.println(price1[1]);
							vo.setPrice(price1[1]);
						} else {
							//System.out.println(price[0]);
							vo.setPower(price[0]);
						}

						// 제품규격 data[3]
						String[] spec = data[3].split("\\|");
						for(int i = 0 ; i < spec.length ; i++){

							// 파워 규격
							if(spec[i].contains("파워 규격")){
								String[] power = spec[i].split(": ");
								//System.out.println(power[1]);
								vo.setPower(power[1]);
							}

							// 정격 출력
							else if(spec[i].contains("정격 출력")){
								String[] output = spec[i].split(": ");
								//System.out.println(output[1]);
								vo.setOutput(output[1]);
							}

							// 쿨링팬 크기
							else if(spec[i].contains("쿨링팬 크기")){
								String[] fanSize = spec[i].split(": ");
								//System.out.println(fanSize[1]);
								vo.setFanSize(fanSize[1]);
							}

							// 쿨링팬 개수
							else if(spec[i].contains("쿨링팬 개수")){
								String[] fanNum = spec[i].split(": ");
								//System.out.println(fanNum[1]);
								vo.setFanNum(fanNum[1]);
							}

							// ATX 12V 규격
							else if(spec[i].contains("ATX 12V 규격")){
								String[] atx = spec[i].split(": ");
								//System.out.println(atx[1]);
								vo.setAtx(atx[1]);
							}

							// sata 커넥터
							else if(spec[i].contains("SATA 커넥터")){
								String[] sata = spec[i].split(": ");
								//System.out.println(sata[1]);
								vo.setSata(sata[1]);
							}

							// 커넥터
							else if(spec[i].contains("커넥터")){
								String[] connecter = spec[i].split(": ");
								//System.out.println(connecter[1]);
								vo.setConnecter(connecter[1]);
							}

							// 부가기능
							else if(spec[i].contains("부가기능")){
								String[] etc = spec[i].split(": ");
								//System.out.println(etc[1]);
								vo.setEtc(etc[1]);
							}
						}

						// 제품등록일 data[?]
						for(int y = 0 ; y < data.length ; y++){
							if(data[y].contains("등록일")){
								String[] date = data[y].split("록일 ");
								String[] date1 = date[1].split("찜하기");
								//System.out.println(date1[0]);
								vo.setReleaseDate(date1[0]);
							}
						}
						vo.setNum(powercnt);
						if(vo.getOutput()==null || vo.getPower()==null)
						{
							System.out.println("=================");
							System.out.println(vo);
							System.out.println("=================");
						}
						powercnt++;
						list.add(vo);
					}	
				}
			}
			dao.insertPower(list);
			System.out.println(powercnt-1+"개의 Power DB를 Fit_Power 테이블에 저장하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		}
	}

	public void cpuParsing() 
	{
		cpucnt = 1;
		for(int i= 2011; i<2020;i++){
			cpuParsingsecond(i, "Intel");
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cpuParsingsecond(i, "AMD");
		}
		System.out.println(cpucnt-1+"개의 CPU정보를 Fit_cpu 테이블에 저장하였습니다");
	}
	
	public void cpuParsingsecond(int year,String brand)
	{
		ArrayList<CpuVO> cpulist = new ArrayList<CpuVO>();
		try {
			System.out.println(year+"년도 CPU Parsing");
			String url="https://www.techpowerup.com/cpudb/?mfgr="+brand+"&released="+year+"&sort=name";
			Document doc =Jsoup.connect(url).get();
			Iterator<Element> test = doc.select("td").iterator();
			int count =0;
			CpuVO vo = new CpuVO();
			while(test.hasNext()) 
			{
				switch (count) {
				case 0: 
					vo.setFit_name(brand+" "+test.next().text());
					count++;
					break;
				case 1: 
					vo.setCpucode(test.next().text());
					count++;
					break;
				case 2: 
					vo.setCores(test.next().text());
					count++;
					break;
				case 3: 
					vo.setClock(test.next().text());
					count++;
					break;
				case 4: 
					vo.setSocket(test.next().text());
					count++;
					break;
				case 5: 
					vo.setProcess(test.next().text());
					count++;
					break;
				case 6: 
					vo.setL3cache(test.next().text());
					count++;
					break;
				case 7: 
					vo.setTdp(test.next().text());
					count++;
					break;
				case 8:
					vo.setReleased(test.next().text());
					vo.setNum(cpucnt);
					cpucnt++;
					count = 0;
					if(cpulist.size()>0){
					if(cpulist.get(cpulist.size()-1).getNum()==vo.getNum())
					{
						System.out.println("Error!!!!!!!!");
						System.out.println(vo);
						break;
					}}
					System.out.println(vo);
					cpulist.add(vo);
					vo=new CpuVO();
					break;
				default:
					break;
				}	
			}
			dao.insertCpu(cpulist);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void Caseparsing() 
	{
		casecnt = 1;
		ArrayList<CaseVO> caselist = new ArrayList<CaseVO>();
		String url="https://search.shopping.naver.com/search/all.nhn?origQuery=%EC%BB%B4%ED%93%A8%ED%84%B0%20%EC%BC%80%EC%9D%B4%EC%8A%A4&pagingIndex=1&pagingSize=80&viewType=list&sort=rel&cat_id=50001621&frm=NVSHCAT&query=%EC%BB%B4%ED%93%A8%ED%84%B0%20%EC%BC%80%EC%9D%B4%EC%8A%A4";

		try {
			org.jsoup.nodes.Document doc =Jsoup.connect(url).get();
			Iterator<Element> element =doc.select("ul.goods_list div.info").iterator();
			while(element.hasNext()) 
			{
				String temp = element.next().text();
				if(!(temp.contains("광고")) && temp.length()>100) 
				{
					CaseVO tempvo = new CaseVO();
					String[] tempname = null;
					tempname= temp.split("최저");
					String casename = tempname[0];
					String[] temprowprice = null;
					if(tempname.length>1) 
					{
						temprowprice = tempname[1].split("원 ");
					} else 
					{
						break;
					}
					String rowprice = temprowprice[0];
					String[] addop = temprowprice[1].split("PC케이스 ");
					String[] plusop = addop[1].split("\\|");
					tempvo.setFit_name(casename);
					tempvo.setRowprice(rowprice);
					String casesize = null;
					String tempcasesize = null;
					String tempaddop = null;

					for(int i=0;i<plusop.length-1;i++) 
					{
						if(plusop[i].contains("파워규격")) 
						{
							String[] tmlist = plusop[i].split(" : ");
							tempvo.setPower(tmlist[tmlist.length-1]);

						}else if(plusop[i].contains("메인보드 규격")) 
						{
							String[] tmlist = plusop[i].split(" : ");
							tempvo.setMainboardsize(tmlist[tmlist.length-1]);

						}else if(plusop[i].contains("케이스 크기")||plusop[i].contains("품목")) 
						{
							String[] tmlist = plusop[i].split(" : ");
							casesize = tmlist[tmlist.length-1];
						} else if(plusop[i].startsWith("폭")||plusop[i].startsWith("높")||plusop[i].startsWith("깊")) 
						{
							if(tempcasesize!=null) 
							{
								tempcasesize = tempcasesize+" / "+plusop[i];
							}else 
							{
								tempcasesize = " "+plusop[i];
							}
						} else 
						{
							if(tempaddop!=null) 
							{
								tempaddop = tempaddop+"/"+plusop[i];
							} else 
							{
								tempaddop = plusop[i];
							}
						}
					}
					if(!plusop[plusop.length-1].contains(" : ")) 
					{
						String[] tmlist =  plusop[plusop.length-1].split(" 리");
						String[] tmmlist = null;
						String tempstr = "";
						if(tmlist[0].contains(", ")) 
						{
							tmlist[0] = tmlist[0].replaceAll(" ", "");
							tmlist[0] = tmlist[0].replaceAll(",", "/");
						}
						if(tmlist[0].contains("TX")) 
						{
							tmmlist = tmlist[0].split("/");
						}
						if(tmmlist!=null) 
						{
							for(String str : tmmlist) 
							{
								if(str.contains("TX")) 
								{
									tempstr = tempstr +str;
								}
							}
						}
						if(!tempstr.equals("")) 
						{
							tempvo.setMainboardsize(tempvo.getMainboardsize()+"/"+tempstr);
						}
					}
					if(tempcasesize!=null) 
					{
						tempvo.setCasesize(casesize+tempcasesize);
					} else 
					{
						tempvo.setCasesize(casesize);
					}
					tempvo.setAddop(tempaddop);
					tempvo.setNum(casecnt);
					System.out.println(tempvo);
					casecnt++;
					caselist.add(tempvo);
				}
			}
			dao.insertCase(caselist);
			System.out.println(casecnt-1+"개의 Case DB를 Fit_Case에 저장하였습니다.");
		} catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	public void ramParsing()
	{
		try {
			int page=1;
			int num = 1;
			String name = null;
			String spec = null;
			String src_link = null;
			connSelenium();
			base_url = "http://prod.danawa.com/list/?cate=1131326&15main_11_03";
			JavascriptExecutor js = (JavascriptExecutor)driver;
			driver.get(base_url);

			ArrayList<RamVO> list = new ArrayList<>();
			
			while(true) {
				js.executeScript("return movePage("+page+")");

				Thread.sleep(3000);
				List<WebElement> element = driver.findElements(By.className("prod_main_info"));
				
				System.out.println("=========================================================================");
				System.out.println("--"+page+" 페이지--");
				

				for(WebElement ele : element){
					try {
						if(ele.findElement(By.name("productName")).getText().length()>5){
						name = ele.findElement(By.name("productName")).getText();
						spec = ele.findElement(By.className("spec_list")).getText();
						src_link = ele.findElement(By.className("image_lazy")).getAttribute("data-original");
						list.add(new RamVO(++num, name, spec, src_link));
						}
					} catch (Exception e) {
					}
				}
				System.out.println("=========================================================================");
				page++;
				if(page==29)
					break;
				for(RamVO vo : list){
					System.out.println(vo);
				}
			}
			dao.insertRam(list);
		} catch (Exception e) {

			//e.printStackTrace();

		} finally {

			//driver.close();
		}
		driver.close();

	}



	public void gpuParsing()
	{
		connSelenium();
		String kaisha = "nvidia";
		int index = 0;
		ArrayList<GpuVO> list = new ArrayList<GpuVO>();
		String tdp = null; 
		for(int year = 2010;year<2020;year++){
			String url_tdp = "https://www.techpowerup.com/gpu-specs/?mfgr="+kaisha+"&released="+year+"&sort=name"; //크롤링할 url지정
			Document doc_tdp = null;        //Document에는 페이지의 전체 소스가 저장된다

			try {
				doc_tdp = Jsoup.connect(url_tdp).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
			Elements element_tdp = doc_tdp.select("select#tdp");
			//Elements element = doc.select("div.table-wrapper").select("tbody").select("tr").select("td");    

			//for(Element test: element) 
			//Iterator을 사용하여 하나씩 값 가져오기
			Iterator<Element> ie_tdp = element_tdp.iterator();
			//System.out.println(test.text());
			String[] tdp_string = ie_tdp.next().text().split(" ");
			//Iterator<Element> ie2 = element.select("strong.title").iterator();
			System.out.println("========================================================================");
			String url = null;
			for(int i=1;i<tdp_string.length;i++) {
				if(i%3==1){
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					System.out.println(kaisha +"-"+ year+"년도 "+tdp_string[i]+"W");
					if(!tdp_string[i].equals("unknown")) 
						url = "https://www.techpowerup.com/gpu-specs/?mfgr="+kaisha+"&released="+year+"&tdp="+tdp_string[i]+"%20W&sort=name";
					else
						url = "https://www.techpowerup.com/gpu-specs/?mfgr="+kaisha+"&released="+year+"&tdp=unknown&sort=name";
					Document doc = null; 
					try {
						doc = Jsoup.connect(url).get();
					} catch (IOException e) {
						e.printStackTrace();
					}
					Elements element = doc.select("div.table-wrapper").select("tbody").select("tr").select("td");
					Iterator<Element> ie = element.iterator();
					//System.out.println(kaisha +"-"+ year+"년도");
					GpuVO vo = new GpuVO();
					while (ie.hasNext()) {

						switch (index) {
						case 0:
							vo.setCompany(kaisha);
							index++;
							break;
						case 1: //봐줬다.
							vo.setFit_name(ie.next().text());
							index++;
							break;
						case 2:
							vo.setChip(ie.next().text());
							index++;
							break;
						case 3:
							vo.setReleased_date(ie.next().text());
							index++;
							break;
						case 4:
							vo.setBus(ie.next().text());
							index++;
							break;
						case 5:
							String result = ie.next().text();
							if(!result.equals("System Shared")){
								String[] memory = result.split(", ");	
								vo.setM_size(memory[0]);
								vo.setM_ddr(memory[1]);
								vo.setM_bit(memory[2]);
							}
							else {
								vo.setM_size("System Shared");
								vo.setM_ddr("System Shared");
								vo.setM_bit("System Shared");
							};
							index++;
							break;
						case 6:
							vo.setG_clock(ie.next().text());
							index++;
							break;
						case 7:
							vo.setM_clock(ie.next().text());
							vo.setTdp(tdp_string[i]+tdp_string[i+1]);
							vo.setNum(gpucnt);
							gpucnt++;
							list.add(vo);
							index=0;
							System.out.println(vo);
							vo = new GpuVO();
							ie.next();
							break;
						default:
							break;
						}

						//System.out.println((cnt++) +" "+ ie.next().text());
					}
				}
			}

			

			System.out.println("========================================================================");
			//		while (ie.hasNext()) {
			//			System.out.println(ie.next().text());
			//		}

			if(kaisha=="nvidia"&&year==2019) {
				kaisha = "amd";
				year=2009;
			}
			if(kaisha=="amd"&&year==2019) {
				kaisha = "intel";
				year=2009;
			}
		}
		dao.insertGpu(list);
		System.out.println(list.size());

	}

	public void steamAppidParsing()
	{
		int steamcnt = 1;
		try {
			connSelenium();
			base_url = "https://steamdb.info/graph/";
			driver.get(base_url);
			Thread.sleep(5000);

			ArrayList<SteamVO> list = new ArrayList<SteamVO>();

			Select length = new Select(driver.findElement(By.name("table-apps_length")));
			length.selectByVisibleText("All");
			Thread.sleep(5000);

			for(int i = 2 ; i < 1191 ; i++){
				SteamVO vo = new SteamVO();

				By appidInfo = By.xpath("//*[@id='table-apps']/tbody/tr[" + i + "]/td[2]");
				By nameInfo = By.xpath("//*[@id='table-apps']/tbody/tr[" + i + "]/td[3]");

				String appid = driver.findElement(appidInfo).getText();
				String name = driver.findElement(nameInfo).getText();

				vo.setAppid(appid);
				vo.setFit_name(name);
				vo.setNum(steamcnt);
				steamcnt++;
				System.out.println(vo);
				list.add(vo);
			}
			dao.insertSteam(list);
			System.out.println(steamcnt-1+"개의 Steam Db를 Fit_Steam 테이블에 저장하였습니다");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		}
	}

	public void steamSpecParsing()
	{
		ArrayList<SteamVO> list = new ArrayList<>();
		ArrayList<GameVO> gamelist = new ArrayList<>();
		list = dao.getAppid();
		try {
			connSelenium();
			for(int i = 0; i<list.size();i++){
				SteamVO vo = new SteamVO();
				if(list.size()==20){
					break;
				}
				base_url = "https://store.steampowered.com/app/"+list.get(i).getAppid();
				driver.get(base_url);
				Thread.sleep(5000);

				List<WebElement> element = driver.findElements(By.className("bb_ul"));
				if(element.size()>0){
					String result=null;
					System.out.println("=========================================================================");
					System.out.println(list.get(i).getFit_name()+"의 사양");
					for(WebElement ele : element){ 
						if(ele.getText().contains("Processor")){
							result = ele.getText();
						}
					}
					String[] templist = result.split("\n");
					System.out.println(result);
				} else {
					System.out.println(list.get(i).getFit_name());
					Select age = new Select(driver.findElement(By.id("ageYear")));
					age.selectByValue("1999");
					System.out.println("시벌");
					WebElement temp = driver.findElement(By.xpath("//*[@id='app_agegate']/div[1]/div[4]/a[1]"));
					System.out.println("탱");
					temp.click();
					Thread.sleep(5000);
					i--;
				}
				System.out.println("=========================================================================");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.close();
		}
	}


	public boolean getCnt(String str) 
	{
		int result = dao.getCnt(str);
		System.out.println(result);
		if(result<1)
		{
			return false;
		} else return true;
	}

	public void updategpu() 
	{
		dao.updategpu();
	}



}
