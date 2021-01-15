package com.tectone.web.business.setting.tree;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.tectone.util.CsvUtil;
import com.tectone.util.StringUtil;
import com.tectone.web.common.abstractinfo.AbstractService;
import com.tectone.web.model.AlarmBean;
import com.tectone.web.model.CommonBean;
import com.tectone.web.model.TreeInfoBean;



@Service
public class TreeInfoService extends AbstractService {
	
	@Inject
	private TreeInfoDao dao;
 
	/**
	 * 장치그룹(트리) Action(추가/수정)
	 */
	public void treeAction(TreeInfoBean treeInfoBean) throws Exception {
		
		switch (treeInfoBean.getAction_type()) {
		case "add":
			insertTreeInfo(treeInfoBean);
			break;
		case "modify":
			// root 장치그룹(트리)이 아닐때,
			if(treeInfoBean.getP_tree_seq() != 0){
				
				TreeInfoBean p_bean = dao.selectOne("treeinfoSqlMap.getTreeDetail", treeInfoBean.getP_tree_seq());
				//부모 노드가 미사용인데 자식노드 사용으로 바꾸려 할때 변경 불가
				if("N".equals(p_bean.getUse_yn()) && "Y".equals(treeInfoBean.getUse_yn())){
					throw new Exception("상위 장치그룹이 미사용이므로, 현재 장치그룹을 사용으로 저장할 수 없습니다.");
				}
			}
			updateTreeInfo(treeInfoBean);
			break;
		case "delete":
			break;
		}
	}

	/**
	 * 트리 추가
	 * @param treeInfoBean
	 * @throws Exception
	 */
	public void insertTreeInfo(TreeInfoBean treeInfoBean) throws Exception {

		// depth_ord 설정(트리 depth_ord의 최대값)
		int	max_depth_ord = dao.selectOne("treeinfoSqlMap.getTreeMaxDepthOrd", treeInfoBean.getP_tree_seq());
		treeInfoBean.setDepth_ord(max_depth_ord);
		
		// 트리 추가
		dao.insert("treeinfoSqlMap.insertTreeInfo", treeInfoBean);
		
		// 트리 추가할때, 상위 트리 권한이 있는 사용자에게 현재 트리 권한 추가
		if(treeInfoBean.getP_tree_seq() > 0) {
			dao.insert("treeinfoSqlMap.insertTreeUserMappByPtree", treeInfoBean);
		}
		
		// 사용자 매핑
//		String[] arryUserId = treeInfoBean.getSeq_str().split(",");
//		for( String userId : arryUserId ){
//			if( "".equals(userId) ) continue;
//			treeInfoBean.setUser_id(userId);
//			dao.insert("treeinfoSqlMap.insertTreeUserMapp", treeInfoBean);
//		}
	}

	/**
	 * 트리 수정
	 * @param treeInfoBean
	 * @throws Exception
	 */
	public void updateTreeInfo(TreeInfoBean treeInfoBean) throws Exception {
		
		// 트리 수정
		dao.update("treeinfoSqlMap.updateTreeInfo", treeInfoBean);
		
		// 사용자 매핑 삭제
//		dao.delete("treeinfoSqlMap.deleteTreeUserMap", treeInfoBean);
//		// 사용자 매핑 추가
//		String[] arryUserId = treeInfoBean.getSeq_str().split(",");
//		for( String userId : arryUserId ){
//			if( "".equals(userId) ) continue;
//			treeInfoBean.setUser_id(userId);
//			dao.insert("treeinfoSqlMap.insertTreeUserMapp", treeInfoBean);
//		}
		
		// 현재 트리의 하위 트리 전체 사용유무 변경
		dao.update("treeinfoSqlMap.updateTreeUseYn", treeInfoBean);
	}

	/**
	 * 트리 상하 이동 Action
	 */
	public void treeUpDownAction(TreeInfoBean treeInfoBean, String action_type) throws Exception {
		
		TreeInfoBean temp = null;
		if(action_type.equals("up")) {
			//나보다 위에 순서에 있는 노드정보를 가지고 온다
			temp = dao.selectOne("getUpOrderTree", treeInfoBean);
		}else if(action_type.equals("down")) {
			//나보다 아래 순서에 있는 노드정보를 가지고 온다
			temp = dao.selectOne("getDownOrderTree", treeInfoBean);
		}
		
		if(temp != null) {
			// 순서 변경
			int nowOrd = treeInfoBean.getDepth_ord();
			treeInfoBean.setDepth_ord(temp.getDepth_ord());
			temp.setDepth_ord(nowOrd);
			
			//현재것보다 (위 or 아래)에 있는 순번을 현재의 순번으로 바꾼다.
			dao.update("treeinfoSqlMap.updateTreeInfoOrder", temp);
			
			//현재순번을 (위 or 아래)의 순번으로 변경을 한다.			
			dao.update("treeinfoSqlMap.updateTreeInfoOrder", treeInfoBean);
		}
	}
	
