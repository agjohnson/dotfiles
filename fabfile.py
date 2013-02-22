
from fabric.api import *
from fabric.contrib.project import rsync_project
from contextlib import contextmanager

import os.path

env.disable_known_hosts = True
env.root = "%s/_build/" % os.path.dirname(__file__)
if not env.shell:
  env.shell = "/bin/bash -l -c"
env.user = 'anthony'
env.ssh_key = '~/.ssh/id_rsa.pub'

@task
@runs_once
def build():
    '''Build config files'''
    local('make build')

@task
def deploy():
    '''Install files'''
    sync()

@task
def sync():
    '''Sync scripts to server'''
    rsync_project(
        '~/',
        env.root,
        exclude = [
            ".git*",
            ".git/*",
            "fabfile.py",
        ]
    )

@task
def ssh():
    '''Add SSH authorized key'''
    if not exists('.ssh/'):
        run('mkdir .ssh')
    put(env.ssh_key, '.ssh/authorized_keys')

def exists(path):
    '''Same as the contrib.files.exists, only with a different test'''
    with settings(hide('everything'), warn_only=True):
        return not run("test -e %s" % path).failed
