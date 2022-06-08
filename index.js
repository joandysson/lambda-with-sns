var elasticsearch = require('./elastic/elastic');

elasticsearch.initIndex();

exports.handler = function(event) {
    var message = event.Records[0].Sns.Message;

    elasticsearch.addDocument(JSON.parse(message));

    return 'Success';
};
