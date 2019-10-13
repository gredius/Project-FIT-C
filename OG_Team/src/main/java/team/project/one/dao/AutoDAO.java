package team.project.one.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AutoDAO {

	@Autowired
	SqlSession session;
	
	
	public ArrayList<String> getlist(String keyvalue, String key) 
	{
		AutoMapper mapper = session.getMapper(AutoMapper.class);
		Map<String, String[]> templist = new HashMap<String,String[]>();
		String tempstr = "";
		tempstr = strtrim(keyvalue);
		String[] keyvaluearray = tempstr.split("");
		templist.put("keyvalue",keyvaluearray );
		
		
		if(key ==null){
			return mapper.getlistall(templist);
		} else if(key.equals("fit_cpu"))
		{
			return mapper.getlistcpu(templist);
		} else if(key.equals("fit_gpu"))
		{
			return mapper.getlistgpu(templist);
		} else if(key.equals("fit_ram"))
		{
			return mapper.getlistram(templist);
		} else if(key.equals("fit_mainboard"))
		{
			return mapper.getlistmainboard(templist);
		} else if(key.equals("fit_case"))
		{
			return mapper.getlistcase(templist);
		} else if(key.equals("fit_power"))
		{
			return mapper.getlistpower(templist);
		} else if(key.equals("fit_steam"))
		{
			return mapper.getliststeam(templist);
		} else 
		{
			return mapper.getlistall(templist);
		}
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
			}
		}
		System.out.println("strtrim2: "+tempstr);
		return tempstr;
	}
	

}
