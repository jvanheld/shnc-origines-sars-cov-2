usage:
	@echo "Targets"
	@echo "	repo	display URL of github repository"
	@echo "	web	display URL of git pages"

REPO=https://github.com/jvanheld/shnc-origines-sars-cov-2
repo:
	@echo "Github repository"
	@echo "	${REPO}"

WEB=https://jvanheld.github.io/shnc-origines-sars-cov-2/
web:
	@echo "Git pages"
	@echo "	${WEB}"
