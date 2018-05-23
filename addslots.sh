node1：
#!/bin/bash
n=0
for ((i=n;i<=5461;i++))
do
   /home/gfzhujie/zhujie/redis_cluster/redis-stable/src/redis-cli -h 127.0.0.1 -p 7000 -a dxy CLUSTER ADDSLOTS $i
done

node2：
#!/bin/bash
n=5462
for ((i=n;i<=7922;i++))
do
   /home/gfzhujie/zhujie/redis_cluster/redis-stable/src/redis-cli -h 127.0.0.1 -p 7001 -a dxy CLUSTER ADDSLOTS $i
done

node3：
#!/bin/bash
n=7923
for ((i=n;i<=13383;i++))
do
   /home/gfzhujie/zhujie/redis_cluster/redis-stable/src/redis-cli -h 127.0.0.1 -p 7002 -a dxy CLUSTER ADDSLOTS $i
done


node4：
#!/bin/bash
n=13384
for ((i=n;i<=16383;i++))
do
   /home/gfzhujie/zhujie/redis_cluster/redis-stable/src/redis-cli -h 127.0.0.1 -p 7003 -a dxy CLUSTER ADDSLOTS $i
done





