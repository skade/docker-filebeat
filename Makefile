VERSION=1.0.0-rc2

build:
		docker build -t olinicola/filebeat:$(VERSION) $(VERSION)/