Last login: Tue Dec 12 16:28:26 on console
raou:~ maezato$ cd desktop/webapp2017/devenv/tukutter
raou:tukutter maezato$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Checking if box 'ubuntu/xenial64' is up to date...
==> default: A newer version of the box 'ubuntu/xenial64' is available! You currently
==> default: have version '20171122.0.0'. The latest is version '20171208.0.0'. Run
==> default: `vagrant box update` to update.
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 80 (guest) => 8080 (host) (adapter 1)
    default: 3031 (guest) => 3031 (host) (adapter 1)
    default: 3306 (guest) => 3306 (host) (adapter 1)
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: ubuntu
    default: SSH auth method: password
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: The guest additions on this VM do not match the installed version of
    default: VirtualBox! In most cases this is fine, but in rare cases it can
    default: prevent things such as shared folders from working properly. If you see
    default: shared folder errors, please make sure the guest additions within the
    default: virtual machine match the version of VirtualBox you have installed on
    default: your host and reload your VM.
    default:
    default: Guest Additions Version: 5.0.40
    default: VirtualBox Version: 5.1
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/maezato/Desktop/webapp2017/devenv
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
raou:tukutter maezato$ vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
raou:tukutter maezato$ vagrant ssh
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-103-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

37 packages can be updated.
0 updates are security updates.


