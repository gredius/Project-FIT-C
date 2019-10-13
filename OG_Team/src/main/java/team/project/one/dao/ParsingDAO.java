package team.project.one.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.one.vo.CaseVO;
import team.project.one.vo.CpuVO;
import team.project.one.vo.GameVO;
import team.project.one.vo.GpuVO;
import team.project.one.vo.MainBoardVO;
import team.project.one.vo.PowerVO;
import team.project.one.vo.RamVO;
import team.project.one.vo.SteamVO;

@Repository
public class ParsingDAO {

	@Autowired
	SqlSession session;
	
	public int getnumber() 
	{
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		return mapper.getnumber();
	}
	
	
	public int getCnt(String str) 
	{
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		return mapper.getCnt(str);
	}
	
	public void insertMainBoard(ArrayList<MainBoardVO> list) 
	{
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertMainBoard(list);
	}

	public void insertPower(ArrayList<PowerVO> list) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertPower(list);
	}


	public void insertCpu(ArrayList<CpuVO> cpulist) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertCpu(cpulist);
	}


	public void insertCase(ArrayList<CaseVO> caselist) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertCase(caselist);
		
	}


	public void insertRam(ArrayList<RamVO> list) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertRam(list);
		
	}


	public void insertGpu(ArrayList<GpuVO> list) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertGpu(list);
	}


	public void insertSteam(ArrayList<SteamVO> list) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.insertSteam(list);
		
	}


	public void updategpu() 
	{
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		mapper.updategpu();
	}


	public ArrayList<SteamVO> getAppid() {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		return mapper.getAppid();
	}


	public void insertGame(ArrayList<GameVO> gameList) {
		ParsingMapper mapper = session.getMapper(ParsingMapper.class);
		for(GameVO gmvo : gameList){
			System.out.println(gmvo.getGameram());
		}
		mapper.insertGame(gameList);
		
	}

}
