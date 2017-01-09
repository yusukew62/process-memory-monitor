# process-memory-monitor

## About

あるプロセスが使用している各種メモリ情報を標準出力で出力する  
メモリ情報は /proc/\$pid/task/\$pid/status から取得している  

## Execution

```bash
$ sh process_memory_monitor.sh
```

## Output

```
2017-01-09 10:07:48,1371,140728,140696,0,75672,75672,69908,88,5888,8876,288,0
```

## Note

\$3〜\$13の単位は kB

|Column| Value  |Description |
|:-----|:-------|:-----------|
|$1 | $timestamp|タイムスタンプ |
|$2 | $pid      |Pid         |
|$3 | $vmpeak   |仮想メモリーサイズのピーク値|
|$4 | $vmsize   |仮想メモリーサイズ|
|$5 | $vmlck    |ロックされているメモリーサイズ (mlock(3) 参照)|
|$6 | $vmhwm    |実メモリー上に存在するページサイズ (resident set size) のピーク値 ("high water mark")|
|$7 | $vmrss    |実メモリー上に存在するページサイズ|
|$8 | $vmdata   |データのサイズ|
|$9 | $vmstk    |スタックのサイズ|
|$10| $vmexe    |テキストセグメントのサイズ|
|$11| $vmlib    |共有ライブラリコードのサイズ|
|$12| $vmpte    |ページテーブルエントリーのサイズ (Linux 2.6.10 以降)|
|$13| $vmswap   |スワップアウトされた仮想メモリーサイズ (Linux 2.6.34 以降)|

## Reference

* [proc - プロセスの情報を含む擬似ファイルシステム  ](https://linuxjm.osdn.jp/html/LDP_man-pages/man5/proc.5.html)