Last login: Tue Dec 12 06:50:08 2017 from 10.0.2.2
ubuntu@ubuntu-xenial:~$ cd /var/www/tukutter
ubuntu@ubuntu-xenial:/var/www/tukutter$ ls
static     test01.py    tukutter.png  ubuntu-xenial-16.04-cloudimg-console.log
templates  tukutterenv  tukutter.py
ubuntu@ubuntu-xenial:/var/www/tukutter$ source tukutterenv/bin/activate
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ ls
static     test01.py    tukutter.png  ubuntu-xenial-16.04-cloudimg-console.log
templates  tukutterenv  tukutter.py
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 08:00:21 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:35185 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1b92d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1b92d00 pid: 1758 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1758)
spawned uWSGI worker 1 (pid: 1760, cores: 2)
spawned uWSGI worker 2 (pid: 1761, cores: 2)
spawned uWSGI worker 3 (pid: 1762, cores: 2)
spawned uWSGI worker 4 (pid: 1764, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1765)
[pid: 1764|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 08:00:30 2017] GET / => generated 261 bytes in 13 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 08:00:30 2017] GET /login => generated 1346 bytes in 34 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 2/3] 127.0.0.1 () {40 vars in 656 bytes} [Tue Dec 12 08:00:30 2017] GET /favicon.ico => generated 233 bytes in 22 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1762|app: 0|req: 1/4] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 08:00:33 2017] POST /login => generated 1346 bytes in 71 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 3/5] 127.0.0.1 () {50 vars in 860 bytes} [Tue Dec 12 08:00:39 2017] POST /login => generated 257 bytes in 26 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 4/6] 127.0.0.1 () {44 vars in 751 bytes} [Tue Dec 12 08:00:39 2017] GET /top => generated 1357 bytes in 21 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1762|app: 0|req: 2/7] 127.0.0.1 () {40 vars in 617 bytes} [Tue Dec 12 08:00:39 2017] GET /js/index.js => generated 233 bytes in 38 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1760|app: 0|req: 5/8] 127.0.0.1 () {42 vars in 738 bytes} [Tue Dec 12 08:01:27 2017] GET /favorite.html => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 6/9] 127.0.0.1 () {42 vars in 732 bytes} [Tue Dec 12 08:01:30 2017] GET /tweet.html => generated 233 bytes in 4 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1762|app: 0|req: 3/10] 127.0.0.1 () {42 vars in 734 bytes} [Tue Dec 12 08:01:34 2017] GET /search.html => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 7/11] 127.0.0.1 () {42 vars in 726 bytes} [Tue Dec 12 08:10:13 2017] GET /regist => generated 1487 bytes in 3 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1761|app: 0|req: 1/12] 127.0.0.1 () {50 vars in 865 bytes} [Tue Dec 12 08:10:38 2017] POST /regist => generated 1346 bytes in 57 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1761|app: 0|req: 2/13] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 08:10:45 2017] POST /login => generated 257 bytes in 12 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 1)
[pid: 1762|app: 0|req: 4/14] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 08:10:45 2017] GET /top => generated 1357 bytes in 18 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1762|app: 0|req: 5/15] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:10:45 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1762|app: 0|req: 6/16] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:10:45 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1764|app: 0|req: 2/17] 127.0.0.1 () {42 vars in 729 bytes} [Tue Dec 12 08:10:48 2017] GET /top.html => generated 233 bytes in 18 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1760|app: 0|req: 8/18] 127.0.0.1 () {42 vars in 719 bytes} [Tue Dec 12 08:10:51 2017] GET /top => generated 1357 bytes in 2 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1760|app: 0|req: 9/19] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:10:51 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 10/20] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:10:52 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1764|app: 0|req: 3/21] 127.0.0.1 () {50 vars in 863 bytes} [Tue Dec 12 08:10:58 2017] POST /login => generated 1346 bytes in 57 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1760|app: 0|req: 11/22] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 08:11:05 2017] POST /login => generated 257 bytes in 1 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 1)
[pid: 1760|app: 0|req: 12/23] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 08:11:05 2017] GET /top => generated 1357 bytes in 2 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1762|app: 0|req: 7/24] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:11:05 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1764|app: 0|req: 4/25] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 08:11:05 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1765)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 11:43:38 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:32926 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0xcc9d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0xcc9d00 pid: 1775 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1775)
spawned uWSGI worker 1 (pid: 1777, cores: 2)
spawned uWSGI worker 2 (pid: 1778, cores: 2)
spawned uWSGI worker 3 (pid: 1779, cores: 2)
spawned uWSGI worker 4 (pid: 1780, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1781)
[pid: 1780|app: 0|req: 1/1] 127.0.0.1 () {42 vars in 703 bytes} [Tue Dec 12 11:43:41 2017] GET / => generated 261 bytes in 13 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1778|app: 0|req: 1/2] 127.0.0.1 () {42 vars in 713 bytes} [Tue Dec 12 11:43:41 2017] GET /login => generated 1346 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1779|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 11:43:54 2017] POST /login => generated 257 bytes in 41 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
[pid: 1777|app: 0|req: 1/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 11:43:54 2017] GET /top => generated 1357 bytes in 51 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1778|app: 0|req: 2/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:43:54 2017] GET /js/index.js => generated 233 bytes in 45 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1778|app: 0|req: 3/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:43:54 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1781)
^[[Aworker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 11:45:59 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:36062 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x25a5d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x25a5d00 pid: 1786 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1786)
spawned uWSGI worker 1 (pid: 1788, cores: 2)
spawned uWSGI worker 2 (pid: 1789, cores: 2)
spawned uWSGI worker 3 (pid: 1790, cores: 2)
spawned uWSGI worker 4 (pid: 1791, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1793)
[pid: 1789|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 11:46:09 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1788|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 11:46:09 2017] GET /login => generated 1346 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1788|app: 0|req: 2/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 11:46:15 2017] POST /login => generated 257 bytes in 33 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 1)
[pid: 1788|app: 0|req: 3/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 11:46:15 2017] GET /top => generated 1357 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1791|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:46:15 2017] GET /js/index.js => generated 233 bytes in 43 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1788|app: 0|req: 4/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:46:15 2017] GET /js/index.js => generated 233 bytes in 24 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1793)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 11:48:03 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:34092 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1bcfd00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1bcfd00 pid: 1797 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1797)
spawned uWSGI worker 1 (pid: 1799, cores: 2)
spawned uWSGI worker 2 (pid: 1800, cores: 2)
spawned uWSGI worker 3 (pid: 1801, cores: 2)
spawned uWSGI worker 4 (pid: 1802, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1803)
[pid: 1801|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 11:48:11 2017] GET / => generated 261 bytes in 10 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1801|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 11:48:11 2017] GET /login => generated 1346 bytes in 9 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1800|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 11:48:17 2017] POST /login => generated 257 bytes in 47 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
[pid: 1802|app: 0|req: 1/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 11:48:17 2017] GET /top => generated 1358 bytes in 56 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1799|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:48:17 2017] GET /js/index.js => generated 233 bytes in 57 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1799|app: 0|req: 2/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:48:17 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1803)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 11:49:44 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:40998 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x22d4d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x22d4d00 pid: 1808 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1808)
spawned uWSGI worker 1 (pid: 1810, cores: 2)
spawned uWSGI worker 2 (pid: 1811, cores: 2)
spawned uWSGI worker 3 (pid: 1812, cores: 2)
spawned uWSGI worker 4 (pid: 1813, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1815)
[pid: 1810|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 11:49:52 2017] GET / => generated 261 bytes in 14 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1812|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 11:49:52 2017] GET /login => generated 1346 bytes in 17 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1811|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 11:49:57 2017] POST /login => generated 257 bytes in 44 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
[pid: 1811|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 11:49:58 2017] GET /top => generated 1357 bytes in 18 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1811|app: 0|req: 3/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:49:58 2017] GET /js/index.js => generated 233 bytes in 29 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1811|app: 0|req: 4/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:49:58 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1815)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 11:51:00 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:42178 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x9dfd00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x9dfd00 pid: 1819 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1819)
spawned uWSGI worker 1 (pid: 1821, cores: 2)
spawned uWSGI worker 2 (pid: 1822, cores: 2)
spawned uWSGI worker 3 (pid: 1823, cores: 2)
spawned uWSGI worker 4 (pid: 1825, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1826)
[pid: 1823|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 11:51:07 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1823|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 11:51:07 2017] GET /login => generated 1346 bytes in 10 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1825|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 11:51:23 2017] POST /login => generated 257 bytes in 43 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
()
[pid: 1825|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 11:51:23 2017] GET /top => generated 1357 bytes in 19 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1825|app: 0|req: 3/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:51:23 2017] GET /js/index.js => generated 233 bytes in 28 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1823|app: 0|req: 3/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 11:51:23 2017] GET /js/index.js => generated 233 bytes in 18 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1826)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 12:03:02 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:46313 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x16a2d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x16a2d00 pid: 1895 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1895)
spawned uWSGI worker 1 (pid: 1897, cores: 2)
spawned uWSGI worker 2 (pid: 1898, cores: 2)
spawned uWSGI worker 3 (pid: 1899, cores: 2)
spawned uWSGI worker 4 (pid: 1900, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1901)
[pid: 1898|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 12:03:08 2017] GET / => generated 261 bytes in 12 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1899|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 12:03:08 2017] GET /login => generated 1346 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1897|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:03:14 2017] POST /login => generated 257 bytes in 38 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1897|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:03:14 2017] GET /top => generated 1357 bytes in 21 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1897|app: 0|req: 3/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:03:14 2017] GET /js/index.js => generated 233 bytes in 28 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1897|app: 0|req: 4/6] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:03:14 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1900|app: 0|req: 1/7] 127.0.0.1 () {42 vars in 729 bytes} [Tue Dec 12 12:06:29 2017] GET /top.html => generated 233 bytes in 21 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1900|app: 0|req: 2/8] 127.0.0.1 () {42 vars in 729 bytes} [Tue Dec 12 12:06:34 2017] GET /top.html => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1899|app: 0|req: 2/9] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 12:39:27 2017] GET /login => generated 1346 bytes in 0 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1899|app: 0|req: 3/10] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:39:34 2017] POST /login => generated 257 bytes in 35 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1897|app: 0|req: 5/11] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:39:34 2017] GET /top => generated 1357 bytes in 2 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1897|app: 0|req: 6/12] 127.0.0.1 () {40 vars in 616 bytes} [Tue Dec 12 12:39:34 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1897|app: 0|req: 7/13] 127.0.0.1 () {40 vars in 617 bytes} [Tue Dec 12 12:39:34 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1901)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 12:40:38 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:43983 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1cc7d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1cc7d00 pid: 1917 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1917)
spawned uWSGI worker 1 (pid: 1919, cores: 2)
spawned uWSGI worker 2 (pid: 1920, cores: 2)
spawned uWSGI worker 3 (pid: 1921, cores: 2)
spawned uWSGI worker 4 (pid: 1922, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1923)
[pid: 1919|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 671 bytes} [Tue Dec 12 12:40:44 2017] GET / => generated 261 bytes in 10 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1919|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 681 bytes} [Tue Dec 12 12:40:44 2017] GET /login => generated 1346 bytes in 10 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1921|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 861 bytes} [Tue Dec 12 12:40:50 2017] POST /login => generated 257 bytes in 32 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1921|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 751 bytes} [Tue Dec 12 12:40:50 2017] GET /top => generated 1353 bytes in 21 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1922|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 617 bytes} [Tue Dec 12 12:40:50 2017] GET /js/index.js => generated 233 bytes in 45 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1921|app: 0|req: 3/6] 127.0.0.1 () {40 vars in 617 bytes} [Tue Dec 12 12:40:50 2017] GET /js/index.js => generated 233 bytes in 29 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1919|app: 0|req: 3/7] 127.0.0.1 () {40 vars in 671 bytes} [Tue Dec 12 12:45:37 2017] GET / => generated 261 bytes in 0 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1922|app: 0|req: 2/8] 127.0.0.1 () {40 vars in 681 bytes} [Tue Dec 12 12:45:37 2017] GET /login => generated 1346 bytes in 15 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1920|app: 0|req: 1/9] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:45:42 2017] POST /login => generated 257 bytes in 34 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1922|app: 0|req: 3/10] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:45:42 2017] GET /top => generated 1353 bytes in 30 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1921|app: 0|req: 4/11] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:45:42 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1919|app: 0|req: 4/12] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:45:42 2017] GET /js/index.js => generated 233 bytes in 27 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1923)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 12:49:20 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:42308 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0xbe7d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
  File "tukutter.py", line 97
    if
     ^
