VERSION=1.1.2

build:
		docker build -t olinicola/filebeat:$(VERSION) $(VERSION)/