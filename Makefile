build:
	docker build -t antoniszczepanik/ide:0.1 .
run:
	docker run -it --rm antoniszczepanik/ide:0.1
push:
	docker push antoniszczepanik/ide:0.1
