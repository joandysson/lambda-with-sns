build:
	docker compose build

up:
	docker compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

run:
	docker compose up -d && sleep 30 && ./exec.sh

rm-fn-lambda:
	aws --no-cli-pager --endpoint-url=http://0.0.0.0:4566 lambda delete-function --function-name events-lambda

send-event-test:
	aws --no-cli-pager sns publish --endpoint-url=http://0.0.0.0:4566 --topic-arn arn:aws:sns:us-east-1:000000000000:events-topic \
    --message '{"name":"test", "user_id":1, "properties": {"nickname": "test-user1", "job": "Software engineer"}}'

exec:
	./exec.sh
