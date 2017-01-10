all: $(HIPOPS)/venv

$(HIPOPS)/venv: requirements.txt
	virtualenv venv
	. $(HIPOPS)/venv/bin/activate
	pip install wheel
	pip wheel -w $(HIPOPS)/wheelhouse -r requirements.txt
	pip install -r requirements.txt --find-links=$(HIPOPS)/wheelhouse

clean:
	rm -rf $(HIPOPS)/venv
	rm -rf $(HIPOPS)/wheelhouse
