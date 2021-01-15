package com.tectone.web.business.setting.tree;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tectone.util.JsonUtil;
import com.tectone.util.RequestUtil;
import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.CommonBean;
import com.tectone.web.model.TreeInfoBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/treemng/*")
public class TreeInfoCont extends ObjectCont {
	
	@Inject
	private TreeInfoService service;
	
	@Inject
	private Properties config;
	
	
	/**
	 * 레이아웃 좌측 Tree
	 */
	@RequestMapping(value = "lnbTreeAjax.do")
	public @ResponseBody AjaxBean lnbTreeAjax(
			TreeInfoBean treeInfoBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", JsonUtil.getRecursiveJson(JSONArray.fromObject(service.getLnbTreeList(treeInfoBean)), "tree_seq", "p_tree_seq").toString());
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 트리 리스트 ( 1뎁스만 )
	 */
	@RequestMapping(value = "tree1depthMng.do")
	public ModelAndView tree1depthMng(
			TreeInfoBean treeInfoBean
			) {
		ModelAndView mv = new ModelAndView();
		try {

			mv.addObject("viewName", "../../setting/tree/1depth/tree1depthMng");
			mv.setViewName("/common/layout/mng_layout_lnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 트리 리스트 ( 1뎁스만 ) Ajax
	 */
	@RequestMapping(value = "tree1depthMngAjax.do")
	public @ResponseBody AjaxBean tree1depthMngAjax(
			TreeInfoBean treeInfoBean,
			HttpServletResponse res
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			// 1 level 값 가져오기
			treeInfoBean.setS_type("1");
			treeInfoBean.setLevel(1);
			ajaxBean.setData("list", JSONArray.fromObject(service.selectList("treeinfoSqlMap.getTreeList", treeInfoBean)).toString());
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 트리 리스트 ( 해당 1뎁스의 하위 리스트 )
	 */
	@RequestMapping(value = "treeMngFromParent.do")
	public ModelAndView treeMngFromParent(
			TreeInfoBean treeInfoBean
			) {
		ModelAndView mv = new ModelAndView();
		try {

			List<TreeInfoBean> list = service.selectList("treeinfoSqlMap.getTreeListFromParent", treeInfoBean);
			mv.addObject("list", list);
			if(list.size() > 0) {
				mv.addObject("bean", list.get(0));
			}else {
				mv.addObject("bean", service.selectList("treeinfoSqlMap.getTreeDetail", treeInfoBean));
			}
			
			mv.addObject("depth1_seq", treeInfoBean.getTree_seq());
			mv.addObject("viewName", "../../setting/tree/treeMngFromParent");
			mv.setViewName("/common/layout/mng_layout_lnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 트리 리스트 ( 해당 1뎁스의 하위 리스트 ) Ajax
	 */
	@RequestMapping(value = "treeMngFromParentAjax.do")
	public @ResponseBody AjaxBean treeMngFromParentAjax(
			TreeInfoBean treeInfoBean,
			HttpServletResponse res
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {

//			List<TreeInfoBean> l = service.selectList("treeinfoSqlMap.getDvcChildTreeList", treeInfoBean);
//			List<TreeInfoBean> l = service.selectList("operationSqlMap.getDetectTreeList", treeInfoBean);
//			ajaxBean.setData("tree_list", JsonUtil.getRecursiveJson(JSONArray.fromObject(l), "id", "parendId").toString());
			List<TreeInfoBean> tmp = service.selectList("treeinfoSqlMap.getDvcChildTreeList", treeInfoBean);
			ajaxBean.setData("list", tmp);
//			ajaxBean.setData("list", JSONArray.fromObject(tmp).toString());
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 트리 상세보기, 신규, 수정 등
	 * @param treeInfoBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping(value = "treedetail.do")
	public ModelAndView treedetail(
			TreeInfoBean treeInfoBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		
		ModelAndView mv = new ModelAndView();
		try {
			
			switch (action_type) {
			case "add": // 하위트리 추가
				mv.addObject("bean", treeInfoBean);
				break;
			case "modify": // 수정
				mv.addObject("bean", service.selectOne("treeinfoSqlMap.getTreeDetail", treeInfoBean));
				break;
			}
			
			mv.addObject("depth1_seq", treeInfoBean.getDepth1_seq());
			mv.addObject("action_type", action_type);
			// 트리 타입 list
			mv.addObject("tree_list", service.getCmcdList("TREE_KD", "Y"));
			// 사용자 list
//			mv.addObject("user_list", JSONArray.fromObject(service.selectList("treeinfoSqlMap.getTreeUserMapByTreeSeq", treeInfoBean)).toString());
			// 장치 list
			mv.addObject("dvc_list", JSONArray.fromObject(service.selectList("deviceSqlMap.getDeviceList")).toString());
			
			mv.addObject("viewName", "../../setting/tree/treedetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 트리 저장, 수정 process
	 * @param treeInfoBean
	 * @param action_type
	 * @return
	 */
	@RequestMapping(value = "treeActionAjax.do")
	public @ResponseBody AjaxBean treeActionAjax(
			TreeInfoBean treeInfoBean,
			HttpServletResponse res
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			service.treeAction(treeInfoBean);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 트리 순서 이동(Up / Down) Ajax
	 */
	@RequestMapping(value = "treeUpDownActionAjax.do")
	public @ResponseBody AjaxBean treeUpDownActionAjax(
			TreeInfoBean treeInfoBean
			, @RequestParam(value = "action_type", defaultValue = "up") String action_type,
			HttpServletResponse res
			) {
		AjaxBean ajaxBean = new AjaxBean();
		
		try {
			service.treeUpDownAction(treeInfoBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 트리 이동(부모노드 변경)
	 * @param treeInfoBean
	 * @return
	 */
	@RequestMapping(value = "treeMovePopup.do")
	public ModelAndView treemovePopup(
			TreeInfoBean treeInfoBean
			){
		
		ModelAndView mv = new ModelAndView();
		try {
			
			// 넘겨받은 레벨보다 낮은 레벨만 보여준다.(동일 뎁스로만 이동하기위해)
			treeInfoBean.setS_type("2");  
			mv.addObject("list", service.selectList("treeinfoSqlMap.getTreeList", treeInfoBean));
			mv.addObject("bean",treeInfoBean);
			
			mv.addObject("viewName", "../../setting/tree/treeMovePopup");
			mv.setViewName("/common/layout/mng_modal");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 트리 이동 Ajax(부모노드 변경)
	 */
	@RequestMapping(value = "treeMoveActionAjax.do")
	public @ResponseBody AjaxBean treeMoveActionAjax(
			TreeInfoBean treeInfoBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		
		try {

			service.treeMoveAction(treeInfoBean);
			ajaxBean.setResult(true);

		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 장치그룹관리 엑셀 다운로드
	 * @param alarmBean
	 * @throws ServletException 
	 */
	@RequestMapping("treeExcelExport.do")
	public @ResponseBody AjaxBean alarmRuleExcelAjax( HttpServletRequest req, HttpServletResponse res) throws ServletException{
		AjaxBean ajaxBean = new AjaxBean();
		Map<String, Object> m = RequestUtil.getReqParamToMap(req);
		try{
			service.createTreeExcel(m, res);				
		}catch( Exception e ){
			e.printStackTrace();
		}
		return ajaxBean;
	}
	
	/**
	 * 장치그룹관리 업로드 팝업
	 * @param alarmBean
	 * @param actionType
	 */
	@RequestMapping(value = "treeExcelUpload.do")
	public ModelAndView alarmruleimport() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("viewName", "../../setting/tree/exceluploadpop");
			mv.setViewName("/common/layout/mng_modal");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 장치그룹관리 엑셀파일 데이터 저장
	 * @param alarmBean
	 * @param actionType
	 */
	@RequestMapping(value = "treeExcelImport.do", method = RequestMethod.POST)
	public @ResponseBody AjaxBean alarmruleimportAjax(MultipartHttpServletRequest request, CommonBean bean) throws Exception{
		AjaxBean ajaxBean = new AjaxBean();
		try {
			 MultipartFile excelFile =request.getFile("excelFile");
		        //System.out.println("엑셀 파일 업로드 컨트롤러");
	        
	        if(excelFile == null || excelFile.isEmpty()){
	            throw new RuntimeException("CSV파일을 선택 해 주세요.");
	        }
	        
	        String fPath = config.getProperty("temp.file.uplaod.path")+excelFile.getOriginalFilename();
	        File destFile = new File(fPath);
	        try{
	            excelFile.transferTo(destFile);
	        }catch(IllegalStateException | IOException e){
	            throw new RuntimeException(e.getMessage(),e);
	        }

	        service.treeInfoImport(fPath, bean.getLogin_user_id());
	        
	        ajaxBean.setResult(true);
	        destFile.delete();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return ajaxBean;
	}
	
}