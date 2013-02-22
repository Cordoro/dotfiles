# Josef Spjut, February 2013
#Change copy to be cp for copy instead of symbolic links
SHELL=/bin/sh
COPY=ln -fs
#COPY=cp
PWD=$(CURDIR)

all: ~/.profile ~/.emacs ~/.xemacs/custom.el ~/.xemacs/init.el

~/.profile: .profile
	${COPY} $(PWD)/.profile ~/.profile

~/.emacs: .emacs
	${COPY} $(PWD)/.emacs ~/.emacs

# create .xemacs if it doesn't exist
~/.xemacs: 
	@if test -d ~/.xemacs; then echo -n ''; else mkdir ~/.xemacs; echo 'created ~/.xmacs/'fi

~/.xemacs/custom.el: ~/.xemacs
	@${COPY} $(PWD)/custom.el ~/.xemacs/custom.el

~/.xemacs/init.el: ~/.xemacs
	@${COPY} $(PWD)/init.el ~/.xemacs/init.el 2>/dev/null
