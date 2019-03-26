<?php

namespace Yiche\TableShard\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * 数据库分表管理
 * Class SapiDbTbl
 * @package App\Models
 * User: lifei
 * Date: 2018-11-28 16:44
 */
class SapiDbTbl extends Model
{
    protected $table = 'sapi_db_tbl';

    /**获取分表最新表名称，此分表使用过日志表
     * @param $tbl_name
     * @return string
     */
    public static function tblNameLatest($tbl_name)
    {
        //todo 缓存
        $tbl = self::where(['tbl_name' => $tbl_name])->first();
        if (!empty($tbl)) {
            return $tbl->tbl_name_latest;
        }
        return '';
    }
}
