# Treasure Hunt Game API

## Overview

This project is a Ruby on Rails-based Treasure Hunt game designed around a RESTful API. Users can submit guesses for the treasure's location through the API, and the system calculates the distance to the actual treasure location. If a guess is within 1000 meters of the treasure, the user is marked as a winner and receives an email confirmation.

## Features

- **Guess Submission**: Users can submit their guesses with their email and guessed coordinates.
- **Winner Determination**: The system calculates if the guess is within 1000 meters of the treasure and marks the guess as a winning attempt.
- **Email Confirmation**: Winners receive an email confirmation.
- **Winner List**: An API endpoint provides a list of winners, optionally supporting sorting and pagination.

## Technology Stack

- **Framework**: Ruby on Rails
- **Database**: <your-database> (e.g., PostgreSQL, MySQL)
- **Additional Libraries**: Geocoder for distance calculation

## Getting Started

### Prerequisites

- Ruby 3
- Rails 7
- Postgres
- A mail sending service configuration for Action Mailer

### Setup

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd treasure-hunt
   ```
3. Install dependencies:
   ```
   bundle install
   ```
4. Create and migrate your database:
   ```
   bin/rails db:create db:migrate
   ```

### Running the Application

Start the Rails server:
```
bin/rails server
```

The API will be accessible at `http://localhost:3000`.

### Using the API

- **Submit a Guess**:
  POST `/guesses` with JSON payload containing `email`, `latitude`, and `longitude`.

- **List Winners**:
  GET `/winners` to retrieve a list of winners. Supports query parameters for sorting and pagination.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your proposed changes or improvements.

## License

This project is open source and available under the [MIT License](LICENSE.md).
