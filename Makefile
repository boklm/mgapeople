VERSION=0.3

BINFILES=mkpeople
CFGFILES=mgapeople.conf
TMPLFILES=tmpl/*.html tmpl/*.txt

sysconfdir=/etc
bindir=/usr/bin
sharedir=/usr/share
tmpldir=$(sharedir)/mgapeople/tmpl

install:
	install -d $(DESTDIR)$(tmpldir) $(DESTDIR)$(bindir) $(DESTDIR)$(sysconfdir)
	install -m 755 $(BINFILES) $(DESTDIR)$(bindir)
	install -m 644 $(CFGFILES) $(DESTDIR)$(sysconfdir)
	install -m 644 $(TMPLFILES) $(DESTDIR)$(tmpldir)

tar:
	git archive --format=tar --prefix mgapeople-$(VERSION)/ HEAD | xz > mgapeople-$(VERSION).tar.xz
