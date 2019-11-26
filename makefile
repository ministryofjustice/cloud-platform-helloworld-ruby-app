IMAGE := ministryofjustice/cloud-platform-helloworld-ruby
TAG := 1.0

build:
	docker build -t $(IMAGE) .

push:
	docker tag $(IMAGE) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)