	/**
	 * 트리 이동
	 * @param treeInfoBean
	 * @throws Exception
	 */
	public void treeMoveAction(TreeInfoBean treeInfoBean) throws Exception {
		
		//이동할 노드 정보 soruce node
		TreeInfoBean source_bean = new TreeInfoBean();
		source_bean.setTree_seq(treeInfoBean.getS_tree_seq());
		source_bean.setLogin_user_id(treeInfoBean.getLogin_user_id());
		source_bean	= dao.selectOne("treeinfoSqlMap.getTreeDetail", source_bean);
		
		//이동될 노드 정보 target node
		TreeInfoBean target_bean = new TreeInfoBean();
		target_bean.setTree_seq(treeInfoBean.getT_tree_seq());
		target_bean.setLogin_user_id(treeInfoBean.getLogin_user_id());
		target_bean	= dao.selectOne("treeinfoSqlMap.getTreeDetail", target_bean);
		
		//현재 노드의 순번 이하의 노드 들을 -1씨해서 빈 순번 채워 준다
		dao.update("treeinfoSqlMap.shiftForwardTreeOrder", source_bean);
		
		//이동될 노드의 순번 다음 순번으로 이동하고 하고 parent_id변경을 한다.
		// target node 순번 +1로 한다
		int	max_depth_ord = dao.selectOne("treeinfoSqlMap.getTreeMaxDepthOrd", target_bean.getTree_seq());
		source_bean.setDepth_ord(max_depth_ord);
		source_bean.setP_tree_seq(target_bean.getTree_seq());
		dao.update("treeinfoSqlMap.moveTreeOtherNode", source_bean);
	}
	
	/**
	 * 좌측트리
	 * @param treeInfoBean
	 * @throws Exception
	 */
	public List<Map<String, Object>> getLnbTreeList(TreeInfoBean treeInfoBean) throws Exception {
		List<Map<String, Object>> list = selectList("treeinfoSqlMap.getLnbTreeList", treeInfoBean);
		
		int ifHasChecked = 0;
		for (Map<String, Object> obj : list) {
			if (obj.get("checked").equals(1)) {
				ifHasChecked++;
				obj.put("checked", true);
			}
		}
		if (ifHasChecked > 0) return list;
		
		// 첫번째 값에 적용(첫번째 값 checked)
		list = doLnbTreeFirstBean(list, new Function<Map<String,Object>, Map<String,Object>>() {
			@Override
			public Map<String, Object> apply(Map<String, Object> t) {
				t.put("checked", true);
				return t;
			}
		});
		
		return list;
	}
	
	/**
	 * 좌측트리 첫번째 값에 작용
	 */
	public List<Map<String, Object>> doLnbTreeFirstBean(List<Map<String, Object>> list, Function<Map<String, Object>, Map<String, Object>> func) throws Exception {
		
		// 첫번째 트리에만 checked 한다.(첫번째로 가장 깊은 뎁스의 트리)
		Integer beforeLevel = 0;
		for(int i = 0; i < list.size(); i++) {
			String nowLevelStr = list.get(i).get("tree_level").toString();
			Integer nowLevel = null;
			if(StringUtil.isEmpty(nowLevelStr)) {
				nowLevel = 1;
			}else {
				nowLevel = Integer.parseInt(nowLevelStr);
			}
			if(nowLevel > beforeLevel) {
				if((i + 1) < list.size()) {
					String afterLevelStr = list.get(i + 1).get("tree_level").toString();
					Integer afterLevel = null;
					if(StringUtil.isEmpty(afterLevelStr)) {
						afterLevel = 1;
					}else {
						afterLevel = Integer.parseInt(afterLevelStr);
					}
					if(nowLevel >= afterLevel) {
						list.set(i, func.apply(list.get(i)));
//						list.get(i).put("checked", true);
						break;
					}
				}else {
					list.set(i, func.apply(list.get(i)));
//					list.get(i).put("checked", true);
					break;
				}
			}
			beforeLevel = nowLevel;
		}
		
		return list;
	}
	
