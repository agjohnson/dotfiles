# .cshrc

# Get system OS
@ is_linux=0
@ is_netbsd=0
@ is_freebsd=0
set os = `uname -s`
if ($os == "Linux") @ is_linux=1
if ($os == "NetBSD") @ is_netbsd=1
if ($os == "FreeBSD") @ is_freebsd=1

# Aliases
alias h history 25
alias j jobs -l
if ($is_linux) alias ls ls --color=auto  
if ($is_netbsd) alias ls /usr/pkg/bin/colorls -G  
if ($is_freebsd) alias ls ls -G  
alias la ls -a
alias lf ls -FA
alias ll ls -lA
alias su su -m

# Environmental Variables
setenv EDITOR vim
setenv VISUAL ${EDITOR}
setenv EXINIT 'set autoindent'
setenv PAGER less
setenv EMAIL "anthony@dcoding.com"
if ($is_netbsd) setenv PKG_PATH "ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/amd64/5.0.1_2010Q1/All"

# Path
set path = ( /usr/pkg/{,s}bin ~/bin /bin /sbin /usr/{bin,sbin,X11R7/bin,X11R6/bin,pkg/{,s}bin,games} \
            /usr/local/{,s}bin)

# tcsh settings
if ($?prompt) then
  # An interactive shell -- set some stuff up
  set filec
  set history = 1000
  set mail = (/var/mail/$USER)
  set mch = `hostname -s`
  set autologout = 60
  set autolist
  bindkey "^W" backward-delete-word
  bindkey -k up history-search-backward
  bindkey -k down history-search-forward
  
  # Pretty prompt
  set c1 = "%{\033[1;33m%}"
  set c2 = "%{\033[1;30m%}"
  set c0 = "%{\033[0m%}"
  set title = "%{\033]0;%m:%~\007%}"
  switch ($TERM)
    case "xterm*":
      set prompt = "${title}${c2}%T %m %~${c0} ${c1}%#${c0} "
      breaksw
    default:
      set prompt = "${c2}%T %m %~${c0} ${c1}%#${c0} "
      breaksw
  endsw
endif

# Include local
cd
if (-f ".cshrc.local") then
  source .cshrc.local
endif
