# Contributing to Calculator-2

Thank you for your interest in contributing to Calculator-2!

Whether you'd like to fix a bug, improve the UI, optimize the backend, or suggest a new feature, contributions are always welcome.

If you have an idea, feel free to open an issue or submit a pull request.

---

# Getting Started

1. Fork the repository.

2. Clone your fork.

```bash
git clone https://github.com/Osman-Kahraman/Calculator-2.git
cd Calculator-2
```

3. Create a new branch.

```bash
git checkout -b feature/your-feature-name
```

4. Make your changes.

5. Commit your changes.

```bash
git commit -m "Add: short description"
```

6. Push your branch.

```bash
git push origin feature/your-feature-name
```

7. Open a Pull Request.

---

# Development Setup

## iOS Application

Requirements:

- macOS
- Xcode 16+
- iOS 18+
- Swift 6+

Open the project in Xcode and run it on a simulator or physical device.

---

## Backend

The repository includes a self-hostable AWS Lambda backend.

Inside the `backend/` directory you'll find:

- `lambda_function.py`
- `requirements.txt`
- deployment instructions

To deploy your own backend:

1. Create an AWS Lambda function.
2. Install the required Python dependencies.
3. Upload the deployment package.
4. Create an API Gateway endpoint.
5. Copy your Invoke URL into the iOS application.

The backend is designed to be deployed to your own AWS account.

---

# AI Mode

AI Mode is optional.

If you'd like to enable it:

1. Create an OpenAI API key.
2. Add it as an AWS Lambda Environment Variable.

Example:

```text
OPENAI_API_KEY=your_api_key
```

Do **not** commit API keys or secrets to the repository.

---

# Contribution Guidelines

Please keep pull requests focused and easy to review.

We recommend:

- Keep PRs small.
- Follow the existing SwiftUI architecture.
- Follow the existing Python backend structure.
- Link related issues whenever possible.
- Test both the iOS app and backend before submitting.

Please avoid committing:

- AWS credentials
- OpenAI API keys
- `.env`
- Generated deployment packages
- `GoogleService-Info.plist`
- Personal configuration files

---

# Example Commit Messages

```text
Add: AI loading animation

Fix: Lambda response parsing

Refactor: CalculatorViewModel

Improve: Button animations

Docs: Update backend setup guide
```

---

# Code Style

### Swift

- Follow Apple's Swift API Design Guidelines.
- Prefer SwiftUI over UIKit.
- Keep Views lightweight.
- Business logic belongs inside ViewModels.

### Python

- Keep Lambda functions stateless.
- Avoid hardcoded secrets.
- Prefer readable code over clever code.

---

# Reporting Bugs

If you find a bug:

1. Search existing Issues first.
2. Include steps to reproduce.
3. Include screenshots when applicable.
4. Include console logs if relevant.

---

# Feature Requests

Feature requests are always welcome.

If possible, explain:

- the problem you're solving,
- your proposed solution,
- and why it improves the project.

---

# Code of Conduct

Please follow the project's `CODE_OF_CONDUCT.md`.

Let's build something fun together.

---

Thank you for contributing to Calculator-2!