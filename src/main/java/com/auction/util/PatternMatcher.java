package com.auction.util;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 */
public class PatternMatcher {
    /**
     * 验证字符串是否符合正则表达式
     * @param patternStr 正则表达式
     * @param str 被检查的字符串
     * @return
     * true - 字符串符合正则表达式
     * false - 字符串不符合正则表达式
     */
    public static boolean isMatch(String patternStr,String str){
        Pattern pattern= Pattern.compile(patternStr);
        Matcher matcher=pattern.matcher(str);
        return matcher.matches();
    }
}
