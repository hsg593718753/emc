package com.huak.auth;

import com.github.pagehelper.PageHelper;
import com.huak.auth.dao.EmployeeDao;
import com.huak.auth.model.Employee;
import com.huak.base.dao.DateDao;
import com.huak.common.page.Convert;
import com.huak.common.page.Page;
import com.huak.common.page.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DateDao dateDao;

    /**
     * 分页查询
     * @param paramsMap 查询条件
     * @param page 分页信息
     * @return
     */
    @Override
    public PageResult<Employee> queryByPage(Map<String, Object> paramsMap, Page page) {
        PageHelper.startPage(page.getPageNumber(), page.getPageSize());
        return Convert.convert(employeeDao.selectPageByMap(paramsMap));
    }

    /**
     * 新增数据
     * @param employee
     * @return
     * @throws RuntimeException
     */
    @Override
    public int addEmployee(Employee employee) throws RuntimeException {
        employee.setCreateTime(dateDao.getTime());
        return employeeDao.insert(employee);
    }

    /**
     * 根据id查询实体
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Employee getEmployeeById(Long id) throws Exception {
        return employeeDao.selectByPrimaryKey(id);
    }

    /**
     * 修改数据
     * @param employee
     * @return
     * @throws Exception
     */
    @Override
    public int editEmployee(Employee employee) throws Exception {
        return employeeDao.updateByPrimaryKey(employee);
    }

    /**
     * 软删除
     * @param ids
     * @return
     * @throws Exception
     */
    @Override
    public int removeEmployee(String ids) throws Exception {
        return employeeDao.deleteByStatus(ids);
    }

    /**
     * 根据条件查询数据列表
     * @param paramsMap
     * @return
     */
    @Override
    public List<Employee> selectByMap(Map<String, Object> paramsMap) {
        return employeeDao.selectPageByMap(paramsMap);
    }

    /**
     * 导出
     * @param paramsMap
     * @return
     */
    @Override
    public List<Map<String, Object>> export(Map<String, Object> paramsMap) {
        return employeeDao.export(paramsMap);
    }
}