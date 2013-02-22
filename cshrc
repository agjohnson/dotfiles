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
if ($is_linux) alias ls ls --color=auto -F
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
  bindkey "^[j" history-search-backward
  bindkey "^[k" history-search-forward
  bindkey "^[h" backward-word
  bindkey "^[l" forward-word
  bindkey "\e[1~" beginning-of-line  # Home
  bindkey "\e[7~" beginning-of-line  # Home rxvt
  bindkey "\e[2~" overwrite-mode     # Ins
  bindkey "\e[3~" delete-char        # Delete
  bindkey "\e[4~" end-of-line        # End
  bindkey "\e[8~" end-of-line        # End rxvt

  # Pretty prompt
  set c1 = "%{\033[1;33m%}"
  set c2 = "%{\033[1;30m%}"
  set c0 = "%{\033[0m%}"
  set title = "%{\033]0;%m:%~\007%}"
  
  # Warnings
  # Private (ssh-agent) warning
  ssh-add -l >& /dev/null
  if ($? < 2) then
    set warn_priv = " P "
  endif
  # SSH warning
  if ($?SSH_CONNECTION) then
    switch ("$SSH_CONNECTION")
      case "* 192.168.0.*":
        set warn_ssh = " a "
        breaksw
      case "* 192.168.2.*":
        set warn_ssh = " e "
        breaksw
      case "* 10.27.?.*":
        set warn_ssh = " o "
        breaksw
    endsw
  endif
  set warn = ""
  if ($?warn_priv) then
    set warn = "%{\033[42m%}%{\033[30m%}${warn_priv}${c0} ${warn}"
  endif
  if ($?warn_ssh) then
    set warn = "%{\033[41m%}${warn_ssh}${c0} ${warn}"
  endif
  
  # Chroot
  set chroot = ""
  if ($?SCHROOT_SESSION_ID) then
    set chroot = "%{\033[44m%} %{\247%} ${c0} "
  endif

  switch ($TERM)
    case "xterm*":
    case "screen":
      set prompt = "${title}${chroot}${warn}${c2}%T %m %~${c0} ${c1}%#${c0} "
      breaksw
    default:
      set prompt = "${warn}${chroot}${c2}%T %m %~${c0} ${c1}%#${c0} "
      breaksw
  endsw
endif

# Include local
cd
if (-f ".cshrc.local") then
  source .cshrc.local
endif
