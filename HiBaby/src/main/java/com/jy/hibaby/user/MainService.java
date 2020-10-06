package com.jy.hibaby.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainService {
public int registProc(Map<String, Object>paramMap);
	
	public int registPlug(Map<String, Object>paramMap);
	
	
	public List userInfo (String id);
	
	public List getPlugInfo (String id);
	
	public List customView (Map<String, Object> paramMap);
	
	public int changePw(Map<String, Object>paramMap);
	
	public int changeEmail(Map<String, Object>paramMap);
	
	public int changePlug(Map<String, Object>paramMap);
	
	public int deletingPlug(Map<String, Object>paramMap);
	
	public String idchk(Map<String, Object>paramMap);
	
	public int addPlug(Map<String, Object>paramMap);

	public String getPw(Map<String, Object> paramMap);

	public void unregist(Map<String, Object> paramMap);

	public String getUserPwd(String id);

	public Object deleteAll(Map<String, Object> paramMap);
}
