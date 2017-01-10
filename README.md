# process-memory-monitor

## About

あるプロセスが使用している各種メモリ情報を標準出力で出力する  
メモリ情報は /proc/$pid/task/$pid/status から取得している  

## Execution

```bash
$ sh process_memory_monitor.sh
```

## Output

```
2017-01-11 01:13:01,proxy,31590,78300,78296,0,14500,14500,9576,88,5888,8856,164,0
```

## Note

$3〜$13の単位は kB

|Column| Value     |Description |
|:-----|:----------|:-----------|
|$1    | $timestamp|タイムスタンプ|
|$2    | $hostname |ホスト名|
|$3    | $pid      |Pid |
|$4    | $vmpeak   |仮想メモリーサイズのピーク値|
|$5    | $vmsize   |仮想メモリーサイズ|
|$6    | $vmlck    |ロックされているメモリーサイズ (mlock(3) 参照)|
|$7    | $vmhwm    |実メモリー上に存在するページサイズ (resident set size) のピーク値 ("high water mark")|
|$8    | $vmrss    |実メモリー上に存在するページサイズ|
|$9    | $vmdata   |データのサイズ|
|$10   | $vmstk    |スタックのサイズ|
|$11   | $vmexe    |テキストセグメントのサイズ|
|$12   | $vmlib    |共有ライブラリコードのサイズ|
|$13   | $vmpte    |ページテーブルエントリーのサイズ (Linux 2.6.10 以降)|
|$14   | $vmswap   |スワップアウトされた仮想メモリーサイズ (Linux 2.6.34 以降)|

## Reference

* [proc - プロセスの情報を含む擬似ファイルシステム  ](https://linuxjm.osdn.jp/html/LDP_man-pages/man5/proc.5.html)
