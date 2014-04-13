get username/pass with: meteor mongo --url spongie.meteor.com

mongodb://client-349f2648:df640eb0-b700-28a6-38dd-0bf1de6ba81f@production-db-c1.meteor.io:27017/spongie_meteor_com

mongo_username: client-349f2648
mongo_password: df640eb0-b700-28a6-38dd-0bf1de6ba81f
host: production-db-c1.meteor.io:27017
database: spongie_meteor_com

mongorestore -u client-349f2648 -p df640eb0-b700-28a6-38dd-0bf1de6ba81f -h production-db-c1.meteor.io:27017 -db spongie_meteor_com ~/sites/spongie/dump/meteor

