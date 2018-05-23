#!/usr/bin/python
# -*- encoding: utf-8 -*-

import redis
import time
import random
import sys


from rediscluster import StrictRedisCluster

redis_nodes =  [{'host':'127.0.0.1','port':7000},
                {'host':'192.168.100.135','port':7021},
                {'host':'192.168.100.136','port':7021},
                {'host':'192.168.100.134','port':7022},
                {'host':'192.168.100.135','port':7022},
                {'host':'192.168.100.136','port':7022}
                ]

try:
    r = StrictRedisCluster(startup_nodes=redis_nodes,password='dxy')
except Exception,e:
    print "Connect Error!"
    sys.exit()

#使得一个主从节点全部挂了，其他节点也支持数据处理
r.config_set('cluster-require-full-coverage','yes')

max_long = 9223372036854775807
set_index = max_long
post_index = max_long
count = 0
num_sets = 300000
set_size = 1

for i in xrange(0, num_sets):
    for j in xrange(0, set_size):
        r.zadd("%s" % (set_index), time.time() * (random.random() + 1),post_index)
        post_index = max_long - random.randint(1, 10000000000)
    set_index -= 1
