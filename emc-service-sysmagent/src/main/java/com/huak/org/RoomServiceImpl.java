package com.huak.org;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.huak.common.UUIDGenerator;
import com.huak.common.page.Convert;
import com.huak.common.page.Page;
import com.huak.common.page.PageResult;
import com.huak.org.dao.RoomDao;
import com.huak.org.model.Room;

/**
 * 户service实现
 * @author Administrator
 *
 */
@Service
public class RoomServiceImpl implements RoomService {
	
	@Resource
	private CommunityService communityService;
	
	@Resource
	private RoomDao roomDao;

	/**
	 * 查询户列表信息
	 */
	@Override
	@Transactional
	public PageResult<Room> list(Map<String, String> params,Page page) {
		PageHelper.startPage(page.getPageNumber(), page.getPageSize());
		return Convert.convert(roomDao.selectByPage(params));
	}

	/**
	 * 新增户信息
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int save(Room room) {
		int result = 0;
		try {
			room.setId(UUIDGenerator.getUUID());
			result = roomDao.insertRoom(room);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 修改户信息
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int edit(Room room) {
		int result = 0;
		try {
			result = roomDao.updateRoom(room);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 删除户信息
	 */
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int delete(String roomId) {
		int result = 0;
		try {
			result = roomDao.deleteRoom(roomId);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 根据主键获取户信息
	 */
	@Override
	@Transactional
	public Room get(String id) {
		return roomDao.get(id);
	}

	/**
	 * 导出户信息
	 */
	@Override
	public List<Map<String, Object>> exportRoom(Map<String, String> param) {
		return roomDao.export(param);
	}

	@Override
	public String getCompanySelectHtmlStr(String selectedComId) {
		return communityService.getCompanySelectHtmlStr(selectedComId);
	}

	@Override
	public String getCommunitySelectHtmlStr(Map<String, String> param,
			String selectedCommunityId) {
		return communityService.getCommunitySelectHtmlStr(param, selectedCommunityId);
	}

	@Override
	public String getBanSelectHtmlStr(Map<String, String> param,
			String selectedBanId) {
		return communityService.getBanSelectHtmlStr(param, selectedBanId);
	}

	@Override
	public String getCellSelectHtmlStr(Map<String, String> param,
			String selectedCellId) {
		return communityService.getCellSelectHtmlStr(param, selectedCellId);
	}

	@Override
	public String getLineSelectHtmlStr(Map<String, String> param, String selectedLineId) {
		return communityService.getLineSelectHtmlStr(param, selectedLineId);
	}

}
