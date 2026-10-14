build:
	sudo docker compose build

rails-db:
	sudo docker compose run web rails db:create db:migrate db:seed

up:
	sudo docker compose up -d

down:
	sudo docker compose down
