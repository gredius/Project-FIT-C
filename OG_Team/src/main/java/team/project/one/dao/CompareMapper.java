package team.project.one.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import team.project.one.vo.CaseVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PCEstimateVO;
import team.project.one.vo.PowerVO;
import team.project.one.vo.RamVO;

public interface CompareMapper {
	public ArrayList<CpuVO> searchCPU(String cpuname);
	public ArrayList<MainBoardVO> searchMB(String name);
	public ArrayList<GpuVO> searchGP(String product_name);
	public ArrayList<RamVO> searchRAM(String name);
	public GameVO selectGame(Map<String, String> tempmap);
	public ArrayList<CpuVO> getcpu(HashMap<String, String> cpumap);
	public ArrayList<MainBoardVO> getmain(HashMap<String, String> mainmap);
	public ArrayList<CaseVO> getcase(HashMap<String, String> casemap);
	public ArrayList<PowerVO> getpower(HashMap<String, String> powermap);
	public void saveesti(PCEstimateVO vo);

}
