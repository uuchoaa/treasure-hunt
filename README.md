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
- **Database**: PostgreSQL
- **Additional Libraries**: Geocoder for distance calculation

## Getting Started

### Prerequisites

- Ruby 3
- Rails 7
- PostgreSQL
- A mail sending service configuration for Action Mailer

### Setup

1. Clone the repository:
   ```
   git clone https://github.com/uuchoaa/treasure-hunt
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

## Treasure Configuration

The location of the treasure is configured within the application using the following settings:

- **Latitude**: The geographic latitude of the treasure.
- **Longitude**: The geographic longitude of the treasure.
- **Radius**: The radius (in meters) around the treasure that defines a winning guess.

**Note**: To maintain the secrecy of the actual treasure location, these values are **not** stored within the code itself. Instead, they are configured through the Rails environment during application startup. Check `config/initializers/treasure_config.rb` for details. You can override the configuration through environment variables. Example:

```
TREASURE_RADIUS=500 TREASURE_LATITUDE=4.777775 TREASURE_LONGITUDE=2.777775 bin/rails server
```


### Using the API

- **Submit a Guess**:
  POST `/guesses` with JSON payload containing `email`, `latitude`, and `longitude`.

- **List Winners**:
  GET `/winners` to retrieve a list of winners. Supports query parameters for sorting and pagination.

### API Documentation

Our Treasure Hunt game API is fully documented with Swagger. To access the documentation, start the Rails server and navigate to `/api-docs` in your web browser:

```
http://localhost:3000/api-docs
```


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your proposed changes or improvements.

## License

This project is open source and available under the [MIT License](LICENSE.md).
