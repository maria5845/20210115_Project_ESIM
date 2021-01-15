package com.tectone.util;




import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import	org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import	org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import	org.apache.poi.hssf.usermodel.HSSFSheet;
import	org.apache.poi.hssf.usermodel.HSSFRow;
import	org.apache.poi.hssf.usermodel.HSSFCell;



public class ReadExcelUtil {

	
	public static void main(String args[]){
		System.out.println(getReadExcel(1,1,"D:/down/test.xls"));
	}
	
	/**
	 * 엑셀 파일을 읽어서 String으로 반환 한다
	 * 구분값은 | (파이프) 임
	 * @param _start_row  0보다 큰 값이 들어 오면 거기 row부터 읽어라 첫번째 row가 타이틀이 될 수도 있으므로 첫번째 row는 읽지 않도록 하기 위함
	 * @param _end_cell  0보다 큰 값이 들어 오면 거기 cell까지만 읽는다 
	 * @param _path		엑셀 파일이 있는 경로
	 * @return
	 */
	public static String getReadExcel(int _start_row, int _end_cell, String _path){
		String	res	=	"";
		int		start_row	=	0;
		int		end_cell	=	0;
		
		try {
			POIFSFileSystem		fs			= new POIFSFileSystem(new FileInputStream(_path));
			
			//워크북을 생성!      
			Workbook		workbook	= WorkbookFactory.create(fs);
//			HSSFWorkbook		workbook	= new HSSFWorkbook(fs);
			int					sheetNum	= workbook.getNumberOfSheets();

			for (int k = 0; k < sheetNum; k++) {

				Sheet sheet = workbook.getSheetAt(k);
//				HSSFSheet		sheet	= workbook.getSheetAt(k);
				int				rows	= sheet.getPhysicalNumberOfRows();
				
				// 0보다 큰 값이 들어 오면 거기 row부터 읽어라
				// 첫번째 row가 타이틀이 될 수도 있으므로 첫번째 row는 읽지 않도록 하기 위함
				if(_start_row>=0){
					start_row	=	_start_row;
				}
				
				for (int r = start_row; r < rows; r++) {
				  // 시트에 대한 행을 하나씩 추출
					Row row   = sheet.getRow(r);
//				  HSSFRow row   = sheet.getRow(r);
	
				  if (row != null ) { 
				   
				   if( _end_cell >= 0 ){
					   end_cell		=	_end_cell;
				   }else{
					   end_cell		=	row.getPhysicalNumberOfCells();	
				   }
	
				   for (short c = 0; c < end_cell; c++) {
				    // 행에대한 셀을 하나씩 추출하여 셀 타입에 따라 처리
					 Cell cell  = row.getCell(c);
//				    HSSFCell cell  = row.getCell(c);
						if (cell != null) { 
							String value = null; 
							switch (cell.getCellType()) {
							case Cell.CELL_TYPE_FORMULA :
//								case HSSFCell.CELL_TYPE_FORMULA :
									//value = "FORMULA value=" + cell.getCellFormula();
									value =  cell.getCellFormula();
								break;
								case Cell.CELL_TYPE_NUMERIC :
//								case HSSFCell.CELL_TYPE_NUMERIC :
									//value = "NUMERIC value=" + cell.getNumericCellValue(); //double
									value =  ""+cell.getNumericCellValue() ; //double
								break;
								case Cell.CELL_TYPE_STRING :
//								case HSSFCell.CELL_TYPE_STRING :
									//value = "STRING value=" + cell.getStringCellValue(); //String
									value =  cell.getStringCellValue(); //String
								break;
								case Cell.CELL_TYPE_BLANK :
//								case HSSFCell.CELL_TYPE_BLANK :
									value = null;
								break;
								case Cell.CELL_TYPE_BOOLEAN :
//								case HSSFCell.CELL_TYPE_BOOLEAN :
									//value = "BOOLEAN value=" + cell.getBooleanCellValue(); //boolean
									value =  ""+ cell.getBooleanCellValue(); //boolean
								break;
								case Cell.CELL_TYPE_ERROR :
//								case HSSFCell.CELL_TYPE_ERROR :
									//value = "ERROR value=" + cell.getErrorCellValue(); // byte
									value = ""+cell.getErrorCellValue(); // byte
								break;
								default :
							} // switch
							
							res	+= value+"|";

					} // if
				   } // for
				  } // if
				} // for
			} // for			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

		return res;
		
	}
	
	
	
	
	/**
	 * 엑셀 파일을 읽어서 String으로 반환 한다
	 * 구분값은 | (파이프) 임
	 * @param _start_row  0보다 큰 값이 들어 오면 거기 row부터 읽어라 첫번째 row가 타이틀이 될 수도 있으므로 첫번째 row는 읽지 않도록 하기 위함
	 * @param _end_cell  0보다 큰 값이 들어 오면 거기 cell까지만 읽는다 
	 * @param _path		엑셀 파일이 있는 경로
	 * @return
	 */
	public static List<String> getReadExcelToList(int _start_row, int _end_cell, String _path){
		List<String> resArray	=	new	ArrayList<String>();
		
		int		start_row	=	0;
		int		end_cell	=	0;
		
		try {
//			POIFSFileSystem		fs			= new POIFSFileSystem(new FileInputStream(_path));
//			OPCPackage fs = OPCPackage.open(new FileInputStream(_path));

			
			//워크북을 생성!   
//			Workbook workbook = WorkbookFactory.create(fs);
//			Workbook workbook2 = new XSSFWorkbook();
			Workbook workbook = new XSSFWorkbook(new FileInputStream(_path));
//			HSSFWorkbook		workbook	= new HSSFWorkbook(fs);
			int					sheetNum	= workbook.getNumberOfSheets();

			for (int k = 0; k < sheetNum; k++) {

				Sheet sheet = workbook.getSheetAt(k);
//				XSSFSheet sheet = workbook.getSheetAt(k);
//				HSSFSheet		sheed	= workbook.getSheetAt(k);
				int				rows	= sheet.getPhysicalNumberOfRows();
				
				// 0보다 큰 값이 들어 오면 거기 row부터 읽어라
				// 첫번째 row가 타이틀이 될 수도 있으므로 첫번째 row는 읽지 않도록 하기 위함
				if(_start_row>=0){
					start_row	=	_start_row;
				}
				
				for (int r = start_row; r < rows; r++) {
				  // 시트에 대한 행을 하나씩 추출
					Row row = sheet.getRow(r);
//					XSSFRow row = sheet.getRow(r);
//				  HSSFRow row   = sheet.getRow(r);

				  //한줄읽은것을 임시로 저장 한다.
				  String			parse_str	=	"";
					
				  if (row != null ) { 
				   
				   if( _end_cell >= 0 ){
					   end_cell		=	_end_cell;
				   }else{
					   end_cell		=	row.getPhysicalNumberOfCells();	
				   }
	
				   for (short c = 0; c < end_cell; c++) {
				    // 행에대한 셀을 하나씩 추출하여 셀 타입에 따라 처리
					   Cell cell = row.getCell(c);
//					   XSSFCell cell = row.getCell(c);
//				    HSSFCell cell  = row.getCell(c);
						if (cell != null) { 
							String value = null; 
							switch (cell.getCellType()) {
								case Cell.CELL_TYPE_FORMULA :
//								case XSSFCell.CELL_TYPE_FORMULA :
//								case HSSFCell.CELL_TYPE_FORMULA :
									//value = "FORMULA value=" + cell.getCellFormula();
									value =  cell.getCellFormula();
								break;
								case Cell.CELL_TYPE_NUMERIC :
//								case XSSFCell.CELL_TYPE_NUMERIC :
//								case HSSFCell.CELL_TYPE_NUMERIC :
									//value = "NUMERIC value=" + cell.getNumericCellValue(); //double
									value =  ""+cell.getNumericCellValue() ; //double
								break;
								case Cell.CELL_TYPE_STRING :
//								case XSSFCell.CELL_TYPE_STRING :
//								case HSSFCell.CELL_TYPE_STRING :
									//value = "STRING value=" + cell.getStringCellValue(); //String
									value =  cell.getStringCellValue(); //String
								break;
								case Cell.CELL_TYPE_BLANK :
//								case XSSFCell.CELL_TYPE_BLANK :
//								case HSSFCell.CELL_TYPE_BLANK :
									value = null;
								break;
								case Cell.CELL_TYPE_BOOLEAN :
//								case XSSFCell.CELL_TYPE_BOOLEAN :
//								case HSSFCell.CELL_TYPE_BOOLEAN :
									//value = "BOOLEAN value=" + cell.getBooleanCellValue(); //boolean
									value =  ""+ cell.getBooleanCellValue(); //boolean
								break;
								case Cell.CELL_TYPE_ERROR :
//								case XSSFCell.CELL_TYPE_ERROR :
//								case HSSFCell.CELL_TYPE_ERROR :
									//value = "ERROR value=" + cell.getErrorCellValue(); // byte
									value = ""+cell.getErrorCellValue(); // byte
								break;
								default :
							} // switch
							
							//마지막 것은 파이프 넣지 말아라
							if(c == (end_cell-1)){
								parse_str	+= value;
							}else{
								parse_str	+= value+"|";	
							}
							

					} // if
				   } // for
				  } // if
				  
				  resArray.add(parse_str);
				  
				} // start_row for
			} // for			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

		return resArray;
		
	}
	
}
