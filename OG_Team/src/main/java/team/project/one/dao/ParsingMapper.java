package team.project.one.dao;

import java.util.ArrayList;

import team.project.one.vo.CaseVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PowerVO;
import team.project.one.vo.RamVO;
import team.project.one.vo.SteamVO;

public interface ParsingMapper {

	public int getnumber();

	public int getCnt(String str);
	
	public void insertMainBoard(ArrayList<MainBoardVO> list);

	public void insertPower(ArrayList<PowerVO> list);

	public void insertCpu(ArrayList<CpuVO> cpulist);

	public void insertCase(ArrayList<CaseVO> caselist);

	public void insertRam(ArrayList<RamVO> list);

	public void insertGpu(ArrayList<GpuVO> list);

	public void insertSteam(ArrayList<SteamVO> list);

	public void updatecpu();

	public void updategpu();

	public ArrayList<SteamVO> getAppid();

	public void insertGame(ArrayList<GameVO> gameList);

}
