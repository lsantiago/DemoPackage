POETRY=poetry
POETRY_RUN=$(POETRY) run

SOURCE_FILES=$(shell find . -path "./sumadora/*.py")
SOURCE_FOLDER=sumadora

style:
	$(POETRY_RUN) isort $(SOURCE_FOLDER)
	$(POETRY_RUN) black $(SOURCE_FILES)

lint:
	$(POETRY_RUN) isort $(SOURCE_FOLDER) --check-only
	$(POETRY_RUN) black $(SOURCE_FILES)  --check