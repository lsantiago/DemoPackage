POETRY=poetry
POETRY_RUN=$(POETRY) run

SOURCE_FILES=$(shell find . -path "./sumadora/*.py")
SOURCE_FOLDER=sumadora

BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

check_on_main:
ifeq ($(BRANCH),main)
	echo "You are good to go!"
else
	$(error You are not in the main branch)
endif

patch: check_on_main
	$(POETRY_RUN) bumpversion patch --verbose
	git push --follow-tags

minor: check_on_main
	$(POETRY_RUN) bumpversion minor --verbose
	git push --follow-tags

major: check_on_main
	$(POETRY_RUN) bumpversion major --verbose
	git push --follow-tags

style:
	$(POETRY_RUN) isort $(SOURCE_FOLDER)
	$(POETRY_RUN) black $(SOURCE_FILES)

lint:
	$(POETRY_RUN) isort $(SOURCE_FOLDER) --check-only
	$(POETRY_RUN) black $(SOURCE_FILES)  --check

test:
	PYTHONPATH=. $(POETRY_RUN) pytest -vv test/

test_unit:
	$(POETRY_RUN) pytest test

.PHONY: test