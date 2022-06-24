/**
 * @description       : 
 * @author            : dvtruong@cmc
 * @group             : CMC
 * @last modified on  : 2022-06-24
 * @last modified by  : dvtruong@cmc
**/
public with sharing class CMC_ValidateUtils {
    /**
    * 英数字のチェック
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　半角英数字のみ（空文字OK）
    */
    public static Boolean isAlphaNumeric(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_ALPHANUMERIC, strTarget);
        }
        return result;
    }

    /**
    * 半角英字のチェック
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　半角英字のみ（空文字OK）
    */
    public static Boolean isAlphabet(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_ALPHABET, strTarget);
        }
        return result;
    }

    /**
    * 半角数字のチェック
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　半角数字
    */
    public static Boolean isNumeric(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_NUMERIC, strTarget);
        }
        return result;
    }

    /**
    * カタカナ（全角/半角）のチェック
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　全角/半角カタカナ、「ー」「・」「.」「スペース」
    */
    public static Boolean isKatakana(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_KATAKANA, strTarget);
        }
        return result;
    }

    /**
    * ひらがなの文字のチェック
    * ぁ, あ, ぃ, い, ぅ, う, ぇ, え, ぉ, お, か, が, き, ぎ, く, ぐ, け, げ, こ, ご, さ, ざ, し, じ, 
    * す, ず, せ, ぜ, そ, ぞ, た, だ, ち, ぢ, っ, つ, づ, て, で, と, ど, な, に, ぬ, ね, の, は, ば, 
    * ぱ, ひ, び, ぴ, ふ, ぶ, ぷ, へ, べ, ぺ, ほ, ぼ, ぽ, ま, み, む, め, も, ゃ, や, ゅ, ゆ, ょ, よ, 
    * ら, り, る, れ, ろ, ゎ, わ, ゐ, ゑ, を, ん
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　ひらがなの文字
    */
    public static Boolean isHiragana(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_HIRAGANA, strTarget);
        }
        return result;
    }

    /**
    * メールアドレスチェック
    * @param
    * 　strTarget　対象文字列
    * @return:
    * 　true　正常なメールアドレス 
    */
    public static Boolean isValidEmailAddress(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_EMAIL_ADDRESS, strTarget);
        }
        return result;
    }
    
    /**
    * @description 有効な日付形式チェック
    * @author dvtruong@cmc | 2022-06-23 
    * @param String strTarget 対象文字列
    * @param CMC_ConstUtils.FORMAT_DATE 日付フォーマットパターン　 ※デフォルト：YYYYMMDD
    * @return Boolean true　正常な日付
    **/
    public static Boolean isValidDate(String strTarget){
        return isValidDate(strTarget, CMC_ConstUtils.FORMAT_DATE.YYYYMMDD);
    }
    public static Boolean isValidDate(String strTarget, CMC_ConstUtils.FORMAT_DATE formatPartern){
        if(String.isBlank(strTarget) || formatPartern == null){
            return false;
        }
        
        // 正規表現 regExp をコンパイルして、指定された文字列に対するマッチ処理を実行
        String formatChar;
        Boolean matchesResult = false;
        switch on formatPartern {
            when YYYYMMDD {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD, strTarget);
            }
            when YYYYMMDD_SLASH {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD_SLASH, strTarget);
                formatChar = CMC_ConstUtils.SLASH;
            }
            when YYYYMMDD_HYPHEN {
                matchesResult = Pattern.matches(CMC_ConstUtils.REGEX_DATE_YYYYMMDD_HYPHEN, strTarget);
                formatChar = CMC_ConstUtils.HYPHEN;
            }
        }
        if(!matchesResult){
            return false;
        }
        List<String> dateInsParts = new List<String>();
        String targetDate = strTarget;
        if(String.isBlank(formatChar)){
            // 指定した文字列で年、月、および日の値を取得
            String strYear = CMC_StringUtils.substring(strTarget, 0, 4);
            String strMonth = CMC_StringUtils.substring(strTarget, 4, 6);
            String strDay = CMC_StringUtils.substring(strTarget, 6, 8);
            dateInsParts.add(strYear);
            dateInsParts.add(strMonth);
            dateInsParts.add(strDay);
            targetDate = strYear + CMC_ConstUtils.HYPHEN + strMonth + CMC_ConstUtils.HYPHEN + strDay; // yyyy-MM-dd
        } else {
            dateInsParts = strTarget.split(formatChar);
        }
        // 年月日で構成されるかチェック
        if(dateInsParts.size() != 3){
            return false;
        }
        for (String dateIns : dateInsParts) {
            if(!isNumeric(dateIns)){
                return false;
            }
        }
        // 有効な日付形式チェック
        try {
            Date dtVal = Date.valueOf(targetDate.replace(CMC_ConstUtils.SLASH, CMC_ConstUtils.HYPHEN));
            Date dtIns = Date.newInstance(Integer.valueOf(dateInsParts[0]), //YYYY
                                            Integer.valueOf(dateInsParts[1]), //MM
                                            Integer.valueOf(dateInsParts[2])); //DD
            return (dtVal == dtIns);
        } catch (Exception ex) {
            return false;
        }
    }

    /**
    * @description 電話番号（「XXXX-XXXX-XXXX」）チェック
    * @author dvtruong@cmc | 2022-06-23 
    * @param String strTarget 対象文字列
    * @return Boolean true　正常な電話番号
    **/
    public static Boolean isValidPhoneNumber(String strTarget){
        Boolean result = false;
        if(String.isNotEmpty(strTarget)){
            result = Pattern.matches(CMC_ConstUtils.REGEX_PHONE_NUMBER, strTarget);
        }
        return result;
    }
}
