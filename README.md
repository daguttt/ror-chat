# RoRChat

AI Chat-like app using OpenAI API and Ruby on Rails

## Repository

[RoRChat Github Repository](https://github.com/daguttt/ror-chat)

## Developing

### Getting Started
#### Prequisites

- Node.js
  - **pnpm**: Fast node package manager
    ```bash
    npm i -g pnpm # To install it globally on your machine
    ``` 
- Ruby (Check out the project version in [`.ruby-version`](.ruby-version))

#### 1. Environment variables

Create a `.env` file and populate it with the content of `.env.erb` file.
Environment variables include:

  - Database Credentials.

> [!NOTE]
> Keep the value of the `DATABASE_NAME` as is. It's not used in development but required to run the project

  - OpenAI API Key

#### 2. Install dependencies

Install gems

```bash
bundle i
```

Install [FlyonUI](https://flyonui.com/docs/getting-started/quick-start/) Tailwind plugin

```bash
pnpm i
```