	/**
	 * 좌측트리 첫번째 값 가져오기
	 */
	public Map<String, Object> getLnbTreeFirstBean(List<Map<String, Object>> list) throws Exception {
		
		// 첫번째 트리에만 checked 한다.(첫번째로 가장 깊은 뎁스의 트리)
		Integer beforeLevel = 0;
		for(int i = 0; i < list.size(); i++) {
			String nowLevelStr = list.get(i).get("tree_level").toString();
			Integer nowLevel = null;
			if(StringUtil.isEmpty(nowLevelStr)) {
				nowLevel = 1;
			}else {
				nowLevel = Integer.parseInt(nowLevelStr);
			}
			if(nowLevel > beforeLevel) {
				if((i + 1) < list.size()) {
					String afterLevelStr = list.get(i + 1).get("tree_level").toString();
					Integer afterLevel = null;
					if(StringUtil.isEmpty(afterLevelStr)) {
						afterLevel = 1;
					}else {
						afterLevel = Integer.parseInt(afterLevelStr);
					}
					if(nowLevel >= afterLevel) {
						return list.get(i);
					}
				}else {
					return list.get(i);
				}
			}
			beforeLevel = nowLevel;
		}
		
		return null;
	}

	/**
	 * 알람 Rule 정보 엑셀 Export
	 * @param m
	 * @param res
	 * @throws IOException 
	 */
	public void createTreeExcel(Map<String, Object> m, HttpServletResponse res) throws IOException {
		String excelTitleStr = "tree_seq|p_tree_seq|tree_nm|depth_ord|tree_desc|dvc_seq|";
				excelTitleStr += "tree_kd|use_yn";
				
		CommonBean bean = new CommonBean();
		bean.setExcelFileName(String.valueOf(m.get("excelFileName")));
		bean.setTitleList(excelTitleStr);
		bean.setColumnList(excelTitleStr);
		
		List<Map<String, Object>> list = dao.selectList("treeinfoSqlMap.getTreeExcelData", m);
		
		CsvUtil.createCSVFile(res, list, bean.getTitleList(), bean.getColumnList(), bean.getExcelFileName());
	}

	/**
	 * 
	 * @param destFile
	 */
	public void treeInfoImport(String fPath, String loginUserId) {
		BufferedReader br = null;
		
		dao.delete("treeinfoSqlMap.deleteTreeByUpload", null);
		
        try{
            br = Files.newBufferedReader(Paths.get(fPath));
            
            int idx = 0;
            List<String> colList = new ArrayList<String>();
            String line = "";
            while((line = br.readLine()) != null){
            	TreeInfoBean bean = new TreeInfoBean();
            	Map<String, Object> treeMap = new HashMap<String, Object>();
            	treeMap.put("login_user_id", loginUserId);
            	String array[] = line.split(",");
            	if(idx == 0) {
            		colList = Arrays.asList(array);
            		idx++;
            		continue;
            	}else {
        			for(int i=0; i<array.length; i++) {
        				// rule info map
        				treeMap.put(colList.get(i), array[i]);
            		}
        			bean = mapToTreeInfoBean(treeMap);
        			bean.setGen_by(loginUserId);
    				dao.insert("treeinfoSqlMap.insertTreeInfoByUpload", bean);
            	}
            }
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(br != null){
                    br.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
	}
	
	private TreeInfoBean mapToTreeInfoBean(Map<String, Object> map) {
		TreeInfoBean bean = new TreeInfoBean(); 
		Iterator<String> iter = map.keySet().iterator();
		while(iter.hasNext()) {
			String key = iter.next();
			Object val = map.get(key);
			if("﻿﻿tree_seq".equals(key)) bean.setTree_seq("".equals(val) ? null : Integer.parseInt(String.valueOf(val)));
			if("p_tree_seq".equals(key)) bean.setP_tree_seq("".equals(val) ? null : Integer.parseInt(String.valueOf(val)));
			if("tree_nm".equals(key)) bean.setTree_nm(String.valueOf(val));
			if("depth_ord".equals(key)) bean.setDepth_ord("".equals(val) ? null : Integer.parseInt(String.valueOf(val)));
			if("tree_desc".equals(key)) bean.setTree_desc(String.valueOf(val));
			if("dvc_seq".equals(key)) bean.setDvc_seq("".equals(val) ? null : Integer.parseInt(String.valueOf(val)));
			if("tree_kd".equals(key)) bean.setTree_kd(String.valueOf(val));
			if("use_yn".equals(key)) bean.setUse_yn(String.valueOf(val));
		}
		return bean;
	}
}
