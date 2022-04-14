all:
	docker build -t dougbertwhy/lal . 2>&1 | tee LOG
