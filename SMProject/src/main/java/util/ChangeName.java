package util;

import java.util.Calendar;

public class ChangeName {
	
	public static String getChangeFileName(String fileName) {
		int dotLoc=fileName.indexOf(".");// 인덱스 7
		String fname=fileName.substring(0, dotLoc);//파일명(가나다라마바사)
		String ext=fileName.substring(dotLoc);//확장자(.jpg)
		
		//날짜를 구해서 년월일시분초+천분의1초.jpg 이런식으로 파일명 변경하기
		Calendar cal=Calendar.getInstance();
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH)+1;
		int d=cal.get(Calendar.DATE);
		int hh=cal.get(Calendar.HOUR);
		int mm=cal.get(Calendar.MINUTE);
		int ss=cal.get(Calendar.SECOND);
		int ms=cal.get(Calendar.MILLISECOND);
		
		//숫자 계산을 막기 위해 맨 앞은 ""로 문자열 처리
		fileName=""+y+(m<10?"0"+m:m)+(d<10?"0"+d:d)+(hh<10?"0"+hh:hh)+(mm<10?"0"+mm:mm)+(ss<10?"0"+ss:ss)
				+(ms<10?"00"+ms:ms<100?"0"+ms:ms)+ext;
		return fileName;
	}
}
