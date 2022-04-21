<img src="https://raw.githubusercontent.com/zeptofs/public_assets/master/images/zepto_logo_black.png" width="300" alt="Zepto Logo" title="Zepto Logo">

# Zepto API Documentation

Welcome to the NZ Zepto API documentation source.

## How does it work?

* The Zepto API is documented using the [OpenAPI 3.0.0 specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md).
* The new [Swagger editor](http://editor.swagger.io/) was used to get the boilerplate done.
* The API spec is then converted to [Slate](https://github.com/lord/slate) friendly markdown with [Widdershins](https://github.com/mermade/widdershins).

## Get started

### Using Docker

1. Clone the repo
1. Make sure you have [Docker installed](https://docs.docker.com/get-docker/)
1. Run `$ docker-compose build`
1. Once the previous step is completed, run `$ docker-compose up`
1. Open http://localhost:4567 in your browser to preview the documentation

### Manually

1. Clone the repo
2. `$ bundle install`
3. `$ yarn install`
4. `$ bundle exec foreman start`
5. Browse to http://localhost:4567 to preview the documentation.

### Making changes

1. Edit the `source/openapi3/split.yaml` or any themes/templates. The preview should update a few seconds after
you save your changes.
1. Changes to the YAML file will be built and output to the `source/`
   directory, so don't edit the build output in there.
1. Update the Changelog section of `source/openapi3/split.yaml`.
1. Commit both the YAML and the build output changes.

Note: Currently only changes to split.yaml will trigger the automatic update see `Guardfile`.

## Publishing changes

**Warning:** this script will push changes directly to Github pages. They will be publicly visible. You should only run this after your changes have been reviewed and merged.

`$ ./deploy.sh`

## Notes

* The Slate template/theme is mildly edited to suit our style.
* The same goes for Widdershin's conversion templates.
