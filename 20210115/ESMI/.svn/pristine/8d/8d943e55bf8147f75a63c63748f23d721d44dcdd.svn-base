package com.tectone.web.business.alarm;


import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.inject.Inject;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.tectone.web.model.AjaxBean;
import com.tectone.web.model.AlarmBean;
import com.tectone.web.object.ObjectCont;

import net.sf.json.JSONArray;


@Controller
@RequestMapping("/alarm/*")
public class AlarmCont extends ObjectCont {
	
	@Inject
	private AlarmService service;

	@Inject
	private Properties config;
	
	@Inject
	MessageSource messageSource;
	

	/**
	 * 알람룰 목록
	 * @param alarmBean
	 */
	@RequestMapping(value = "alarmrulemng.do")
	public ModelAndView alarmrulemng(
			AlarmBean alarmBean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("alarm_type_list", service.getCmcdList("ALARM_TYPE", "Y"));
			
			mv.addObject("viewName", "../../alarm/rule/alarmrulemng");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 알람 룰 목록 Ajax
	 * @param alarmBean
	 */
	@RequestMapping("alarmrulemngAjax.do")
	public @ResponseBody AjaxBean alarmrulemngAjax(
			AlarmBean alarmBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("alarmSqlMap.getAlarmRuleInfoList", alarmBean));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 알람 룰 상세
	 * @param alarmBean
	 * @param actionType
	 */
	@RequestMapping(value = "alarmruledetail.do")
	public ModelAndView alarmruledetail(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("action_type", action_type);
			mv.addObject("alarm_type_list", service.getCmcdList("ALARM_TYPE", "Y"));
			mv.addObject("sv_condition_list", service.getCmcdList("SV_CONDITION", "Y"));
			mv.addObject("tm_condition_list", service.getCmcdList("TIME_CONDITION", "Y"));
			mv.addObject("alarm_lvl_list", service.getCmcdList("ALARM_LEVEL", "Y"));
			mv.addObject("alarm_state_list", service.getCmcdList("ALARM_STATE", "Y"));
			mv.addObject("time_list", service.getCmcdList("TIME_CONDITION", "Y"));
			
			// 장치/변수/통지 정보 리스트
			
			mv.addObject("load_list", JSONArray.fromObject(service.selectList("alarmSqlMap.getLoadTree", alarmBean)).toString());
			mv.addObject("variable_list", JSONArray.fromObject(service.selectList("alarmSqlMap.getVariableTree", alarmBean)).toString());
			mv.addObject("noti_list", JSONArray.fromObject(service.selectList("alarmSqlMap.getNotiMappList", alarmBean)).toString());
			
			
			if( null != alarmBean && !"add".equals(alarmBean.getAction_type()) ){
				AlarmBean bean = service.selectOne("alarmSqlMap.getAlarmRuleInfo", alarmBean);
				bean.setMappList(service.selectList("alarmSqlMap.getAlarmRuleMappList", alarmBean));
				bean.setNotiMappList(service.selectList("alarmSqlMap.getAlarmRuleNotiMappList", alarmBean));
				
				mv.addObject("bean", bean);
			}
			
			
			mv.addObject("viewName", "../../alarm/rule/alarmruledetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 알람 룰 Action (추가/수정/삭제)
	 * @param alarmBean
	 * @param action_type
	 */
	@RequestMapping("alarmruleActionAjax.do")
	public @ResponseBody AjaxBean alarmruleActionAjax(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			if("AT_CEP".equals(alarmBean.getAlarm_type())){
				String url = config.getProperty("alarmagent.cep_validation_by_string_url");
				MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
				map.add("queryString", alarmBean.getCep_str());
				RestTemplate rest = new RestTemplate();
				String res = rest.postForObject(url, map, String.class);
				if(res == null || !"success".equals(res)) {
					Locale locale = (Locale)request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
					String msgCeperr = messageSource.getMessage("MESSAGE.CEPERROR", null, "CEP 쿼리가 유효하지 않습니다.", locale);
					ajaxBean.setMsg(""+msgCeperr+"\n\n"+ res);
					ajaxBean.setResult(false);
					return ajaxBean;
				}
			}
			
			service.alarmRuleAction(alarmBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}

	
	/**
	 * 알람리스트 목록
	 * @param alarmBean
	 */
	@RequestMapping(value = "alarmlistmng.do")
	public ModelAndView alarmlistmng(
			AlarmBean alarmBean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("alarm_type_list", service.getCmcdList("ALARM_TYPE", "Y"));
			mv.addObject("alarm_lvl_list", service.getCmcdList("ALARM_LEVEL", "Y"));
			mv.addObject("alarm_state_list", service.getCmcdList("ALARM_STATE", "Y"));
			
			mv.addObject("viewName", "../../alarm/list/alarmlistmng");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 알람 리스트 목록 Ajax
	 * @param alarmBean
	 */
	@RequestMapping("alarmlistmngAjax.do")
	public @ResponseBody AjaxBean alarmlistmngAjax(
			AlarmBean alarmBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("alarmSqlMap.getAlarmList", alarmBean));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 알람 리스트 상세
	 * @param alarmBean
	 * @param actionType
	 */
	@RequestMapping(value = "alarmlistdetail.do")
	public ModelAndView alarmlistdetail(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "modify") String action_type
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("action_type", action_type);
			mv.addObject("alarm_state_list", service.getCmcdList("ALARM_STATE", "Y"));
			
			if( "modify".equals(action_type) ){
				List<AlarmBean> list = service.selectList("alarmSqlMap.getAlarmList", alarmBean);
				if( list.size() > 0 ){
					mv.addObject("bean", list.get(0));
				}				
			}else if( "modify_batch".equals(action_type) ){
				mv.addObject("bean", alarmBean);
			}
			
			
			mv.addObject("viewName", "../../alarm/list/alarmlistdetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 알람 list Action (수정)
	 * @param alarmBean
	 * @param action_type
	 */
	@RequestMapping("alarmlistActionAjax.do")
	public @ResponseBody AjaxBean alarmlistActionAjax(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "modify") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			service.alarmlistAction(alarmBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	
	/**
	 * 통지 관리 목록
	 * @param alarmBean
	 */
	@RequestMapping(value = "alarmnotimng.do")
	public ModelAndView alarmnotimng(
			AlarmBean alarmBean
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("noti_type_list", service.getCmcdList("NOTI_TYPE", "Y"));
			
			mv.addObject("viewName", "../../alarm/noti/alarmnotimng");
			mv.setViewName("/common/layout/mng_layout_nolnb");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 통지 관리 목록 Ajax
	 * @param alarmBean
	 */
	@RequestMapping("alarmnotimngAjax.do")
	public @ResponseBody AjaxBean alarmnotimngAjax(
			AlarmBean alarmBean
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			ajaxBean.setData("list", service.selectList("alarmSqlMap.getAlarmNotiInfoList", alarmBean));
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
	
	/**
	 * 통지 관리 상세
	 * @param alarmBean
	 * @param actionType
	 */
	@RequestMapping(value = "alarmnotidetail.do")
	public ModelAndView alarmnotidetail(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.addObject("action_type", action_type);
			mv.addObject("noti_type_list", service.getCmcdList("NOTI_TYPE", "Y"));
			
			// noti 정보 
			if( null != alarmBean && !"add".equals(alarmBean.getAction_type()) ){
				List<AlarmBean> notiList = service.selectList("alarmSqlMap.getAlarmNotiInfoList", alarmBean);
				if( notiList.size() > 0 ){
					mv.addObject("bean", notiList.get(0));
				}
			}
			// noti - user mapp
			mv.addObject("user_list", JSONArray.fromObject(service.selectList("alarmSqlMap.getNotiUserMappList", alarmBean)).toString());
			
			mv.addObject("viewName", "../../alarm/noti/alarmnotidetail");
			mv.setViewName("/common/layout/mng_modal");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 통지관리 Action (추가/수정/삭제)
	 * @param alarmBean
	 * @param action_type
	 */
	@RequestMapping("alarmnotiActionAjax.do")
	public @ResponseBody AjaxBean alarmnotiActionAjax(
			AlarmBean alarmBean
			, @RequestParam(value = "action_type", defaultValue = "add") String action_type
			) {
		AjaxBean ajaxBean = new AjaxBean();
		try {
			
			service.alarmNotiAction(alarmBean, action_type);
			ajaxBean.setResult(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			ajaxBean.setSysmsg(e.getMessage());
		}
		return ajaxBean;
	}
}
