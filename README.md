# redis_cluster
脚本部署(redis-trib.rb)：
Redis Cluster有一套管理脚本，如：创建集群、迁移节点、增删槽位等，这些脚本都存放在源码包里，都是用ruby编写的。现在测试用下脚本完成集群的部署。

①：按照需求创建Redis实例，6个实例（3主3从）。

②：安全需要ruby模块：

apt-get install ruby
gem install redis
③：脚本redis-trib.rb（/usr/local/src/redis-3.2.8/src）

复制代码
./redis-trib.rb help
Usage: redis-trib <command> <options> <arguments ...>

#创建集群
create          host1:port1 ... hostN:portN  
                  --replicas <arg> #带上该参数表示是否有从，arg表示从的数量
#检查集群
check           host:port
#查看集群信息
info            host:port
#修复集群
fix             host:port
                  --timeout <arg>
