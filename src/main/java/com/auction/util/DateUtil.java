package com.auction.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**用于格式化输出当前时间，时间戳
 * @author chuankun
 *@2016年5月15日 下午3:00:55
 * email:yichuankun@qq.com
 */
public class DateUtil {

	/**
	 * 获取标准化时间
	 * @return
	 */
	public static String getDate(){
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(now);
	}
	/**
	 * 根据时间返回星期几
	 * @param data yyyy-mm-dd
	 * @param spiter 分割符
	 * @return
	 */
	public static String getWeek(String data,String regex){
		String [] str1 = data.split(regex);
		int year = Integer.valueOf(str1[0]);
		int month = Integer.valueOf(str1[1]);
		int day = Integer.valueOf(str1[2]);
	     
	     Calendar calendar = Calendar.getInstance();//获得一个日历
	     calendar.set(year, month-1, day);//设置当前时间,月份是从0月开始计算
	     int number = calendar.get(Calendar.DAY_OF_WEEK);//星期表示1-7，是从星期日开始，   
	     String [] str = {"","7","1","2","3","4","5","6",};
		return str[number];
	}
	/**
	 * 返回当前的时间戳
	 *@return
	 * @author chuankun
	 *  2016年6月17日 下午7:29:06
	 */
	public static String getTimestap(){
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(now);
	} 
}
