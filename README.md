# 基于PHP的LDAP账号检测&删除脚本
## 关键功能
1. **数据获取：**
通过 HR 系统接口获取员工状态（如离职标记 “8”），匹配 LDAP 中用户邮箱。
2. **LDAP 操作：**
连接 LDAP 服务器，检索所有用户信息（通过ldap_search）。
遍历用户，对比 HR 系统状态，对标记为离职的用户执行ldap_delete删除操作。
3. **通知与日志：**
企业微信机器人实时推送删除结果（成功 / 失败列表）。
定时任务（Cron）每日 10 点触发脚本，日志记录执行详情。
## webhook机器人通知结果
![通知样例](https://i-blog.csdnimg.cn/direct/43ef6f5a54d448dd9f7010fb8dce07b1.jpeg)
## 查询执行日志
```shell
#cat /var/log/ldap/ldap_check_xxxxxxx.log
===== 任务触发时间: 2025-05-20 10:00:01 =====
[2025-05-20 10:00:01] 开始执行LDAP用户离职检查...
发现待检查用户数：212

正在处理用户：demo1@example.com
正在处理用户：demo2@example.com
正在处理用户：demo3@example.com
正在处理用户：demo4@example.com
正在处理用户：demo5@example.com
正在处理用户：无邮箱用户：demo6
...
准备发送通知：LDAP离职用户汇总：狼人1、狼人2、狼人3，已自动删除账号。
[2025-05-20 10:28:59] 检查完成
```
## 非成品项目，仅作逻辑参考，实际使用需自行修改代码
