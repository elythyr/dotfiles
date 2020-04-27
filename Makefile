.PHONY: deploy update-repository update-submodules update update-pip update-pynvim update-pman
.PHONY: terminfo fonts

deploy: update terminfo fonts
	./bin/deploy.sh

update: update-repository update-submodules update-pip update-pynvim update-pman

update-repository:
	git pull --rebase --autostash

update-submodules:
	git submodule update --recursive

update-submodules-remote:
	git submodule update --recursive --remote

update-pip:
	python2 -m pip install --user --upgrade pip
	python3 -m pip install --user --upgrade pip

update-pynvim:
	python2 -m pip install --user --upgrade pynvim
	python3 -m pip install --user --upgrade pynvim

update-pman:
	sudo pear upgrade doc.php.net/pman

# To force it delete the file terminfo.src.gz
terminfo: terminfo.src.gz

terminfo.src.gz:
	@curl -LO http://invisible-island.net/datafiles/current/terminfo.src.gz \
	&& gunzip --keep terminfo.src.gz \
	&& sudo tic terminfo.src \
	&& \rm terminfo.src

fonts:
ifeq ($(wildcard ~/.local/share/fonts/Ubuntu\ Mono*),)
	@mkdir -p $$HOME/.local/share/fonts \
	&& curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
		| grep "browser_download_url.*UbuntuMono.*\.zip" \
		| cut -d : -f 2,3 \
		| tr -d \" \
		| wget -O $$HOME/.local/share/fonts/ubuntu-mono.zip -i - \
	&& ( \
	cd $$HOME/.local/share/fonts \
		&& unzip -uj ubuntu-mono.zip \
		&& \rm -f ubuntu-mono.zip \
	) \
	&& fc-cache -fv
endif

