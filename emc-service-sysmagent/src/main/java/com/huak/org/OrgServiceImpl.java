package com.huak.org;

import com.huak.base.dao.DateDao;
import com.huak.common.page.Page;
import com.huak.common.page.PageResult;
import com.huak.org.dao.AdministrativeDao;
import com.huak.org.dao.CompanyDao;
import com.huak.org.dao.OrgDao;
import com.huak.org.model.Administrative;
import com.huak.org.model.Company;
import com.huak.org.model.Org;
import com.huak.sys.dao.SysDicDao;
import com.huak.sys.model.SysDic;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/9.
 */

@Service
public class OrgServiceImpl implements OrgService {


    @Resource
    private AdministrativeDao administrativeDao;
    @Resource
    private OrgDao orgDao;
    @Resource
    private DateDao dateDao;
    @Resource
    private CompanyDao companyDao;
    @Resource
    private SysDicDao sysDicDao;


    @Override
    public int insert(Administrative season) {
        return 0;
    }

    @Override
    @Transactional(readOnly = false)
    public boolean delete(String id) {
        boolean flag=false;
        String[] ids = id.split(",");
        try {
            if(ids.length>1){
                for (int i = 0; i <ids.length ; i++) {
                    orgDao.deleteByPrimaryKey(Long.valueOf(ids[i]));
                }
                flag=true;
            }else{
                orgDao.deleteByPrimaryKey(Long.valueOf(ids[0]));
                flag=true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            flag=false;
        }
        return flag;
    }

    @Override
    public PageResult<Administrative> queryByPage(String name, Page page) {
        return null;
    }


    @Override
    public Administrative selectAdministrator() {
        return null;
    }


    @Override
    public List<Org> selectOrgAll(Map<String,Object> params) {
        System.out.print("----------------------service-------------------------");
        List<Org> lad = orgDao.selectOrgAll(params);
        return lad;
    }

    @Override
    public boolean insertOrg(Org org) {
        boolean flag=false;
        int i =orgDao.insert(org);
        if(i>0){
            flag=true;
        }
        return flag;
    }

    @Override
    public boolean checkOrgName(String orgName) {

        boolean flag=false;
        List<Org> list = orgDao.CheckOrgName(orgName);
            if(list.size()>0){
                flag=true;
            }
        return flag;
    }

    @Override
    public Org selectByPrimaryKey(String id) {
        Org org = orgDao.selectByPrimaryKey(Long.valueOf(id));
        return org;
    }

    @Override
    public boolean updateOrg(Org org) {
          boolean flag=false;
          int i =  orgDao.updateByPrimaryKeySelective(org);
          if(i>0){
              flag=true;
          }
        return flag;
    }
    @Override
    public List<Administrative> selectAll() {
        return null;
    }

    @Override
    public List<Map<String, Object>> selectOrgByMap(Map<String, Object> params) {
        return orgDao.selectOrgByMap(params);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Company> selectCompanyAll() {
        return companyDao.selectCompanyAll();
    }


    @Override
    @Transactional(readOnly = true)
    public List<SysDic> selectSysDicAll(String code) {
        Map<String,Object> map = new  HashMap<String,Object>();
        map.put("typeUs",code);
        return sysDicDao.selectAllByMap(map);
    }

    @Override
    public List<Map<String, Object>> selectOrgTree(Map<String, Object> paramsMap) {
        List<Map<String, Object>> data = orgDao.selectOrgTree(paramsMap);
        return data;
    }
}
