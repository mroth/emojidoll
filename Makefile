.PHONY: test serve container
TAG := mrothy/emojidoll

test:
	bundle exec rspec

container:
	docker build -t ${TAG} .

serve:
	docker run -it --rm --env-file=.env ${TAG} bundle exec ruby bot.rb
