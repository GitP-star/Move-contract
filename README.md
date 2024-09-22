# Send Message Module

## Overview

The `send_message` module provides a simple way to create and manage messages associated with user accounts on the Aptos blockchain. Each account can have one associated message that can be created or updated.

## Features

- Create a new message or update an existing one for the account that calls the function.
- Each message is stored in a resource struct associated with the account's address.

## Module Structure

### Imports

- `std::string::{String, utf8}`: Provides string handling capabilities.
- `std::signer`: Allows for operations related to account signing.

### Structs

- `Message`: A struct that represents a message, containing a single field:
  - `m`: A `String` that holds the message content.

### Functions

#### 1. `create_message`

- **Signature**: 
  ```move
  public entry fun create_message(account: &signer, msg: String) acquires Message
  ```
- **Parameters**:
  - `account`: A reference to the account signer.
  - `msg`: The message string to be stored.
- **Functionality**:
  - Checks if a `Message` resource already exists for the account.
  - If it exists, updates the message.
  - If it does not exist, creates a new `Message` resource and stores it.

## Usage

### Prerequisites

- Ensure you have a working Aptos environment set up.
- Familiarity with Move programming language and Aptos blockchain concepts.

### Example

To create or update a message, you would call the `create_message` function from a transaction script. Here’s a simple example of how you might use it:

```move
script {
    use send_message::Message;

    public fun main(account: &signer, msg: String) {
        Message::create_message(account, msg);
    }
}
```

### Deployment

To deploy the module to the Aptos blockchain, follow these steps:

1. Compile the Move module.
2. Use the Aptos CLI or your preferred tool to deploy the module to your Aptos account.

## Limitations

- Only one message per account is supported. If a new message is created, it replaces the existing message.
- Ensure proper error handling in production implementations.