SyntaxError: invalid syntax
failed to parse file tukutter.py
unable to load app 0 (mountpoint='') (callable not found or import error)
*** no app loaded. going in full dynamic mode ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1929)
spawned uWSGI worker 1 (pid: 1930, cores: 2)
spawned uWSGI worker 2 (pid: 1931, cores: 2)
spawned uWSGI worker 3 (pid: 1932, cores: 2)
spawned uWSGI worker 4 (pid: 1933, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1934)
--- no python application found, check your startup logs for errors ---
[pid: 1932|app: -1|req: -1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 12:49:30 2017] GET / => generated 21 bytes in 0 msecs (HTTP/1.0 500) 2 headers in 83 bytes (0 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1934)
worker 3 buried after 0 seconds
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 12:50:08 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:36940 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1a30d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1a30d00 pid: 1939 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1939)
spawned uWSGI worker 1 (pid: 1941, cores: 2)
spawned uWSGI worker 2 (pid: 1942, cores: 2)
spawned uWSGI worker 3 (pid: 1943, cores: 2)
spawned uWSGI worker 4 (pid: 1944, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1947)
[pid: 1943|app: 0|req: 1/1] 127.0.0.1 () {42 vars in 703 bytes} [Tue Dec 12 12:50:12 2017] GET / => generated 261 bytes in 18 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1944|app: 0|req: 1/2] 127.0.0.1 () {42 vars in 713 bytes} [Tue Dec 12 12:50:12 2017] GET /login => generated 1346 bytes in 17 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 1941|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:50:17 2017] POST /login => generated 257 bytes in 36 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1941|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:50:17 2017] GET /top => generated 1353 bytes in 20 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1942|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:50:17 2017] GET /js/index.js => generated 233 bytes in 49 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1947)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 12:52:02 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:34316 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x14d6d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 0 seconds on interpreter 0x14d6d00 pid: 1950 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1950)
spawned uWSGI worker 1 (pid: 1952, cores: 2)
spawned uWSGI worker 2 (pid: 1953, cores: 2)
spawned uWSGI worker 3 (pid: 1954, cores: 2)
spawned uWSGI worker 4 (pid: 1955, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1957)
[pid: 1952|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 12:52:12 2017] GET / => generated 261 bytes in 8 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1952|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 12:52:12 2017] GET /login => generated 1346 bytes in 11 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1953|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:52:16 2017] POST /login => generated 257 bytes in 42 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1953|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:52:16 2017] GET /top => generated 1353 bytes in 17 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1955|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:52:16 2017] GET /js/index.js => generated 233 bytes in 71 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1955|app: 0|req: 2/6] 127.0.0.1 () {42 vars in 729 bytes} [Tue Dec 12 12:52:18 2017] GET /top.html => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1953|app: 0|req: 3/7] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 12:53:15 2017] GET / => generated 261 bytes in 3 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1952|app: 0|req: 3/8] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 12:53:15 2017] GET /login => generated 1346 bytes in 0 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 1954|app: 0|req: 1/9] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:53:20 2017] POST /login => generated 257 bytes in 45 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 0)
None
()
[pid: 1954|app: 0|req: 2/10] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:53:20 2017] GET /top => generated 1353 bytes in 18 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1955|app: 0|req: 3/11] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:53:20 2017] GET /js/index.js => generated 233 bytes in 23 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1953|app: 0|req: 4/12] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:53:20 2017] GET /js/index.js => generated 233 bytes in 26 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1952|app: 0|req: 4/13] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 12:58:07 2017] GET / => generated 261 bytes in 0 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1952|app: 0|req: 5/14] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 12:58:07 2017] GET /login => generated 1346 bytes in 0 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1955|app: 0|req: 4/15] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 12:58:12 2017] POST /login => generated 257 bytes in 40 msecs (HTTP/1.0 302) 4 headers in 153 bytes (1 switches on core 1)
None
()
[pid: 1955|app: 0|req: 5/16] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:58:12 2017] GET /top => generated 1353 bytes in 18 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1953|app: 0|req: 5/17] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:58:12 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1952|app: 0|req: 6/18] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:58:13 2017] GET /js/index.js => generated 233 bytes in 25 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
None
()
[pid: 1954|app: 0|req: 3/19] 127.0.0.1 () {44 vars in 752 bytes} [Tue Dec 12 12:59:17 2017] GET /top => generated 1353 bytes in 1 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1954|app: 0|req: 4/20] 127.0.0.1 () {40 vars in 618 bytes} [Tue Dec 12 12:59:17 2017] GET /js/index.js => generated 233 bytes in 32 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1957)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:00:26 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:37299 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x231ed00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x231ed00 pid: 1961 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1961)
spawned uWSGI worker 1 (pid: 1963, cores: 2)
spawned uWSGI worker 2 (pid: 1964, cores: 2)
spawned uWSGI worker 3 (pid: 1965, cores: 2)
spawned uWSGI worker 4 (pid: 1966, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1967)
[pid: 1966|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 672 bytes} [Tue Dec 12 13:00:30 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1964|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 682 bytes} [Tue Dec 12 13:00:30 2017] GET /login => generated 1346 bytes in 14 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 1965|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 862 bytes} [Tue Dec 12 13:00:38 2017] POST /login => generated 257 bytes in 36 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
None
()
[pid: 1963|app: 0|req: 1/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:00:38 2017] GET /top => generated 1353 bytes in 45 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1963|app: 0|req: 2/5] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:00:38 2017] GET /js/index.js => generated 233 bytes in 48 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1967)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:03:25 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:34351 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1cc7d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1cc7d00 pid: 1972 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1972)
spawned uWSGI worker 1 (pid: 1974, cores: 2)
spawned uWSGI worker 2 (pid: 1975, cores: 2)
spawned uWSGI worker 3 (pid: 1976, cores: 2)
spawned uWSGI worker 4 (pid: 1977, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1978)
[pid: 1975|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:03:34 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1974|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:03:34 2017] GET /login => generated 1346 bytes in 18 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 1974|app: 0|req: 2/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:03:41 2017] POST /login => generated 257 bytes in 40 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 1)
[2017-12-12 13:03:41,632] ERROR in app: Exception on /top [GET]
Traceback (most recent call last):
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1982, in wsgi_app
    response = self.full_dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1614, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1517, in handle_user_exception
    reraise(exc_type, exc_value, tb)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/_compat.py", line 33, in reraise
    raise value
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1612, in full_dispatch_request
    rv = self.dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1598, in dispatch_request
    return self.view_functions[rule.endpoint](**req.view_args)
  File "tukutter.py", line 112, in show_top
    print('loginid='+login)
