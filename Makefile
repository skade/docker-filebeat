VERSION=5.0.0

build:
		docker build -t olinicola/filebeat:$(VERSION) $(VERSION)/
