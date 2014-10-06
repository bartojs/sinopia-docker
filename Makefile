build:
	docker build -t bartojs/sinopia:0.12.0 .

run:
	echo mkdir -p /var/data/sinopia && chmod -R 777 /var/data/sinopia
	docker run -d -p 4873:4873 -v /var/data/sinpoia:/data bartojs/sinopia
