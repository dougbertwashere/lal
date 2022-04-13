all:
	docker build -t jensenq/lal . 2>&1 | tee LOG
