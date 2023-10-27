# AWS SAM CLI Debian Package Release

This repository is a demonstration of an automated workflow for releasing the AWS SAM CLI as a Debian package (`.deb`). When you create a Git tag starting with 'v', this workflow will generate a release for that tag and upload the Debian package as a release asset.

## Release Workflow

### Tag Trigger

- The release workflow is triggered when you push a Git tag that starts with 'v'. For example, if you create a tag like 'v1.2.3', the workflow will be triggered.

### Package Creation

- The workflow uses the `create_deb.sh` script to create the Debian package. The script downloads the AWS SAM CLI, packages it, and prepares it for release.

### Release Creation

- Once the package is ready, the workflow automatically creates a GitHub release using the tag name (e.g., 'v1.2.3') as the release version. The release title is set as "Release aws-sam-cli v1.2.3" by default.

### Release Asset Upload

- After the release is created, the Debian package (`aws-sam-cli-1.2.3.deb`) is uploaded as a release asset. Users can then download and install the AWS SAM CLI package.

## Usage

1. To use this release workflow in your own repository, follow these steps:

    - Copy the `.github/workflows/release.yml` file into your repository's `.github/workflows/` directory.

    - Create the `create_deb.sh` script in your repository, or customize it to suit your needs.

    - Modify the workflow and script to match your specific requirements.

2. Ensure that you have the [GitHub CLI (gh)](https://github.com/cli/cli) installed in your GitHub Actions environment for release and asset creation.

3. When you push a Git tag starting with 'v' (e.g., 'v1.2.3'), the release workflow will be triggered, creating a release for the tagged version and uploading the Debian package as an asset.

## Configuration

You can customize the release workflow by adjusting the environment variables in the `.github/workflows/release.yml` file:

- `PACKAGE_NAME`: The name of the Debian package (default: "aws-sam-cli").
- `PACKAGE_VERSION`: The package version (default: "1.0.0").
- `PACKAGE_DESCRIPTION`: The description of the package (default: "AWS SAM CLI").
- `MAINTAINER`: The name and email of the maintainer (default: GitHub user's name and a default GitHub email address).

## License

This project is licensed under the [MIT License](LICENSE).

## Author

Created and written by chatgpt. Copy pasted by me.
