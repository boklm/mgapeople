VERSION=0.4

BINFILES=mkpeople
CFGFILES=mgapeople.conf
TMPLFILES=tmpl/*.html tmpl/*.txt
STATICFILES=static/*

sysconfdir=/etc
bindir=/usr/bin
sharedir=/usr/share
tmpldir=$(sharedir)/mgapeople/tmpl
staticdir=$(sharedir)/mgapeople/static

install:
	install -d $(DESTDIR)$(tmpldir) $(DESTDIR)$(bindir) \
	    	   $(DESTDIR)$(sysconfdir) $(DESTDIR)$(staticdir)
	install -m 755 $(BINFILES) $(DESTDIR)$(bindir)
	install -m 644 $(CFGFILES) $(DESTDIR)$(sysconfdir)
	install -m 644 $(TMPLFILES) $(DESTDIR)$(tmpldir)
	install -m 644 $(STATICFILES) $(DESTDIR)$(staticdir)

tar:
	git archive --format=tar --prefix mgapeople-$(VERSION)/ HEAD | xz > mgapeople-$(VERSION).tar.xz
