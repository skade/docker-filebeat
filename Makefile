VERSION=1.2.3

build:
		docker build -t olinicola/filebeat:$(VERSION) $(VERSION)/