NameError: name 'login' is not defined
[pid: 1974|app: 0|req: 3/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:03:41 2017] GET /top => generated 291 bytes in 46 msecs (HTTP/1.0 500) 2 headers in 84 bytes (1 switches on core 0)
[pid: 1977|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:04:03 2017] GET / => generated 261 bytes in 18 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1974|app: 0|req: 4/6] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:04:03 2017] GET /login => generated 1346 bytes in 0 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1977|app: 0|req: 2/7] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:04:09 2017] POST /login => generated 257 bytes in 30 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 1)
[2017-12-12 13:04:09,631] ERROR in app: Exception on /top [GET]
Traceback (most recent call last):
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1982, in wsgi_app
    response = self.full_dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1614, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1517, in handle_user_exception
    reraise(exc_type, exc_value, tb)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/_compat.py", line 33, in reraise
    raise value
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1612, in full_dispatch_request
    rv = self.dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1598, in dispatch_request
    return self.view_functions[rule.endpoint](**req.view_args)
  File "tukutter.py", line 112, in show_top
    #print('loginid='+login)
NameError: name 'login' is not defined
[pid: 1974|app: 0|req: 5/8] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:04:09 2017] GET /top => generated 291 bytes in 5 msecs (HTTP/1.0 500) 2 headers in 84 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1978)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:04:57 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:46728 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1fb1d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1fb1d00 pid: 1983 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1983)
spawned uWSGI worker 1 (pid: 1985, cores: 2)
spawned uWSGI worker 2 (pid: 1986, cores: 2)
spawned uWSGI worker 3 (pid: 1987, cores: 2)
spawned uWSGI worker 4 (pid: 1988, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1989)
[pid: 1985|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:05:02 2017] GET / => generated 261 bytes in 14 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1985|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:05:02 2017] GET /login => generated 1346 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1987|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:05:06 2017] POST /login => generated 257 bytes in 39 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
[pid: 1988|app: 0|req: 1/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:05:06 2017] GET /top => generated 1353 bytes in 53 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
[pid: 1985|app: 0|req: 3/5] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:05:06 2017] GET /js/index.js => generated 233 bytes in 64 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1985|app: 0|req: 4/6] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:05:07 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1986|app: 0|req: 1/7] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:06:56 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 1987|app: 0|req: 2/8] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:06:56 2017] GET /login => generated 1346 bytes in 12 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1987|app: 0|req: 3/9] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:07:04 2017] POST /login => generated 257 bytes in 2 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
[pid: 1988|app: 0|req: 2/10] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:07:04 2017] GET /top => generated 1353 bytes in 1 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1988|app: 0|req: 3/11] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:07:04 2017] GET /js/index.js => generated 233 bytes in 31 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1988|app: 0|req: 4/12] 127.0.0.1 () {40 vars in 634 bytes} [Tue Dec 12 13:07:04 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 1985|app: 0|req: 5/13] 127.0.0.1 () {40 vars in 689 bytes} [Tue Dec 12 13:10:19 2017] GET / => generated 261 bytes in 0 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 1)
[pid: 1988|app: 0|req: 5/14] 127.0.0.1 () {40 vars in 699 bytes} [Tue Dec 12 13:10:19 2017] GET /login => generated 1346 bytes in 3 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 1985|app: 0|req: 6/15] 127.0.0.1 () {50 vars in 879 bytes} [Tue Dec 12 13:10:26 2017] POST /login => generated 257 bytes in 29 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
[pid: 1987|app: 0|req: 4/16] 127.0.0.1 () {44 vars in 769 bytes} [Tue Dec 12 13:10:26 2017] GET /top => generated 1353 bytes in 15 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 1987|app: 0|req: 5/17] 127.0.0.1 () {40 vars in 635 bytes} [Tue Dec 12 13:10:26 2017] GET /js/index.js => generated 233 bytes in 50 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 1985|app: 0|req: 7/18] 127.0.0.1 () {40 vars in 635 bytes} [Tue Dec 12 13:10:26 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1989)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:11:21 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:32905 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1d71d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
  File "tukutter.py", line 112
    print('loginid=' + loginid))
                               ^
