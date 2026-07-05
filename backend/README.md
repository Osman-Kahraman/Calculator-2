# Calculator-2 Backend

This directory contains the backend used by **Calculator-2**.

The backend is designed to be **self-hosted**, meaning you deploy it to **your own AWS account**.

No shared backend is required.

# Architecture

```
iOS App

    ↓

API Gateway

    ↓

AWS Lambda

    ↓

Python

    ↓

OpenAI API
```

# Requirements

Before deploying the backend, make sure you have:

- AWS Account
- AWS Lambda
- API Gateway
- Python 3.12
- Docker Desktop
- Terminal
- OpenAI API Key (required only for AI Mode)


# Backend Structure

```
backend/

├── lambda_function.py
├── requirements.txt
└── README.md
```

---

# Deploying the Backend

## 1. Create a Lambda Function

Create a new AWS Lambda function.

Recommended settings:

| Setting | Value |
|---------|-------|
| Runtime | Python 3.12 |
| Architecture | x86_64 |
| Timeout | 10 seconds |
| Memory | 128 MB |

---

## 2. Install Python Dependencies

Because some Python packages contain native binaries, they must be installed inside a Linux container.

From the `backend` directory:

```bash
mkdir clean_build
cp lambda_function.py requirements.txt clean_build/
cd clean_build
```

Install dependencies:

```bash
docker run --rm \
  --platform linux/amd64 \
  -v "$PWD":/app \
  -w /app \
  python:3.12 \
  sh -c "pip install --no-cache-dir -r requirements.txt -t ."
```

---

## 3. Create the Deployment Package

```bash
zip -r ../lambda.zip .
```

The ZIP should contain:

```
lambda_function.py
openai/
httpx/
pydantic/
pydantic_core/
...
```

**Do not zip the folder itself.**

The files must be located at the root of the ZIP archive.

---

## 4. Upload to Lambda

Open AWS Lambda.

Go to:

```
Code

    ↓

Upload from

    ↓

.zip file
```

Upload:

```
lambda.zip
```

Click **Deploy**.

---

# API Gateway

Create an HTTP API.

Example endpoint:

```
POST

/calculate
```

Deploy the API and copy the Invoke URL.

Example:

```
https://xxxxxxxx.execute-api.us-east-2.amazonaws.com/dev/calculate
```

---

# iOS Configuration

Open:

```
LambdaService.swift
```

Replace:

```swift
static let invokeURL = "YOUR_API_GATEWAY_URL"
```

with your own endpoint.

---

# AI Mode

AI Mode requires an OpenAI API key.

Create an Environment Variable inside AWS Lambda.

Key:

```
OPENAI_API_KEY
```

Value:

```
sk-...
```

Never hardcode API keys.

Never commit secrets to GitHub.

---

# Environment Variables

Example:

| Key | Value |
|------|-------|
| OPENAI_API_KEY | sk-... |
| OPENAI_MODEL | gpt-5-mini |

---

# Local Testing

Example request:

```json
{
    "expression": "25 * 8",
    "aiMode": false
}
```

Expected response:

```json
{
    "result": 200
}
```

---

# Troubleshooting

## No module named 'pydantic_core._pydantic_core'

This usually means the deployment package was built for the wrong architecture.

Rebuild the package using Docker:

```bash
docker run --rm \
  --platform linux/amd64 \
  -v "$PWD":/app \
  -w /app \
  python:3.12 \
  sh -c "pip install --no-cache-dir -r requirements.txt -t ."
```

---

## Internal Server Error

Open CloudWatch Logs.

Look for the latest invocation:

```
Monitor

    ↓

CloudWatch Logs
```

The stack trace will usually explain the problem.

---

## Invalid API Gateway Response

Verify:

- Lambda returns valid JSON.
- API Gateway integration is configured correctly.
- The Invoke URL matches your deployment.

---

# Security

The backend is intended to run in **your own AWS account**.

Recommended:

- Keep OpenAI API keys inside Lambda Environment Variables.
- Never expose API keys inside the iOS application.
- Enable API Gateway throttling.
- Consider using API Keys or an authorizer for production deployments.

---

# License

This backend is released under the same license as the main project.

See the repository LICENSE file for details.