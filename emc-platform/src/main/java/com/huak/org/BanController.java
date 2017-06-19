package com.huak.org;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.huak.common.CommonExcelExport;
import com.huak.common.Constants;
import com.huak.common.page.Page;
import com.huak.common.page.PageResult;
import com.huak.org.model.Ban;

/**
 * 楼座controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/ban")
public class BanController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BanService banService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String listPage(Model model){
		logger.info("跳转到楼座列表页面");
		model.addAttribute("com", banService.getCompanySelectHtmlStr(null));
		model.addAttribute("community", banService.getCommunitySelectHtmlStr(new HashMap<String,String>(), null));
		return "/org/ban/list";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.PATCH)
	@ResponseBody
	public String list(@RequestParam Map<String,String> params,Page page){
		logger.info("查询楼座信息");
		JSONObject result = new JSONObject();
		//查询楼座信息
		PageResult<Ban> list = banService.list(params,page);
		result.put(Constants.LIST, list);
		logger.info("查询楼座信息："+list);
		return result.toJSONString();
	}
	
	@RequestMapping(value="/add/{companyId}",method=RequestMethod.GET)
	public String addPage(Model model,@PathVariable String companyId){
		logger.info("跳转到添加楼座页面");
		model.addAttribute("com", banService.getCompanySelectHtmlStr(companyId));
		Map<String,String> param = new HashMap<String,String>();
		param.put("level", "1");
		model.addAttribute("province", banService.getPCCTVSelectHtmlStr(param,null));
		return "/org/ban/add";
	}
	
	@RequestMapping(value="/communitySelectHtmlStr",method=RequestMethod.GET)
	@ResponseBody
	public String queryCommunitySelectHtmlStr(@RequestParam Map<String,String> param){
		logger.info("查询小区下拉框html字符串");
		JSONObject result = new JSONObject();
		String htmlStr = banService.getCommunitySelectHtmlStr(param,null);
		result.put("html", htmlStr);
		return result.toJSONString();
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(Ban ban){
		logger.info("添加楼座信息");
		JSONObject result = new JSONObject();
		try{
			result.put(Constants.FLAG, false);
			int save = banService.save(ban);
			if(save<=0){
				result.put(Constants.MSG, "添加楼座信息失败");
	        }else{
	        	result.put(Constants.FLAG, true);
	        	result.put(Constants.MSG, "添加楼座信息成功");
	        }
		}catch(Exception e){
			logger.error("添加楼座信息异常" + e.getMessage());
			result.put(Constants.MSG, "添加楼座信息异常");
		}
		return result.toJSONString();
	}
	
	@RequestMapping(value="/edit/{banId}",method=RequestMethod.GET)
	public String editPage(Model model,@PathVariable String banId){
		logger.info("跳转到修改楼座页面");
		Ban ban = banService.get(banId);
		if(ban!=null){
			model.addAttribute("ban", ban);
			model.addAttribute("com", banService.getCompanySelectHtmlStr(ban.getComId()));
			Map<String,String> param = new HashMap<String,String>();
			param.put("comId", ban.getComId());
			param.put("orgId", ban.getOrgId().toString());
			model.addAttribute("community", banService.getCommunitySelectHtmlStr(param,ban.getCommunityId()));
			param.put("level", "1");
			model.addAttribute("province", banService.getPCCTVSelectHtmlStr(param,ban.getProvinceId()));
			param.put("pCode", ban.getProvinceId());
			param.remove("level");
			param.put("level", "2");
			model.addAttribute("city", banService.getPCCTVSelectHtmlStr(param,ban.getCityId()));
			param.remove("pCode");
			param.put("pCode", ban.getCityId());
			param.remove("level");
			param.put("level", "3");
			model.addAttribute("county", banService.getPCCTVSelectHtmlStr(param,ban.getCountyId()));
			param.remove("pCode");
			param.put("pCode", ban.getCountyId());
			param.remove("level");
			param.put("level", "4");
			model.addAttribute("town", banService.getPCCTVSelectHtmlStr(param,ban.getTownId()));
			param.remove("pCode");
			param.put("pCode", ban.getTownId());
			param.remove("level");
			param.put("level", "5");
			model.addAttribute("village", banService.getPCCTVSelectHtmlStr(param,ban.getVillageId()));
		}
		return "/org/ban/edit";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public String edit(Ban ban){
		logger.info("修改楼座信息，楼座id:"+ban.getId());
		JSONObject result = new JSONObject();
		try{
			result.put(Constants.FLAG, false);
			int edit = banService.edit(ban);
			if(edit<=0){
				result.put(Constants.MSG, "修改楼座信息失败");
	        }else{
	        	result.put(Constants.FLAG, true);
	        	result.put(Constants.MSG, "修改楼座信息成功");
	        }
		}catch(Exception e){
			logger.error("修改楼座信息异常" + e.getMessage());
			result.put(Constants.MSG, "修改楼座信息异常");
		}
		return result.toJSONString();
	}
	
	@RequestMapping(value="/delete/{banId}",method=RequestMethod.POST)
	@ResponseBody
	public String delete(@PathVariable String banId){
		logger.info("删除楼座信息，楼座id："+banId);
		JSONObject result = new JSONObject();
		try{
			result.put(Constants.FLAG, false);
			int delete = banService.delete(banId);
			if(delete<=0){
				result.put(Constants.MSG, "删除楼座信息失败");
	        }else{
	        	result.put(Constants.FLAG, true);
	        	result.put(Constants.MSG, "删除楼座信息成功");
	        }
		}catch(Exception e){
			logger.error("删除楼座信息异常" + e.getMessage());
			result.put(Constants.MSG, "删除楼座信息异常");
		}
		return result.toJSONString();
	}
	
	@RequestMapping(value = "/export", method = RequestMethod.GET)
    public void export(@RequestParam Map<String, String> param, HttpServletResponse response) {
        logger.info("导出楼座列表EXCEL");
        try {
        	JSONObject jo = new JSONObject();
	        jo.put(Constants.FLAG, false);
	        Map<String, String> cellName = new LinkedHashMap<>();//列标题(有序)
	        cellName.put("ban_name", "楼座名称");
	        cellName.put("community_name", "小区名称");
	        cellName.put("com_name", "所属公司");
	        cellName.put("org_name", "所属机构");
	        List<Map<String, Object>> cellValues = banService.exportBan(param);
            if(cellValues==null){
            	jo.put(Constants.MSG, "导出失败");
            }else if(cellValues.size()==0){
            	jo.put(Constants.MSG, "没有数据要导出");
            }else{
            	jo.put(Constants.MSG, "导出失败");
            	HSSFWorkbook wb = CommonExcelExport.excelExport(cellName, cellValues);
            	OutputStream out = response.getOutputStream();
            	//输出Excel文件  
            	String mimetype = "application/vnd.ms-excel";
                response.setContentType(mimetype);
                response.setCharacterEncoding("UTF-8");
                String fileName = "banInfo.xls";
                response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
                wb.write(out);
                out.flush();
            }
        } catch (Exception e) {
            logger.error("导出楼座列表EXCEL异常" + e.getMessage());
        }
    }
	
}