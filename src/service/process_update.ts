import {runTask} from '../lib/Task';
import {Item} from '../lib/ItemInterfaces';
import getClient from '../lib/ElasticSearch';
import {ProcessUpdateParams, MetadataParams, DerivativeParams} from '../lib/Service';

export default async function processUpdate({type, query}: ProcessUpdateParams): Promise<void> {
    const scrollItems = getClient().helpers.scrollDocuments<Item>({index: 'items', q: query});
    for await (const item of scrollItems)
        runTask<MetadataParams | DerivativeParams>(type, {collectionId: item.collection_id});
}
