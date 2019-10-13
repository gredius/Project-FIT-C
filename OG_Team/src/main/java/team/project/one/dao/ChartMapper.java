package team.project.one.dao;

import java.util.ArrayList;

import team.project.one.vo.GameVO;
import team.project.one.vo.SteamVO;

public interface ChartMapper {
	public ArrayList<GameVO> gamelist();

	public GameVO selectOneGame(GameVO vo);

	public ArrayList<SteamVO> steamparsing();

	public GameVO gameparsing(String appid);

}
