
import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    instance_ids = ['i-xxxxxxxxxxxxxxx']
    ec2.start_instances(InstanceIds=instance_ids)
