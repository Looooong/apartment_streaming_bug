# Bug: Streaming using `ActionController::Live` with `Apartment`

## Description

Whenever data are streamed by writing to response buffer from `ActionController::Live`, the `Apartment::Tenant.current` is reset back to the default tenant.

## Reproduction

The project is setup with 2 tenants:

+ `development` is the default tenant.
+ `test` is always used when accessing the site (refer to `config/initializers/apartment.rb:102`)

Reproduction steps:

+ Run server in local (example: `rails s`).
+ Go to path `/stream` (example: `http://localhost:3000/stream`).

## Expected result

+ Every lines should be `test`.
+ `Apartment::Tenant.current` keeps its current value.

## Actual behaviour

+ The first few lines show `test` tenant (first 11 lines on my machine).
+ The rest shows the default `development` tenant.
