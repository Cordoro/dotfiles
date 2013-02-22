# Josef Spjut, February 2013
all: ~/.profile ~/.xemacs/custom.el

~/.profile: .profile
	ln -s .profile ~/.profile

~/.emacs: .emacs
	ln -s .emacs ~/.emacs

# create .xemacs if it doesn't exist
~/.xemacs: 
	if test -d ~/.xemacs; then echo -n ''; else mkdir ~/.xemacs; fi

~/.xemacs/custom.el: ~/.xemacs
	ln -s custom.el ~/.xemacs/