SyntaxError: invalid syntax
failed to parse file tukutter.py
unable to load app 0 (mountpoint='') (callable not found or import error)
*** no app loaded. going in full dynamic mode ***
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 1994)
spawned uWSGI worker 1 (pid: 1995, cores: 2)
spawned uWSGI worker 2 (pid: 1996, cores: 2)
spawned uWSGI worker 3 (pid: 1997, cores: 2)
spawned uWSGI worker 4 (pid: 1998, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 1999)
--- no python application found, check your startup logs for errors ---
[pid: 1996|app: -1|req: -1/1] 127.0.0.1 () {40 vars in 689 bytes} [Tue Dec 12 13:11:31 2017] GET / => generated 21 bytes in 1 msecs (HTTP/1.0 500) 2 headers in 83 bytes (0 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 1999)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:12:10 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:35981 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1cc8d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 0 seconds on interpreter 0x1cc8d00 pid: 2004 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2004)
spawned uWSGI worker 1 (pid: 2006, cores: 2)
spawned uWSGI worker 2 (pid: 2007, cores: 2)
spawned uWSGI worker 3 (pid: 2009, cores: 2)
spawned uWSGI worker 4 (pid: 2010, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2012)
[pid: 2010|app: 0|req: 1/1] 127.0.0.1 () {42 vars in 720 bytes} [Tue Dec 12 13:12:15 2017] GET / => generated 261 bytes in 14 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2009|app: 0|req: 1/2] 127.0.0.1 () {42 vars in 730 bytes} [Tue Dec 12 13:12:15 2017] GET /login => generated 1346 bytes in 21 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 2007|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:12:21 2017] POST /login => generated 257 bytes in 33 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
[2017-12-12 13:12:21,296] ERROR in app: Exception on /top [GET]
Traceback (most recent call last):
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1982, in wsgi_app
    response = self.full_dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1614, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1517, in handle_user_exception
    reraise(exc_type, exc_value, tb)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/_compat.py", line 33, in reraise
    raise value
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1612, in full_dispatch_request
    rv = self.dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1598, in dispatch_request
    return self.view_functions[rule.endpoint](**req.view_args)
  File "tukutter.py", line 112, in show_top
    print('loginid=' + loginid)
