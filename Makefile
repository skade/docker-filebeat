VERSION=1.0.1

build:
		docker build -t olinicola/filebeat:$(VERSION) $(VERSION)/