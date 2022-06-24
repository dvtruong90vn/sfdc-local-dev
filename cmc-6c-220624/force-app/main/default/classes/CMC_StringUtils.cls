/**
 * @description       : 
 * @author            : dvtruong@cmc
 * @group             : CMC
 * @last modified on  : 2022-06-24
 * @last modified by  : dvtruong@cmc
**/
public with sharing class CMC_StringUtils {

    /**
    * @description 指定した string がSFオブジェクトIdかどうかチェック
    * @author dvtruong@cmc | 2022-06-23 
    * @param String tarStr 対象文字列
    * @return Boolean true　SFオブジェクトId
    **/
    public static Boolean isSObjectId(String tarStr) {
        Boolean result = false;
        try {
            if(String.isNotBlank(tarStr)){
                Id.valueOf(tarStr);
                result = true;
            }
            
        } catch (StringException ex) {
            result = false;
        }
        return result;
    }

    /**
    * @description 指定した開始値 0 の startIndex の文字で始まり endIndex - 1 の文字まで続く新しい string を返します。
    * @author dvtruong@cmc | 2022-06-23 
    * @param String str 
    * @param integer startIndex 
    * @param integer endIndex 
    * @return String 
    **/
    public static String substring(String str, integer startIndex, integer endIndex) {
        if (str == null) {
            return null;
        }
        // handle negatives
        if (endIndex < 0) {
            endIndex = str.length() + endIndex; // remember end is negative
        }
        if (startIndex < 0) {
            startIndex = str.length() + startIndex; // remember start is negative
        }
        // check length next
        if (endIndex > str.length()) {
            endIndex = str.length();
        }
        // if start is greater than end, return ""
        if (startIndex > endIndex) {
            return CMC_ConstUtils.EMPTY;
        }
        if (startIndex < 0) {
            startIndex = 0;
        }
        if (endIndex < 0) {
            endIndex = 0;
        }
        return str.substring(startIndex, endIndex);
    }

    // 文字列がnullのときに空の文字列を返す
    public static String defaultString(String str) {
        return defaultString(str, CMC_ConstUtils.EMPTY);
    }

    // 文字列がnullのときにdefaultStrの値を返す
    public static String defaultString(String str, String defaultStr) {
        return String.isEmpty(str) ? defaultStr : str;
    }

    /**
     * @description       : 
     * @author            : dvtruong@cmc
     * @group             : CMC
     * @last modified on  : 2022-06-24
     * @last modified by  : dvtruong@cmc
    **/
    // 指定された文字列で date を構築する
    public static Date parseDate(String dateString) {
        Datetime parseResult = parseDatetime(dateString, CMC_ConstUtils.FORMAT_DATE.YYYYMMDD);
        return parseResult != null ? parseResult.date() : null;
    }

    // 指定された形式および文字列で date を構築する
    public static Date parseDate(String dateString, CMC_ConstUtils.FORMAT_DATE formatPartern) {
        Datetime parseResult = parseDatetime(dateString, formatPartern);
        return parseResult != null ? parseResult.date() : null;
    }

    // 指定された文字列で datetime を構築する
    public static Datetime parseDatetime(String datetimeString) {
        return parseDatetime(datetimeString, CMC_ConstUtils.FORMAT_DATE.YYYYMMDD);
    }

    // 指定された形式および文字列で datetime を構築する
    public static Datetime parseDatetime(String datetimeString, CMC_ConstUtils.FORMAT_DATE formatPartern) {
        System.debug(datetimeString);
        System.debug(formatPartern);
        Datetime result;
        if(String.isBlank(datetimeString) || formatPartern == null){
            return null;
        }
        // 正規表現 regExp をコンパイルして、指定された文字列に対するマッチ処理を実行
        String formatChar;
        Boolean matchesResult = false;
        switch on formatPartern {
            when YYYYMMDD {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD, datetimeString);
            }
            when YYYYMMDD_SLASH {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD_SLASH, datetimeString);
                formatChar = CMC_ConstUtils.SLASH;
            }
            when YYYYMMDD_HYPHEN {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD_HYPHEN, datetimeString);
                formatChar = CMC_ConstUtils.HYPHEN;
            }
        }
        if(!matchesResult){
            return null;
        }
        List<String> dateInsParts = new List<String>();
        String targetDate = datetimeString;
        if(String.isBlank(formatChar)){
            // 指定した文字列で年、月、および日の値を取得
            String strYear = CMC_StringUtils.substring(datetimeString, 0, 4);
            String strMonth = CMC_StringUtils.substring(datetimeString, 4, 6);
            String strDay = CMC_StringUtils.substring(datetimeString, 6, 8);
            dateInsParts.add(strYear);
            dateInsParts.add(strMonth);
            dateInsParts.add(strDay);
            targetDate = strYear + CMC_ConstUtils.HYPHEN + strMonth + CMC_ConstUtils.HYPHEN + strDay; // yyyy-MM-dd
        } else {
            dateInsParts = datetimeString.split(formatChar);
        }
        // 年月日で構成されるかチェック
        if(dateInsParts.size() != 3){
            return null;
        }
        for (String dateIns : dateInsParts) {
            if(!CMC_ValidateUtils.isNumeric(dateIns)){
                return null;
            }
        }
        // 有効な日付形式チェック
        try {
            Date dtVal = Date.valueOf(targetDate.replace(CMC_ConstUtils.SLASH, CMC_ConstUtils.HYPHEN));
            Date dtIns = Date.newInstance(Integer.valueOf(dateInsParts[0]), //YYYY
                                            Integer.valueOf(dateInsParts[1]), //MM
                                            Integer.valueOf(dateInsParts[2])); //DD
            if (dtVal == dtIns) {
                result = dtIns;
            }
        } catch (Exception ex) {
            return null;
        }
        return result;
    }
}
