
import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    instance_ids = ['i-xxxxxxxxxxxxxxx']
    ec2.stop_instances(InstanceIds=instance_ids)
