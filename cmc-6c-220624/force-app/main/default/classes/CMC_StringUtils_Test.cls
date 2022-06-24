/**
 * @description       : 
 * @author            : dvtruong@cmc
 * @group             : CMC
 * @last modified on  : 2022-06-24
 * @last modified by  : dvtruong@cmc
**/
@IsTest
class CMC_StringUtils_Test {
    
    @IsTest static void substringTest() {
        System.assertEquals(CMC_StringUtils.substring(null, 0, 2), null);
        System.assertEquals(CMC_StringUtils.substring('', 0 , 2), '');
        System.assertEquals(CMC_StringUtils.substring('abc', 0, 2) , 'ab');
        System.assertEquals(CMC_StringUtils.substring('abc', 2, 0) , '');
        System.assertEquals(CMC_StringUtils.substring('abc', 2, 4) , 'c');
        System.assertEquals(CMC_StringUtils.substring('abc', 4, 6) , '');
        System.assertEquals(CMC_StringUtils.substring('abc', 2, 2) , '');
        System.assertEquals(CMC_StringUtils.substring('abc', -6, -4), '');
        System.assertEquals(CMC_StringUtils.substring('abc', -2, -1), 'b');
        System.assertEquals(CMC_StringUtils.substring('abc', -4, 2) , 'ab');
    }

    @IsTest static void defaultStringTest() {
        System.assertEquals(CMC_StringUtils.defaultString(null) , '');
        System.assertEquals(CMC_StringUtils.defaultString('') , '');
        System.assertEquals(CMC_StringUtils.defaultString('bat') , 'bat');
        System.assertEquals(CMC_StringUtils.defaultString(null, 'NULL') , 'NULL');
        System.assertEquals(CMC_StringUtils.defaultString('', 'NULL') , 'NULL');
        System.assertEquals(CMC_StringUtils.defaultString('bat', 'NULL') , 'bat');
    }

    /**
    * @description 指定された形式および文字列で date を構築する処理のテスト
    * @author dvtruong@cmc | 2022-06-24 
    **/
    @IsTest static void datetimeParserTest() {
    }

    /**
    * @description 
    * @author dvtruong@cmc | 2022-06-24 
    **/
    @IsTest static void isSObjectIdTest() {
        System.assertEquals(CMC_StringUtils.isSObjectId(null) , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('') , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('   ') , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000') , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000p') , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000p000000') , false);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000p000000tyqq') , true);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000p000000tyqqAAA') , true);
        System.assertEquals(CMC_StringUtils.isSObjectId('5000p000000tyqqAAABB') , false);
    }
}
