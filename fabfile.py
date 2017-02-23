from fabric.api import *

CF_FIRMWARE = '~/code/cf-firmware'

def mk(cload = 1):
    with lcd(CF_FIRMWARE):
        if cload:
            local('make clean && make all && make cload')
        else:
            local('make clean && make all')

# TODO
# 1. sshfs
# 2. debug
