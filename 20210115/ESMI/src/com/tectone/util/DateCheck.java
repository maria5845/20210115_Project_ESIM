package com.tectone.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;


public class DateCheck {

	public static void main(String[] args) {

		//getCalendarTypeDate(String _date, String _format, int _field, int _value)
		
		String basedate	=	getCurrentDate("yyyy-MM-dd HH:mm:ss");
		
		String t_date	=	getDateAdd(basedate,"yyyy-MM-dd HH:mm:ss", Calendar.MINUTE, +30);
		
		System.out.println("============>"+basedate+" : " +t_date);
		
		
		String sdate1	=	getCurrentDate("yyyy-MM-dd");
		System.out.println("2============>"+sdate1);
		
	}

	
	public static int getCalendarTypeValue(String _date, String _format, int _field){
		int	res	=	-1;
		
		try {
			Calendar calendar = new GregorianCalendar(); 

			SimpleDateFormat sdf = new SimpleDateFormat(_format,Locale.ENGLISH);

			calendar.setTime(sdf.parse(_date));
			
			res	=	calendar.get(_field);
			
		} catch (ParseException e) {

			e.printStackTrace();
		}
		
		return res;
	}
	
    public static String convertDate(String strSource, String fromDateFormat,
            String toDateFormat, String strTimeZone) {
        SimpleDateFormat simpledateformat = null;
        Date date = null;
        String _fromDateFormat = "";
        String _toDateFormat = "";

        if(isNullToString(strSource).trim().equals("")) {
            return "";
        }
        if(isNullToString(fromDateFormat).trim().equals(""))
        	_fromDateFormat = "yyyyMMddHHmmss";                    // default값
        if(isNullToString(toDateFormat).trim().equals(""))
        	_toDateFormat = "yyyy-MM-dd HH:mm:ss";                 // default값

        try {
        	simpledateformat = new SimpleDateFormat(_fromDateFormat, Locale.getDefault());
            date = simpledateformat.parse(strSource);
            if (!isNullToString(strTimeZone).trim().equals("")) {
                simpledateformat.setTimeZone(TimeZone.getTimeZone(strTimeZone));
            }
            simpledateformat = new SimpleDateFormat(_toDateFormat, Locale.getDefault());
        }
        catch(Exception exception) {
    	    //exception.printStackTrace();
    	    throw new RuntimeException(exception);	// 2011.10.10 보안점검 후속조치
        }
        return simpledateformat.format(date);
    }
    
    public static String convertDate(String sDate, String sTime, String sFormatStr) {
    	String dateStr = sDate;
    	String timeStr = sTime;

    	Calendar cal = null;
    	cal = Calendar.getInstance() ;

    	if(!"".equals(dateStr)){
	    	cal.set(Calendar.YEAR        , Integer.parseInt(dateStr.substring(0,4)));
	    	cal.set(Calendar.MONTH       , Integer.parseInt(dateStr.substring(4,6))-1 );
	    	cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6,8)));
    	}
    	
    	if(!"".equals(timeStr) && timeStr.length() == 4) {
    		cal.set(Calendar.HOUR_OF_DAY , Integer.parseInt(timeStr.substring(0,2)));
	    	cal.set(Calendar.MINUTE      , Integer.parseInt(timeStr.substring(2,4)));
    	}else if(!"".equals(timeStr) && timeStr.length() == 6) {
    		cal.set(Calendar.HOUR_OF_DAY , Integer.parseInt(timeStr.substring(0,2)));
    		cal.set(Calendar.MINUTE      , Integer.parseInt(timeStr.substring(2,4)));
	    	cal.set(Calendar.SECOND      , Integer.parseInt(timeStr.substring(4,6)));
    	}

    	SimpleDateFormat sdf = new SimpleDateFormat(sFormatStr,Locale.ENGLISH);

    	return sdf.format(cal.getTime());
    }
    public static String getCurrentDate(String dateType) {
        Calendar aCalendar = Calendar.getInstance();

        int year = aCalendar.get(Calendar.YEAR);
        int month = aCalendar.get(Calendar.MONTH) + 1;
        int date = aCalendar.get(Calendar.DATE);
        String strDate = Integer.toString(year) +
                ((month<10) ? "0" + Integer.toString(month) : Integer.toString(month)) +
                ((date<10) ? "0" + Integer.toString(date) : Integer.toString(date));

        if(!"".equals(dateType)) strDate = convertDate(strDate, "", dateType);

        return  strDate;
    }
    
    
    
    
	public static String getCalendarTypeDate(String _date, String _format, int _field, int _value){
		String	res	=	"";
		
		try {
			Calendar calendar = new GregorianCalendar(); 

			SimpleDateFormat sdf = new SimpleDateFormat(_format,Locale.ENGLISH);
			
			if(_date == null || "".equals(_date) || "".equals(_date))
			{
				Date trialTime = new Date(); 
				calendar.setTime(trialTime);
			}else
			{
				calendar.setTime(sdf.parse(_date));
			}
			
			calendar.set(_field, _value);
			
			
			res	=	sdf.format(calendar.getTime());
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return	res;
	}
    
	public static String getDateAdd(String _date, String _format, int _field, int _value){
		String	res	=	"";
		
		try {
			Calendar calendar = new GregorianCalendar(); 

			SimpleDateFormat sdf = new SimpleDateFormat(_format,Locale.ENGLISH);
			
			if(_date == null || "".equals(_date) || "".equals(_date))
			{
				Date trialTime = new Date(); 
				calendar.setTime(trialTime);
			}else
			{
				calendar.setTime(sdf.parse(_date));
			}
			
			calendar.add(_field, _value);
			
			
			res	=	sdf.format(calendar.getTime());
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return	res;
	}
    
    
    public static String isNullToString(Object object) {
        String string = "";

        if (object != null) {
            string = object.toString().trim();
        }

        return string;
    }
}
