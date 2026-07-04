# Calculator-2

<p align="center">
  <img src="https://img.shields.io/badge/iOS-SwiftUI-blue">
  <img src="https://img.shields.io/badge/Backend-AWS%20Lambda-orange">
  <img src="https://img.shields.io/badge/AI-OpenAI-black">
  <img src="https://img.shields.io/badge/License-MIT-green">
</p>

<p align="center">
  <img width="300" src="docs/images/screenshot1.png" />
  <img width="300" src="docs/images/screenshot2.png" />
</p>

<p align="center">
  <b>The world's most over-engineered calculator.</b>
</p>

---

Calculator-2 is an iOS calculator that intentionally performs simple arithmetic through cloud infrastructure.

Instead of calculating `2 + 2` directly on your phone, the expression travels across the internet, reaches AWS Lambda, and optionally asks AI for the answer.

Because why not?

---

## Concept

<p align="center">
<b>Tap → Cloud → Return</b>
</p>

A normal calculator computes instantly.

Calculator-2 prefers taking the scenic route.

```
2 + 2

↓

AWS Lambda

↓

(Optional)
GPT-5

↓

4
```

Sometimes the best solution is the least efficient one.

## Why?

Because modern software engineering is fun.

This project was built as a playful demonstration of:

- Serverless computing
- AWS Lambda
- SwiftUI networking
- AI integration
- "Vibe Coding"

## Features

- Beautiful retro calculator UI
- Smooth SwiftUI animations
- Expression history
- Cloud-powered calculations
- AWS Lambda backend
- Optional AI Mode
- Self-hostable backend

## Architecture

| Stack | Purpose |
|--------|---------|
| `SwiftUI` | User Interface |
| `AWS Lambda` | Cloud calculations |
| `API Gateway` | Public endpoint |
| `Python` | Expression evaluator |
| `OpenAI (Optional)` | AI Mode |
| `URLSession` | Networking |

## How it works

```
iPhone

    ↓

API Gateway

    ↓

AWS Lambda

    ↓

Python or GPT

    ↓

Result
```

Even though your iPhone could solve the calculation instantly...

...it politely waits for the cloud.

## AI Mode

Enable AI Mode from the cloud button.

```
☁ AI
```

When enabled, calculations can be processed using GPT instead of the local evaluator.

Yes...

AI can calculate `5 × 8`.

## Project Structure

```
Calculator-2/
│
├── App/
│   └── Calculator-2App.swift
│
├── Views/
│   ├── CalculatorView.swift
│   ├── DisplayView.swift
│   └── CalculatorButton.swift
│
├── ViewModels/
│   └── CalculatorViewModel.swift
│
├── Models/
│   ├── CalculationRequest.swift
│   └── CalculationResponse.swift
│
├── Services/
│   └── LambdaService.swift
│
├── Assets.xcassets/
│
├── backend/
│   ├── lambda_function.py
│   └── requirements.txt
│
└── README.md
```

## Installation

Clone the repository.

```bash
git clone https://github.com/Osman-Kahraman/Calculator-2.git
```

Open the project in Xcode.

Configure your own backend.

Run.

## Backend

Calculator-2 is designed to be self-hosted.

The repository includes a complete AWS Lambda backend.

You own:

- AWS Lambda
- API Gateway
- OpenAI API Key (optional)

No shared backend is required.

## Deploy Your Backend

Inside the `backend/` folder you'll find:

- Lambda source
- Requirements
- Deployment guide
- Configuration template

Deploy it to your own AWS account and paste your API Gateway URL into the app.

## Requirements

- macOS
- Xcode 16+
- iOS 18+
- AWS Account
- Python 3.12

Optional:

- OpenAI API Key

## Philosophy

This app intentionally solves a tiny problem using a hilariously oversized architecture.

Sometimes software doesn't need to be practical.

Sometimes it just needs to vibe.

## License

MIT License

<p align="center">
<b>Built for developers who think 2 + 2 deserves a serverless architecture.</b>
</p>