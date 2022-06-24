/**
 * @description       : 
 * @author            : dvtruong@cmc
 * @group             : CMC
 * @last modified on  : 2022-06-24
 * @last modified by  : dvtruong@cmc
**/
@IsTest
class CMC_ValidateUtils_Test {
    
    @IsTest
    static void test_isAlphaNumeric() {
        //【内容】英数字のチェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric(null), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('0'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('a'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('A'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('Aa01'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('あ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('あA01'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('ァ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('ア'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphaNumeric('コード'), FALSE);
    }

    @IsTest
    static void test_isAlphabet() {
        //【内容】半角英字のチェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isAlphabet(null), false);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('a'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('A'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('abc'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('ABC'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('ABCabc'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('0'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('Aa01'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('あ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('あA01'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('ァ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('ア'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isAlphabet('コード'), FALSE);
    }

    @IsTest
    static void test_isNumeric() {
        //【内容】半角数字のチェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isNumeric('1'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('１'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('123'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('１２３'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('A'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('A01'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('あ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('あA01'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('ァ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('ア'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isNumeric('コード'), FALSE);
    }

    @IsTest
    static void test_isKatakana() {
        //【内容】全角/半角カタカナ、「ー」「・」「.」「スペース」のチェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isKatakana('ア'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('ァ'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('ー'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('・'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('.'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('　'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('カナ'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('ｶﾅ'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('カナー'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('カナ　ー・.'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('あ'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('漢字'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('１'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isKatakana('1'), FALSE);
    }

    @IsTest
    static void test_isValidEmailAddress() {
        //【内容】メールアドレスチェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('fuga@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge.example'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('fuga.example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge.@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge..fuga@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@-example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example-.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example.-com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example.com-'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('“hoge@fuga”@example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('“hoge\fuga”@example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge\\nfuga@example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge<br/>fuga@example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('ABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGHIJABCDEFGH@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('　'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge@example.'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge.example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('@example.com'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('.hoge@example.com'), FALSE);
        // 
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge_1234@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge_123@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge_12@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge_1@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge_@example.com'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidEmailAddress('hoge-fuga_fug_a.hoge@example.com'), TRUE);
    }

    @IsTest
    static void test_isValidDate() {
        //【内容】不正日付　（YYYYMMDD）チェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isValidDate('00000220'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20200220'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('99990220'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020220'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020２20'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('202002－20'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('２０２０0220'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('202002-20'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('202002'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020 02 20'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20200399'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20202002'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20022020'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20202020'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02202020'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02202020'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate(null), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate(''), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('    '), FALSE);
        //【内容】不正日付　（YYYY/MM/DD）チェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isValidDate('0000/02/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/02/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('9999/02/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/2/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/２/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/02－20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('２０２０/02/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-02-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/02', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020 02 20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/03/99', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/20/02', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20/02/2020', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20/2020/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02/20/2020', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02/2020/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate(null, CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('    ', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_SLASH), FALSE);
        //【内容】不正日付　（YYYY-MM-DD）チェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isValidDate('0000-02-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-02-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('9999-02-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-2-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-２-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-02－20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('２０２０-02-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020/02/20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-02', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020 02 20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-03-99', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('2020-20-02', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20-02-2020', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('20-2020-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02-20-2020', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('02-2020-20', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate(null, CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidDate('    ', CMC_ConstUtils.FORMAT_DATE.YYYYMMDD_HYPHEN), FALSE);
    }

    @IsTest
    static void test_isValidPhoneNumber() {
        //【内容】電話番号（「XXXX-XXXX-XXXX」）チェック
        //【確認結果】
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000-0000-0000'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0-1-2'), TRUE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('00000-0000-0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('00000-00000-0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('00000-0000-00000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('00000-00000-00000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('00000000-0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000-00000000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('000000000000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000-0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('-0000-0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000--0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000-0000-'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('--0000'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('0000--'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('-0000-'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('--'), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber(null), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber(''), FALSE);
        System.assertEquals(CMC_ValidateUtils.isValidPhoneNumber('    '), FALSE);
    }
}
