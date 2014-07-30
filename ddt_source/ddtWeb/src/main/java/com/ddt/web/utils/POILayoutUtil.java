/*
 * @(#)POILayoutUtil.java 2013-3-15
 *
 * Copyright 2012 Netease, Inc. All rights reserved.
 */
package com.ddt.web.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * POILayoutUtil.java
 *
 * @author     <A HREF="mailto:hzruanhy@corp.netease.com">Roy</A>
 * @version    1.0 2013-3-15
 * @since      1.0
 */
public class POILayoutUtil {
	/** 
     * �������� 
     */  
    public static void buildReport(HSSFSheet worksheet, int startRowIndex, int startColIndex, String[] headers, String title) {  
        if (headers == null || headers.length == 0) {
        	return;
        }
    	// �����еĿ�� 
    	for (int i = 0; i < headers.length; i++) {
    		worksheet.setColumnWidth(i, 5000);
    	}
    	//startrow = 0
        buildTitle(worksheet, startRowIndex, startColIndex, title, headers.length);  
        //startrow = 1
        buildHeaders(worksheet, startRowIndex, startColIndex, headers);  
  
    }  
  
    /** 
     * ���������������� 
     */  
    private static void buildTitle(HSSFSheet worksheet, int startRowIndex, int startColIndex, String title, int mergeSize) {  
        // ���ñ����������  
        Font fontTitle = worksheet.getWorkbook().createFont();  
        fontTitle.setBoldweight(Font.BOLDWEIGHT_BOLD);  
        fontTitle.setFontHeight((short) 280);  
  
        // ���ⵥԪ����ʽ  
        HSSFCellStyle cellStyleTitle = worksheet.getWorkbook().createCellStyle();  
        cellStyleTitle.setAlignment(CellStyle.ALIGN_CENTER);  
        cellStyleTitle.setWrapText(true);  
        cellStyleTitle.setFont(fontTitle);  
  
        // �������  
        HSSFRow rowTitle = worksheet.createRow((short) startRowIndex);  
        rowTitle.setHeight((short) 500);  
        HSSFCell cellTitle = rowTitle.createCell(startColIndex);  
        cellTitle.setCellValue(title);  
        cellTitle.setCellStyle(cellStyleTitle);  
  
        // �ϲ������ڵı������  
        worksheet.addMergedRegion(new CellRangeAddress(0, 0, 0, mergeSize - 1));  
  
        // date header  
        HSSFRow dateTitle = worksheet.createRow((short) startRowIndex + 1);  
        dateTitle.createCell(startColIndex);  
    }  
  
    /** 
     * ������ͷ 
     */  
    private static void buildHeaders(HSSFSheet worksheet, int startRowIndex, int startColIndex, String[] headers) {  
        // Header����  
        Font font = worksheet.getWorkbook().createFont();  
        font.setBoldweight(Font.BOLDWEIGHT_BOLD); 
//        font.setFontHeightInPoints((short) 12);
  
        // ��Ԫ����ʽ  
        HSSFCellStyle headerCellStyle = worksheet.getWorkbook().createCellStyle();  
//        headerCellStyle.setFillBackgroundColor(HSSFColor.AUTOMATIC.index);  
//        headerCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);  
        headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);  
        headerCellStyle.setWrapText(true);  
        headerCellStyle.setFont(font);  
        headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN);  
  
        // �����ֶα���  
        HSSFRow rowHeader = worksheet.createRow((short) startRowIndex + 1);  
        rowHeader.setHeight((short) 500);  
        
        for (int i = 0; i < headers.length; i++) {
        	 HSSFCell cell1 = rowHeader.createCell(startColIndex + i);  
             cell1.setCellValue(headers[i]);  
             cell1.setCellStyle(headerCellStyle);
        }
    } 
}
