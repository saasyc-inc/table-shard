# table-shard

分表，适合水平分表，比如日志




## 集成
- composer require yiche/table-shard-dev:master
- php artisan yiche:tableShard-install


## 使用

```shell
生成数字id
use Yiche\TableShard\Models\SapiDbTbl;

SapiDbTbl::tblNameLatest('sapi_request_log');

```

