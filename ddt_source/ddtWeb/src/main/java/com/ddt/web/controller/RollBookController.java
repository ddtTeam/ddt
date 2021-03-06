/*
 * @(#)RollBookController.java 2014-4-24
 *
 */
package com.ddt.web.controller;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ddt.core.bean.Pagination;
import com.ddt.core.meta.RollBook;
import com.ddt.core.meta.RollBookInfo;
import com.ddt.core.meta.RollBookUser;
import com.ddt.core.meta.User;
import com.ddt.core.meta.UserRollInfo;
import com.ddt.core.service.RollBookInfoService;
import com.ddt.core.service.RollBookService;
import com.ddt.core.service.UserRollInfoService;
import com.ddt.core.service.UserService;
import com.ddt.core.utils.DateUtils;
import com.ddt.web.utils.POIFillUtil;
import com.ddt.web.utils.POILayoutUtil;

/**
 * RollBookController.java
 * 
 * @author <A HREF="mailto:ruan635@163.com">Roy</A>
 * @version 1.0 2014-4-24
 * @since 1.0
 */
@Controller
@RequestMapping("/rollbook")
public class RollBookController extends BaseController {

	@Autowired
	private RollBookService rollBookService;

	@Autowired
	private UserService userService;

	@Autowired
	private RollBookInfoService rollBookInfoService;
	
	@Autowired
	private UserRollInfoService userRollInfoService;

	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/main");

