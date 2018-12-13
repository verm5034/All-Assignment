import base64
import boto3
import os 
import json

def lambda_handler(event, context):
    item = None
    dynamodb = boto3.resource('dynamodb','us-east-1')
    DatapipeTable = os.environ['TABLE_NAME']
    table = dynamodb.Table(DatapipeTable)
    payload = [base64.b64decode(record["kinesis"]["data"]) for record in event['Records']]
    data = [json.loads(act_record) for act_record in payload]
    with table.batch_writer() as batch_writer:
       for item in data:
         batch_writer.put_item(Item=item)

    print(json.dumps(item))
    print('Number of records: {}'.format(str(len(data))))
