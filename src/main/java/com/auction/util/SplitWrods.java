package com.auction.util;

import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.ToAnalysis;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wqlin on 16-5-7.
 */
public class SplitWrods {
    /**
     * 使用ansjseg库把传递进来的字符串进行分词处理，最后保留名词,并且在每个名词首部和尾部添加"%"
     * @param str 一个句子
     * @return 返回一个包含名词的对象数组
     */
    public static List<String> DivideStringIntoNoun(String str){
        List<String> keywords=new ArrayList<String>();
        List<Term> parse = ToAnalysis.parse(str);
        String s=null;
        for(Term term:parse){
            if(term.getNatureStr().equals("n")||term.getNatureStr().equals("en")){
                s="%"+term.getName()+"%";
                keywords.add(s);
            }
        }
        if(keywords.isEmpty()&&str!=null){
            str="%"+str.trim()+"%";
            keywords.add(str);
        }
        return keywords;
    }
}
