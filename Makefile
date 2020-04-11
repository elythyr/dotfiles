.PHONY: deploy update-repository update-submodules update update-pip update-pynvim update-pman

deploy: update
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
