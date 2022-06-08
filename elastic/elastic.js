var elasticsearch = require('elasticsearch');

const elasticClient = elasticsearch.Client({
    host: 'http://elasticsearch:9200'
});

var indexName = 'business_events';

function initIndex() {
    try {
        return elasticClient.indices.create({
            index: indexName
        });
    } catch (error) {
        console.log('Error creating elasticsearch index')
    }
}
exports.initIndex = initIndex;

function addDocument(message) {
    console.log('Adding document to elastic');

    return elasticClient.index({
        index: indexName,
        type: "document",
        body: {
            event_name: message.name ?? null,
            properties: message.properties ?? null,
            created_at: message.created_at ?? null,
        }
    });
}
exports.addDocument = addDocument;
