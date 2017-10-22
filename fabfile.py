from fabric.api import *
import re

CF_FIRMWARE = '~/code/cf-firmware'
DOWNLOADS = '/tmp/dl'

def mk(cload = 1):
    with lcd(CF_FIRMWARE):
        if cload:
            local('make clean && make all && make cload')
        else:
            local('make clean && make all')

def cpdl(n = 1):
  """ Copy files from /tmp/dl """
  for i in range(1, int(n)+1):
    with lcd(DOWNLOADS):
      out = local(('ls -dt -1 $PWD/** | head -%s | tail -1' % i), capture=True)
    print(out)
    with quiet():
      if(out[-3:] == 'zip'):
        local(('unzip -od . %s' % re.escape(out)))
      else:
        local(('cp %s .' % re.escape(out)))

# TODO
# 1. sshfs
# 2. debug