		String queryValue = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "query", ""));
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);

		Pagination pagination = new Pagination();
		pagination.setPage(page);

		long userId = getUserId();

		List<RollBook> rollBooks = rollBookService.getRollBookList(userId,
				queryValue, pagination.getLimit(), pagination.getOffset());
		int count = rollBookService.getRollBookCount(userId, queryValue);

		view.addObject("rollBooks", rollBooks);
		view.addObject("query", queryValue);
		view.addObject("page", page);
		view.addObject("totalPage",
				(int) Math.ceil(count * 1.0 / pagination.getLimit()));
		view.addObject("pageUrl", "/rollbook/list?query=" + queryValue);
		return view;
	}

	/**
	 * 查看点名册名单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("userlist")
	public ModelAndView userList(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/userlist");

		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		long rollBookId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		Pagination pagination = new Pagination();
		pagination.setPage(page);

		long userId = getUserId();

		RollBook rollBook = rollBookService.getRollBookById(rollBookId, userId);
		if (rollBook == null) {
			return null;
		}

		List<User> users = userService.getRollBookUserList(rollBookId,
				pagination.getLimit(), pagination.getOffset());
		int count = userService.getRollBookUserCount(rollBookId);

		view.addObject("users", users);
		view.addObject("page", page);
		view.addObject("rid", rollBookId);
		view.addObject("totalPage",
				(int) Math.ceil(count * 1.0 / pagination.getLimit()));
		view.addObject("pageUrl", "/rollbook/userlist?rid=" + rollBookId);

		return view;
	}

	/**
	 * 查看点名册名单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("roll")
	public ModelAndView roll(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/roll");

		long rollBookId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		long userId = getUserId();

		RollBook rollBook = rollBookService.getRollBookById(rollBookId, userId);

		view.addObject("rollBook", rollBook);

		return view;
	}

	/**
	 * 查看点名册名单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("view")
	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/view");

		long rollBookId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		long userId = getUserId();

		RollBook rollBook = rollBookService.getRollBookById(rollBookId, userId);

		view.addObject("rollBook", rollBook);

		return view;
	}
	
	/**
	 * 保存点名册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("save")
	public ModelAndView save(HttpServletRequest request,
			HttpServletResponse response) {
		long rid = ServletRequestUtils.getLongParameter(request, "id", 0);
		String name = StringUtils.trim(ServletRequestUtils.getStringParameter(
				request, "name", ""));
		String validStartDate = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "validStartDate", ""));
		String validEndDate = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "validEndDate", ""));
		int userCount = ServletRequestUtils.getIntParameter(request,
				"userCount", 0);

		long userId = getUserId();

		boolean isAdd = false;

		RollBook rollBook = rollBookService.getRollBookById(rid, userId);
		if (rollBook == null) {
			rollBook = new RollBook();
			isAdd = true;
		}

		rollBook.setName(name);
		rollBook.setUserCount(userCount);
		rollBook.setUserId(userId);
		rollBook.setValidStartTime(DateUtils.parseStringToDate(
				DateUtils.DATE_FORMAT, validStartDate));
		rollBook.setValidEndTime(DateUtils.parseStringToDate(
				DateUtils.DATE_FORMAT, validEndDate));

		if (isAdd) {
			rollBookService.addRollBook(rollBook);
		} else {
			rollBookService.updateRollBook(rollBook);
		}

		return new ModelAndView(new RedirectView("/rollbook/list"));
	}

	/**
	 * 保存点名册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("saveinfo")
	public ModelAndView saveInfo(HttpServletRequest request,
			HttpServletResponse response) {

		long rid = ServletRequestUtils.getLongParameter(request, "id", 0);
		String rollStartTime = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "rollStartTime", ""));
		String rollEndTime = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "rollEndTime", ""));
		String rollCode = StringUtils.trim(ServletRequestUtils
				.getStringParameter(request, "rollCode", ""));
		int userCount = ServletRequestUtils.getIntParameter(request,
				"userCount", 0);

		long userId = getUserId();

		RollBookInfo rollBookInfo = new RollBookInfo();

		rollBookInfo.setRollUserCount(userCount);
		rollBookInfo.setUserId(userId);
		rollBookInfo.setRollStartTime(DateUtils.parseStringToDate(
				DateUtils.DATE_FORMAT, rollStartTime));
		rollBookInfo.setRollEndTime(DateUtils.parseStringToDate(
				DateUtils.DATE_FORMAT, rollEndTime));
		rollBookInfo.setRollBookId(rid);
		rollBookInfo.setRollCode(rollCode);

		rollBookInfoService.addRollBookInfo(rollBookInfo);

		return new ModelAndView(new RedirectView(
				"/rollbook/rollinfo?roll_book_id=" + rid));
	}

	/**
	 * 删除点名册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView del(HttpServletRequest request,
			HttpServletResponse response) {

		long rid = ServletRequestUtils.getLongParameter(request, "rid", 0);
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);

		long userId = getUserId();

		rollBookService.deleteRollBook(rid, userId);

		return new ModelAndView(new RedirectView("/rollbook/list?page=" + page));
	}

	/**
	 * 删除点名册用户
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("userdel")
	public ModelAndView userDel(HttpServletRequest request,
			HttpServletResponse response) {

		long uid = ServletRequestUtils.getLongParameter(request, "uid", 0);
		long rid = ServletRequestUtils.getLongParameter(request, "rid", 0);
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);

		long userId = getUserId();

		userService.deleteRollBookUserById(rid, uid);

		RollBook rollBook = rollBookService.getRollBookById(rid, userId);
		if (rollBook != null) {
			rollBook.setUserCount(rollBook.getUserCount() - 1);
			rollBookService.updateRollBook(rollBook);
		}

		return new ModelAndView(new RedirectView("/rollbook/list?page=" + page));
	}

	/**
	 * 点名情况
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("rolllist")
	public ModelAndView rollList(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/rolllist");

		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		long rollBookId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		Pagination pagination = new Pagination();
		pagination.setPage(page);

		long userId = getUserId();

		List<RollBook> rollBooks = rollBookService.getRollInfoList(userId,
				rollBookId, pagination.getLimit(), pagination.getOffset());
		int count = rollBookService.getRollInfoCount(userId, rollBookId);

		view.addObject("rollBooks", rollBooks);
		view.addObject("page", page);
		view.addObject("totalPage",
				(int) Math.ceil(count * 1.0 / pagination.getLimit()));
		view.addObject("pageUrl", "/rollbook/rolllist?rid=" + rollBookId);

		return view;
	}

	/**
	 * 每一次用户的点名详情
	 */
	@RequestMapping("userrollinfo")
	public ModelAndView userRollInfo(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = getBaseView("rollbook/userrollinfo");

		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		long rollInfoId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		Pagination pagination = new Pagination();
		pagination.setPage(page);

		long userId = getUserId();

		List<UserRollInfo> userRollInfos = rollBookService.getUserRollInfoList(
				userId, rollInfoId, pagination.getLimit(),
				pagination.getOffset());
		int count = rollBookService.getUserRollInfoCount(userId, rollInfoId,
				false);

		view.addObject("userRollInfos", userRollInfos);
		view.addObject("page", page);
		view.addObject("totalPage",
				(int) Math.ceil(count * 1.0 / pagination.getLimit()));
		view.addObject("pageUrl", "/rollbook/userrollinfo?rid=" + rollInfoId);

		return view;
	}
	
	/**
	 * 删除某个点名
	 */
	@RequestMapping("delrollinfo")
	public ModelAndView delRollinfo(HttpServletRequest request,
			HttpServletResponse response) {
		long userId = getUserId();

		long rollInfoId = ServletRequestUtils.getLongParameter(request, "rid", 0);
		long bid = ServletRequestUtils.getLongParameter(request, "bid", 0);
		
		RollBookInfo rollBookInfo = rollBookInfoService.getRollInfoById(rollInfoId);
		if (rollBookInfo != null && rollBookInfo.getUserId() == userId) {
			rollBookInfoService.deleteById(rollInfoId, userId);
			userRollInfoService.deleteByInfoId(rollInfoId);
		}
		
		return new ModelAndView(new RedirectView("/rollbook/rolllist?rid=" + bid));
	}

	/**
	 * 增加点名册用户
	 */
	@RequestMapping("useradd")
	public ModelAndView userAdd(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = new ModelAndView("rollbook/useradd");

		long rid = ServletRequestUtils.getLongParameter(request, "rid", 0);
		RollBook book = rollBookService.getRollBookById(rid, getUserId());
		view.addObject("book", book);
		
		return view;
	}
	
	/**
	 * 增加点名册用户
	 */
	@RequestMapping("useraddDetail")
	public ModelAndView useraddDetail(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = new ModelAndView("info");
		
		try {
			long rid = ServletRequestUtils.getLongParameter(request, "id", 0);
			String nameList = StringUtils.trim(ServletRequestUtils.getStringParameter(
					request, "nameList", ""));
			long userId = getUserId();

			RollBook rollBook = rollBookService.getRollBookById(rid, userId);
			if (rollBook == null) {
				view.addObject("result", "指定点名册不存在");
				return view;
			}
			
			if (StringUtils.isEmpty(nameList)) {
				view.addObject("result", "请填写需要添加的用户名单");
				return view;
			}
			
			String[] nameArray = nameList.split(",");
			int count = 0;
			for (String name : nameArray) {
				if (StringUtils.isBlank(name)) {
					continue;
				}
				count++;
				User u = new User();
				u.setUserName(name);
				userService.insertUser(u);
				
				RollBookUser rollBookUser = new RollBookUser();
				rollBookUser.setBookId(rid);
				rollBookUser.setUserId(u.getId());
				userService.insertRollBookUser(rollBookUser);
			}
			
			rollBook.setUserCount(rollBook.getUserCount() + count);
			rollBookService.updateRollBook(rollBook);
			view.addObject("result", "添加成功");
		} catch (Exception e) {
			view.addObject("result", "添加异常");
		}
		
		return view;
	}
	
	/**
	 * 下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("downloadinfo")
	public void downloadInfo(HttpServletRequest request,
			HttpServletResponse response) {
		long rollInfoId = ServletRequestUtils.getLongParameter(request, "rid",
				0);

		long userId = getUserId();

		List<UserRollInfo> userRollInfos = rollBookService.getUserRollInfoList(
				userId, rollInfoId, Integer.MAX_VALUE, 0);

		String[] titles = new String[] { "姓名", "电话号码", "点名时间", "点名状态", "备注" };
		List<Object[]> datas = generateDatas(userRollInfos, titles);

		exportXLS(response, datas, titles);
	}
	
	/**
	 * 下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("downloadall")
	public void downloadAll(HttpServletRequest request, HttpServletResponse response) {
		long rollBookId = ServletRequestUtils.getLongParameter(request, "rid", 0);

		List<User> rollBookUsers = userService.getRollBookUserList(rollBookId, Integer.MAX_VALUE, 0);
		if (CollectionUtils.isEmpty(rollBookUsers)) {
			return;
		}
		
		List<UserRollInfo> infos = userRollInfoService.getAllRollInfoByRid(rollBookId);
		
		String[] titles = new String[] { "姓名", "电话号码", "点名时间", "点名状态"};
		Map<User, List<UserRollInfo>> datas = generateXlsDatas(rollBookUsers, infos);

		exportToXLS(response, datas, titles);
	}

	private void exportToXLS(HttpServletResponse response, Map<User, List<UserRollInfo>> datas, String[] titles) {
		if (datas == null || datas.size() == 0) {
			return;
		}
		
		// 1.创建一个 workbook
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 2.创建一个 worksheet
		HSSFSheet worksheet = workbook.createSheet("idianming");
		// 3.定义起始行和列
		int startRowIndex = 0;
		int startColIndex = 0;
		// 4.创建title,data,headers
		POILayoutUtil.buildReport(worksheet, startRowIndex, startColIndex, titles, "用户所有点名记录统计");
		// 5.填充数据
		POIFillUtil.fillReport(worksheet, startRowIndex, startColIndex, datas);

		String fileName = "Idianming_All_Report_" + System.currentTimeMillis() + ".xls";
		response.setHeader("Content-Disposition", "inline; filename=" + fileName);
		// 确保发送的当前文本格式
		response.setContentType("application/vnd.ms-excel");

		POIFillUtil.write(response, worksheet);
	}

	private Map<User, List<UserRollInfo>> generateXlsDatas(List<User> rollBookUsers, List<UserRollInfo> infos) {
		if (CollectionUtils.isEmpty(rollBookUsers) || CollectionUtils.isEmpty(infos)) {
			return null;
		}
		
		Map<User, List<UserRollInfo>> map = new HashMap<>();
		
		for (User user : rollBookUsers) {
			List<UserRollInfo> urs = new ArrayList<>();
			Iterator<UserRollInfo> iterator = infos.iterator();
			while (iterator.hasNext()) {
				UserRollInfo info = iterator.next();
				if (info.getUserId() != user.getId()) {
					continue;
				}
				urs.add(info);
			}
			map.put(user, urs);
		}
		
		return map;
	}

	private List<Object[]> generateDatas(List<UserRollInfo> infos, String[] titles) {
		if (CollectionUtils.isEmpty(infos)) {
			return null;
		}
		List<Object[]> datas = new ArrayList<Object[]>();
		for (int i = 0; i < infos.size(); i++) {
			Object[] data = new Object[titles.length];
			data[0] = infos.get(i).getUsername();
			data[1] = infos.get(i).getMobile();
			data[2] = infos.get(i).getRollTime();
			data[3] = infos.get(i).getDistance();
			data[4] = infos.get(i).getInfo();
			datas.add(data);
		}
		return datas;
	}

	private void exportXLS(HttpServletResponse response, List<Object[]> datas,
			String[] titles) {
		// 1.创建一个 workbook
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 2.创建一个 worksheet
		HSSFSheet worksheet = workbook.createSheet("idianming");
		// 3.定义起始行和列
		int startRowIndex = 0;
		int startColIndex = 0;
		// 4.创建title,data,headers
		POILayoutUtil.buildReport(worksheet, startRowIndex, startColIndex, titles, "点名记录统计");
		// 5.填充数据
		POIFillUtil.fillReport(worksheet, startRowIndex, startColIndex, datas);

		String fileName = "Idianming_Report_" + System.currentTimeMillis() + ".xls";
		response.setHeader("Content-Disposition", "inline; filename=" + fileName);
		// 确保发送的当前文本格式
		response.setContentType("application/vnd.ms-excel");

		POIFillUtil.write(response, worksheet);
	}

	/**
	 * 模板下载
	 */
	@RequestMapping("template")
	public ResponseEntity<byte[]> template(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			File f = new File(RollBookController.class.getClassLoader()
					.getResource("template.xlsx").toURI());

			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", "template.xlsx");
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(f),
					headers, HttpStatus.OK);

		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