TypeError: Can't convert 'NoneType' object to str implicitly
[pid: 2007|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:12:21 2017] GET /top => generated 291 bytes in 16 msecs (HTTP/1.0 500) 2 headers in 84 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2012)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:13:52 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:43764 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1b79d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1b79d00 pid: 2015 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2015)
spawned uWSGI worker 1 (pid: 2017, cores: 2)
spawned uWSGI worker 2 (pid: 2018, cores: 2)
spawned uWSGI worker 3 (pid: 2019, cores: 2)
spawned uWSGI worker 4 (pid: 2020, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2022)
[pid: 2017|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:13:57 2017] GET / => generated 261 bytes in 12 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2017|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:13:57 2017] GET /login => generated 1346 bytes in 11 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 2018|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:14:03 2017] POST /login => generated 257 bytes in 40 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
None
maezato
[pid: 2018|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:14:04 2017] GET /top => generated 1353 bytes in 19 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 2020|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:14:04 2017] GET /js/index.js => generated 233 bytes in 64 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 2020|app: 0|req: 2/6] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:14:04 2017] GET /js/index.js => generated 233 bytes in 0 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2022)
^[[Aworker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:15:14 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:46068 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0xa88d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 0 seconds on interpreter 0xa88d00 pid: 2026 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2026)
spawned uWSGI worker 1 (pid: 2028, cores: 2)
spawned uWSGI worker 2 (pid: 2029, cores: 2)
spawned uWSGI worker 3 (pid: 2030, cores: 2)
spawned uWSGI worker 4 (pid: 2031, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2034)
[pid: 2029|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:15:21 2017] GET / => generated 261 bytes in 13 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2030|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:15:21 2017] GET /login => generated 1346 bytes in 13 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 2031|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:15:26 2017] POST /login => generated 257 bytes in 52 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
aaa
maezato
[pid: 2029|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:15:26 2017] GET /top => generated 1353 bytes in 74 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 2028|app: 0|req: 1/5] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:15:26 2017] GET /js/index.js => generated 233 bytes in 38 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 2028|app: 0|req: 2/6] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:15:26 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 1)
[pid: 2028|app: 0|req: 3/7] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:24:12 2017] GET / => generated 261 bytes in 9 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 1)
[pid: 2030|app: 0|req: 2/8] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:24:12 2017] GET /login => generated 1346 bytes in 0 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 2030|app: 0|req: 3/9] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:24:24 2017] POST /login => generated 257 bytes in 51 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
aaa
maezato
[pid: 2031|app: 0|req: 2/10] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:24:24 2017] GET /top => generated 1353 bytes in 20 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 2031|app: 0|req: 3/11] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:24:24 2017] GET /js/index.js => generated 233 bytes in 86 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 2028|app: 0|req: 4/12] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:24:25 2017] GET /js/index.js => generated 233 bytes in 1 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2034)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:27:03 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:36877 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x1333d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x1333d00 pid: 2040 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2040)
spawned uWSGI worker 1 (pid: 2042, cores: 2)
spawned uWSGI worker 2 (pid: 2043, cores: 2)
spawned uWSGI worker 3 (pid: 2044, cores: 2)
spawned uWSGI worker 4 (pid: 2045, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2048)
[pid: 2045|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:27:10 2017] GET / => generated 261 bytes in 16 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2044|app: 0|req: 1/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:27:10 2017] GET /login => generated 1346 bytes in 20 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 0)
maezato
[pid: 2042|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:27:15 2017] POST /login => generated 257 bytes in 34 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
[2017-12-12 13:27:15,315] ERROR in app: Exception on /top [GET]
Traceback (most recent call last):
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1982, in wsgi_app
    response = self.full_dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1614, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1517, in handle_user_exception
    reraise(exc_type, exc_value, tb)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/_compat.py", line 33, in reraise
    raise value
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1612, in full_dispatch_request
    rv = self.dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1598, in dispatch_request
    return self.view_functions[rule.endpoint](**req.view_args)
  File "tukutter.py", line 100, in show_top
    html = render_template('top.html',username=request.cookies.get('username', None),rows=result)
