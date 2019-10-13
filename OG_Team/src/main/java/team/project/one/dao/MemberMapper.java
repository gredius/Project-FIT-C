package team.project.one.dao;

import team.project.one.vo.MemberVO;

public interface MemberMapper {
	public void signUP(MemberVO vo);
	public int checkID(MemberVO vo);
	public MemberVO logIN(MemberVO vo);
	public MemberVO searchInfo(MemberVO vo);
	public MemberVO searchPW(MemberVO vo);
	public void updateInfo(MemberVO vo);
	public void mailconfirm(MemberVO vo);

}
