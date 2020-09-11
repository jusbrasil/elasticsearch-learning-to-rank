VERSION ?= $(shell grep ^version build/generated-resources/plugin-descriptor.properties | cut -d "=" -f 2)

deploy.nexus:
	mvn deploy:deploy-file \
		-DgroupId=br.com.jusbrasil.elasticsearch \
		-DartifactId=ltr \
		-Dversion=$(VERSION) \
		-Dpackaging=jar \
		-Dfile=build/distributions/ltr-$(VERSION).jar \
		-DrepositoryId=jusbrasil \
		-Durl=https://nexus.apps.jusbr.com/repository/maven-releases/