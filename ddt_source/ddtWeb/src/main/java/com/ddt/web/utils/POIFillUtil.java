/*
 * @(#)POIFillManager.java 2013-3-15
 *
 */
package com.ddt.web.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Sheet;

/**
 * POIFillManager.java
 * 
 * @author <A HREF="mailto:hzruanhy@corp.netease.com">Roy</A>
 * @version 1.0 2013-3-15
 * @since 1.0
 */
public class POIFillUtil {

	private static Logger logger = Logger.getLogger(POIFillUtil.class);

	public static void fillReport(HSSFSheet worksheet, int startRowIndex,
			int startColIndex, List<Object[]> datas) {
		// Row offset
		startRowIndex += 1;

		// Create cell style for the body
		HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();
		bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		bodyCellStyle.setWrapText(false);

		// Create body
		for (int i = startRowIndex; i + startRowIndex - 1 < datas.size() + 1; i++) {
			// Create a new row
			HSSFRow row = worksheet.createRow((short) i + 1);
			Object[] data = datas.get(i - 1);
			for (int j = 0; j < data.length; j++) {
				HSSFCell cell1 = row.createCell(startColIndex + j);
				if (data[j] instanceof Date) {
					cell1.setCellValue(parseDate((Date) data[j]));
				} else if (data[j] instanceof Double) {
					cell1.setCellValue((Double) data[j]);
				} else {
					cell1.setCellValue(String.valueOf(data[j]));
				}
				cell1.setCellStyle(bodyCellStyle);
			}
		}
	}

	public static void write(HttpServletResponse response, Sheet worksheet) {

		logger.debug("Writing report to the stream");
		ServletOutputStream outputStream = null;
		try {
			// Retrieve the output stream
			outputStream = response.getOutputStream();
			// Write to the output stream
			worksheet.getWorkbook().write(outputStream);
			// 清除缓存
			outputStream.flush();

		} catch (Exception e) {
			logger.error("报表输入失败!");
		} finally {
			try {
				if (outputStream != null) {
					outputStream.close();
				}
			} catch (IOException e) {
				logger.error("报表输入失败!");
			}
		}
	}

	public static String parseDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
}
