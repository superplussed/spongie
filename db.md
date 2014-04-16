mongodump --host localhost:3001

get username/pass with: 
meteor mongo --url spongie.meteor.com

mongodb://client-27a458c2:2cee57f9-7e6c-d724-8aab-6c68317aef2a@production-db-c1.meteor.io:27017/spongie_meteor_com

mongo_username: client-27a458c2
mongo_password: 2cee57f9-7e6c-d724-8aab-6c68317aef2a
host: production-db-c1.meteor.io:27017
database: spongie_meteor_com

mongorestore -u client-27a458c2 -p 2cee57f9-7e6c-d724-8aab-6c68317aef2a -h production-db-c1.meteor.io:27017 -db spongie_meteor_com ~/sites/spongie/dump/meteor

