# table-shard

分表，适合水平分表，比如日志




## 集成
```shell
composer require yiche/table-shard 1.0
```


## 使用

```shell
生成数字id
use Yiche\TableShard\Models\SapiDbTbl;

SapiDbTbl::tblNameLatest('sapi_request_log');

```

