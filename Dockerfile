FROM redmine:3.4

RUN set -x ; \
	if [ ! -d /usr/share/man/man1 ]; then mkdir -p /usr/share/man/man1 ; fi; \
	apt-get update; \
	# install java
	apt-get install -y default-jdk ; \
	# install graphviz
	apt-get install -y libreoffice libreoffice-l10n-ja ; \
	# install 日本語フォント
	apt-get install -y fonts-ipafont fonts-ipaexfont ; \
	# install ghostscript
	apt-get install -y build-essential imagemagick libmagic-dev ghostscript; \
	rm -rf /var/lib/apt/lists/* ; \
	git clone --depth=1 https://github.com/HugoHasenbein/redmine_preview_office.git /usr/src/redmine/plugins/redmine_preview_office ; \
	git clone --depth=1 https://github.com/HugoHasenbein/redmine_preview_pdf.git /usr/src/redmine/plugins/redmine_preview_pdf ;