UnboundLocalError: local variable 'result' referenced before assignment
[pid: 2042|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:27:15 2017] GET /top => generated 291 bytes in 15 msecs (HTTP/1.0 500) 2 headers in 84 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2048)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:28:27 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:42236 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x14e6d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 0 seconds on interpreter 0x14e6d00 pid: 2051 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2051)
spawned uWSGI worker 1 (pid: 2053, cores: 2)
spawned uWSGI worker 2 (pid: 2054, cores: 2)
spawned uWSGI worker 3 (pid: 2055, cores: 2)
spawned uWSGI worker 4 (pid: 2056, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2058)
[pid: 2053|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:28:33 2017] GET / => generated 261 bytes in 10 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2053|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:28:33 2017] GET /login => generated 1346 bytes in 12 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 2054|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:28:39 2017] POST /login => generated 257 bytes in 39 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
aaa
[2017-12-12 13:28:39,524] ERROR in app: Exception on /top [GET]
Traceback (most recent call last):
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1982, in wsgi_app
    response = self.full_dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1614, in full_dispatch_request
    rv = self.handle_user_exception(e)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1517, in handle_user_exception
    reraise(exc_type, exc_value, tb)
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/_compat.py", line 33, in reraise
    raise value
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1612, in full_dispatch_request
    rv = self.dispatch_request()
  File "/vagrant/tukutter/tukutterenv/lib/python3.5/site-packages/flask/app.py", line 1598, in dispatch_request
    return self.view_functions[rule.endpoint](**req.view_args)
  File "tukutter.py", line 115, in show_top
    print(username)
