# kbot

A simple telegram bolt built with Go.

## Features

- Responds to text messages by echoeing them back.

## Setup

1. Clone the repo:
    
    ```bash
    git clone https://github.com/vcorneroff/kbot/tree/development
    cd kbot

2. Copy your telegram bot API token.
3. Create variable with token.
    ```bash
    export TELE_TOKEN=YOUR_VARIABLE_HERE
4. Install dependencies
    ```bash
    go mod tidy
5. Run the bot
    ```bash
    go run main.go

## Usage
Start the conversation with bot and write smth to him.