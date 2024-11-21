# Zerops x Elixir
This is a bare-bones example of an Elixir application running on [Zerops](https://zerops.io) — as few libraries as possible, just a simple endpoint with connnect, read and write to a Zerops PostgreSQL database.

![elixir](https://github.com/zeropsio/recipe-shared-assets/blob/main/covers/svg/cover-elixir.svg)

<br />

## Deploy on Zerops
You can either click the deploy button to deploy directly on Zerops, or manually copy the [import yaml](zerops.yml) to the import dialog in the Zerops app.

[![Deploy on Zerops](https://github.com/zeropsio/recipe-shared-assets/blob/main/deploy-button/green/deploy-button.svg)](https://app.zerops.io/recipe/elixir)

<br/>

## Recipe features
- **Plug** + **Cowboy** HTTP server running on a load balanced **Zerops Elixir** service
- Zerops **PostgreSQL** service as database
- Built with `plug_cowboy` for HTTP server functionality
- **Ecto** for database interactions
- Health check endpoint at `/status`
- Utilization of Zerops' built-in **environment variables** system
- JSON response handling with **Jason**

<br/>

## Project Structure
The application consists of:
- HTTP Router handling incoming requests
- Database integration using Ecto
- Simple entry creation and counting system
- JSON response formatting

Key endpoints:
- `GET /` - Creates a new entry and returns count
- `GET /status` - Health check endpoint

<br/>

## Production vs. Development
Base of the recipe is ready for production. For production deployment, consider:

- Using highly available version of the PostgreSQL database (change `mode` from `NON_HA` to `HA` in recipe YAML)
- Using at least two containers for the Elixir service (add `minContainers: 2` in recipe YAML)

Additional production considerations:
- Use Zerops object storage for file storage
- Implement Redis (Valkey) for caching and session management
- Add comprehensive logging and monitoring
- Implement proper error handling and reporting

<br/>
<br/>

Need help setting your project up? Join [Zerops Discord community](https://discord.com/invite/WDvCZ54).

