import json
import os

from openai import OpenAI

client = OpenAI(
    api_key=os.environ["OPENAI_API_KEY"]
)

def lambda_handler(event, context):
    if "body" in event:
        body = json.loads(event["body"])
    else:
        body = event

    expression = body.get("expression")
    ai_mode = body.get("aiMode", False)

    if not expression:
        return {
            "statusCode": 400,
            "body": "Missing expression"
        }

    try:
        if ai_mode:
            response = client.responses.create(
                model="gpt-5-mini",
                input=f"""
You are a calculator.

Calculate this expression:

{expression}

Return ONLY the numeric answer.
"""
            )

            result = response.output_text.strip()
        else:
            result = str(eval(expression))

        return {
            "statusCode": 200,
            "body": result
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }