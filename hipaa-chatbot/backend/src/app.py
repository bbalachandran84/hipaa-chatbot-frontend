import json
import boto3

# Initialize AWS Comprehend Medical client
comprehend_medical = boto3.client('comprehendmedical', region_name='us-east-1')

def lambda_handler(event, context):
    # Parse user input from API Gateway
    body = json.loads(event['body'])
    user_input = body.get('input', '')

    # Step 1: Detect PHI in the user input
    phi_entities = comprehend_medical.detect_phi(Text=user_input)['Entities']

    # Step 2: Anonymize PHI
    anonymized_text = user_input
    for entity in phi_entities:
        anonymized_text = anonymized_text.replace(entity['Text'], '[REDACTED]')

    # Step 3: Generate a mock chatbot response
    chatbot_response = f"Your message has been processed. Anonymized text: {anonymized_text}"

    # Return response to API Gateway
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json'},
        'body': json.dumps({'reply': chatbot_response})
    }
