mongodump --host localhost:3001

get username/pass with: 
meteor mongo --url spongie.meteor.com

mongodb://client-465c3f05:195931d8-d818-248a-36da-134473c7107d@production-db-c1.meteor.io:27017/spongie_meteor_com

mongo_username: client-349f2648
mongo_password: 195931d8-d818-248a-36da-134473c7107d
host: production-db-c1.meteor.io:27017
database: spongie_meteor_com

mongorestore -u client-465c3f05 -p 195931d8-d818-248a-36da-134473c7107d -h production-db-c1.meteor.io:27017 -db spongie_meteor_com ~/sites/spongie/dump/meteor

