/**
 * @description       : プロジェクト共通の定数定義クラス
 * @author            : dvtruong@cmc
 * @group             : CMC
 * @last modified on  : 2022-06-24
 * @last modified by  : dvtruong@cmc
**/
public with sharing class CMC_ConstUtils {
    public static final String EMPTY = ''; // 空文字列
    public static final String SEMICOLON = ';'; // 区切りコード
    public static final String COMMA = ','; // コンマ
    public static final String SPACE = '　'; // スペース（全角）
    public static final String LF = '\n'; // 改行コード
    public static final String CR = '\r'; // キャリッジ・リターン
    public static final String BR = '<br />'; // 改行HTMLコード
    public static final String SLASH = '/'; // スラッシュ
    public static final String HYPHEN = '-'; // ハイフン（半角）
    // SOQL クエリの返される最大行数のデファクト値
    public static final Integer DEF_SOQL_LIMIT = 200;
    // バッチのサイズ
    public static final Integer DEF_BATCH_LIMIT = 200;
    // 文字列
    public static final String TEXT_YES = 'はい';
    public static final String TEXT_NO = 'いいえ';
    public static final String TEXT_TRUE = 'true';
    public static final String TEXT_FALSE = 'false';
    public static final Set<String> FLAG_ALLOW_TEXT_VALUES = new Set<String>{TEXT_TRUE, TEXT_FALSE};
    public static final String TEXT_MALE = '男性';
    public static final String TEXT_FEMALE = '女性';
    public static final Set<String> GENDER_ALLOW_TEXT_VALUES = new Set<String>{TEXT_MALE, TEXT_FEMALE};
    // デフォルト値
    public static final String DEF_TIME_VALUE = '00'; // 時間値
    // 正規表現入力チェック
    public static final String REGEX_ALPHANUMERIC = '[0-9a-zA-Z]+$'; //半角英数字のみ（空文字OK）
    public static final String REGEX_ALPHABET = '[a-zA-Z]+$'; //半角英字のみ（空文字OK）
    public static final String REGEX_NUMERIC = '[0-9]+$'; //半角数字
    public static final String REGEX_PHONE_NUMBER = '\\d{1,4}(-\\d{1,4})(-\\d{1,4})'; //電話番号（「XXXX-XXXX-XXXX」）チェック
    public static final String REGEX_DATE_YYYYMMDD = '\\d{8}'; //yyyyMMdd（「例：20200931」）チェック
    public static final String REGEX_DATE_YYYYMMDD_SLASH = '^\\d{1,4}\\/(0?[1-9]|1[012])\\/(0?[1-9]|[12][0-9]|3[01])$'; //yyyy/MM/dd（「例：2020/09/31」）チェック
    public static final String REGEX_DATE_YYYYMMDD_HYPHEN = '^\\d{1,4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])$'; //yyyy-MM-dd（「例：2020-09-31」）チェック
    public static final String REGEX_KATAKANA = '[ァ-ヶｦ-ﾟー・･.　 -]+$'; //全角/半角カタカナ
    public static final String REGEX_HIRAGANA = '[ぁ-ん]+$'; //ひらがな
    // https://www.synergy-marketing.co.jp/blog/salesforce-email-address-validation
    public static final String REGEX_EMAIL_ADDRESS = '^((?:(?:(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))*(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))|(?:(?:[\\x20\\x09])+)))?(?:(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\-\\/=?\\^_`{|}~])+(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\-\\/=?\\^_`{|}~\\.])*)(?:(?:(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\-\\/=?\\^_`{|}~])+(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\-\\/=?\\^_`{|}~\\.])*)|(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))*)|(?:(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))*(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))|(?:(?:[\\x20\\x09])+)))?\"(?:(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\))|(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\-\\/=?\\^_`{|}~\\.]))*\"(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\))*))\\@(?:(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\))*(?:(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\/=?\\^_`{|}~])+(?:\\-+(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\/=?\\^_`{|}~])+)*(?:\\.(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\/=?\\^_`{|}~])+(?:\\-+(?:[A-Za-z0-9!#\\$\\%&amp;\'*+\\/=?\\^_`{|}~])+)*)+)(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))*(?:(?:(?:(?:[\\x20\\x09])+)?(?:\\((?:(?:(?:[\\x20\\x09])+)?(?:[\\x09\\x20-\\x28\\x2a-\\x7e]))*(?:(?:[\\x20\\x09])+)?\\)))|(?:(?:[\\x20\\x09])+)))?))$';
    // 日付フォーマット
    public enum FORMAT_DATE {YYYYMMDD, YYYYMMDD_SLASH, YYYYMMDD_HYPHEN, YYYYMMDDHH24MISS}
    public static final String FORMAT_DATE_YYYYMMDD = 'yyyyMMdd'; // 例：20200931, 20201230
    public static final String FORMAT_DATE_YYYYMMDD_SLASH = 'yyyy/MM/dd'; // 例：2020/8/30, 2020/09/31, 2020/12/30
    public static final String FORMAT_DATE_YYYYMMDD_HYPHEN = 'yyyy-MM-dd'; // 例：2020-8-30, 2020-09-31, 2020-12-30
    // 日時フォーマット
    public static final String FORMAT_DATE_YYYYMMDDHH24MISS = 'yyyyMMddHHmmss';
}
