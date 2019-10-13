package team.project.one.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface AutoMapper {

	ArrayList<String> getlistall(Map<String, String[]> templist);

	ArrayList<String> getlistcpu(Map<String, String[]> templist);

	ArrayList<String> getlistgpu(Map<String, String[]> templist);

	ArrayList<String> getlistram(Map<String, String[]> templist);

	ArrayList<String> getlistmainboard(Map<String, String[]> templist);

	ArrayList<String> getlistcase(Map<String, String[]> templist);

	ArrayList<String> getlistpower(Map<String, String[]> templist);

	ArrayList<String> getliststeam(Map<String, String[]> templist);

}
