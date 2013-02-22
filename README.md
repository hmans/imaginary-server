# Imaginary

Image hosting and transformation server with a RESTful management API.
_Work in progress_.

## Setting up your own Imaginary server

Imaginary is a Rails application meant to be deployed to your own server(s) or a Heroku instance. It is recommended that you **create a fork** and use that for deploying and making any necessary changes.

Deploying Imaginary will not be covered here, as it is outside of the scope of this documentation. You can deploy Imaginary like any other Rails application.

## Configuration

Imaginary expects a couple of environment variables set in order to function.

| Environment Variable     | Purpose |
| ------------------------ | ------- |
| `IMAGINARY_API_USERNAME` | The API username |
| `IMAGINARY_API_PASSWORD` | The API password |
| `IMAGINARY_SECRET_TOKEN` | The Rails secure cookie secret token. |
| `S3_ACCESS_KEY_ID` | Your S3 Access Key |
| `S3_SECRET_ACCESS_KEY` | Your S3 Secret Access Key |
| `S3_BUCKET` | S3 bucket to use |
| `S3_REGION` | S3 region to use (defaults to `us-east-1`) |

Yay!
