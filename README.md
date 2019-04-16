# API Call's
  - /api/heros - hero list
  - /api/heros/{hero_id} - hero data
  - /api/heros/{hero_id}/abilities - hero ability list
  - /api/abilities/ - ability list
  - /api/abilities/{ability_id} - ability data

# Active admin
  - localhost:3000/admin

# Implementation
  - Created services for fetch Overwatch Heros & Abilities
  - Parsing fetched data and save it to Data Base
  - Test cases for the controller api and model validation
  - Docker created
  - Rubocop added for ruby style guide

# Start the application
  - run the command: **docker-compose up --build**

# Test the application
  - run the command: **rspec**