NameError: name 'username' is not defined
[pid: 2054|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:28:39 2017] GET /top => generated 291 bytes in 32 msecs (HTTP/1.0 500) 2 headers in 84 bytes (1 switches on core 1)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2058)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ uwsgi --http :3031 --wsgi-file tukutter.py --processes 4 --threads 2 --stats :9191
*** Starting uWSGI 2.0.15 (64bit) on [Tue Dec 12 13:29:52 2017] ***
compiled with version: 5.4.0 20160609 on 08 November 2017 11:27:03
os: Linux-4.4.0-103-generic #126-Ubuntu SMP Mon Dec 4 16:23:28 UTC 2017
nodename: ubuntu-xenial
machine: x86_64
clock source: unix
detected number of CPU cores: 2
current working directory: /vagrant/tukutter
detected binary path: /vagrant/tukutter/tukutterenv/bin/uwsgi
!!! no internal routing support, rebuild with pcre support !!!
your processes number limit is 3895
your memory page size is 4096 bytes
detected max file descriptor number: 1024
lock engine: pthread robust mutexes
thunder lock: disabled (you can enable it with --thunder-lock)
uWSGI http bound on :3031 fd 4
uwsgi socket 0 bound to TCP address 127.0.0.1:45126 (port auto-assigned) fd 3
Python version: 3.5.2 (default, Nov 23 2017, 16:37:01)  [GCC 5.4.0 20160609]
Python main interpreter initialized at 0x20b2d00
python threads support enabled
your server socket listen backlog is limited to 100 connections
your mercy for graceful operations on workers is 60 seconds
mapped 415280 bytes (405 KB) for 8 cores
*** Operational MODE: preforking+threaded ***
WSGI app 0 (mountpoint='') ready in 1 seconds on interpreter 0x20b2d00 pid: 2062 (default app)
*** uWSGI is running in multiple interpreter mode ***
spawned uWSGI master process (pid: 2062)
spawned uWSGI worker 1 (pid: 2064, cores: 2)
spawned uWSGI worker 2 (pid: 2065, cores: 2)
spawned uWSGI worker 3 (pid: 2066, cores: 2)
spawned uWSGI worker 4 (pid: 2067, cores: 2)
*** Stats server enabled on :9191 fd: 18 ***
spawned uWSGI http 1 (pid: 2068)
[pid: 2064|app: 0|req: 1/1] 127.0.0.1 () {40 vars in 690 bytes} [Tue Dec 12 13:29:58 2017] GET / => generated 261 bytes in 11 msecs (HTTP/1.0 302) 3 headers in 122 bytes (1 switches on core 0)
[pid: 2064|app: 0|req: 2/2] 127.0.0.1 () {40 vars in 700 bytes} [Tue Dec 12 13:29:58 2017] GET /login => generated 1346 bytes in 11 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
maezato
[pid: 2065|app: 0|req: 1/3] 127.0.0.1 () {50 vars in 880 bytes} [Tue Dec 12 13:30:03 2017] POST /login => generated 257 bytes in 36 msecs (HTTP/1.0 302) 5 headers in 191 bytes (1 switches on core 0)
aaa
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
  <link rel="stylesheet" href="http://localhost:8080/static/css/reset.min.css">
  <link rel="stylesheet" href="http://localhost:8080/static/css/main.min.css">
  <link rel="stylesheet" href="http://localhost:8080/static/css/index.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="js/index.js"></script>
  <title>tukutter |  top </title>
</head>
<body>
  <main id="index">
    <header>
      <div class="profile">
        <a href=""><img src="http://localhost:8080/static/img/profile.png" alt=""></a>
        <a href=""><p>maezato</p></a>
      </div>
      <nav>
        <ul>
          <li><a href="top.html">top</a></li>
          <li><a href="search.html">検索</a></li>
          <li><a href="tweet.html">つぶやく</a></li>
          <li><a href="favorite.html">お気に入り</a></li>
          <li><a href="#">ログアウト</a></li>
        </ul>
      </nav>
    </header>





   </div>
  </main>
 </body>
</html>
[pid: 2065|app: 0|req: 2/4] 127.0.0.1 () {44 vars in 770 bytes} [Tue Dec 12 13:30:03 2017] GET /top => generated 1360 bytes in 19 msecs (HTTP/1.0 200) 2 headers in 81 bytes (1 switches on core 1)
[pid: 2064|app: 0|req: 3/5] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:30:03 2017] GET /js/index.js => generated 233 bytes in 53 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
[pid: 2066|app: 0|req: 1/6] 127.0.0.1 () {40 vars in 636 bytes} [Tue Dec 12 13:30:03 2017] GET /js/index.js => generated 233 bytes in 30 msecs (HTTP/1.0 404) 2 headers in 72 bytes (1 switches on core 0)
^CSIGINT/SIGQUIT received...killing workers...
gateway "uWSGI http 1" has been buried (pid: 2068)
worker 1 buried after 1 seconds
worker 2 buried after 1 seconds
worker 3 buried after 1 seconds
worker 4 buried after 1 seconds
goodbye to uWSGI.
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ git add tukutter.py
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ git commit -m "91行目@application.route('/top')を改変中-usernameが表示できてなかった-templateが少しわかってきた"
[master 0b49529] 91行目@application.route('/top')を改変中-usernameが表示できてなかった-templateが少しわかってきた
 1 file changed, 17 insertions(+), 7 deletions(-)
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ git push origin master
Username for 'https://github.com': Maezato
Password for 'https://Maezato@github.com':
Karinon0404
Counting objects: 3, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 711 bytes | 0 bytes/s, done.
Total 3 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/Maezato/tukutter.git
   998f6e7..0b49529  master -> master
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ Karinon0404
Karinon0404: command not found
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$ git push origin master
Username for 'https://github.com': Maezato
Password for 'https://Maezato@github.com':
Everything up-to-date
(tukutterenv) ubuntu@ubuntu-xenial:/var/www/tukutter$
