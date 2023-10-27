#!/bin/bash

# Prefer environment variables set by the GitHub Action or use sensible defaults
package_name="${PACKAGE_NAME:-aws-sam-cli}"
package_version="${PACKAGE_VERSION:-1.0.0}"  # Replace with your default version
package_description="${PACKAGE_DESCRIPTION:-AWS SAM CLI}"
maintainer="${MAINTAINER:-Your Name <your@email.com>}"

# URL to download the AWS SAM CLI ZIP file
sam_cli_zip_url="${SAM_CLI_ZIP_URL:-https://example.com/aws-sam-cli-linux-x86_64.zip}"

# Set up the package directory structure
package_dir="$package_name-$package_version"
package_deb_dir="$package_dir/DEBIAN"
package_bin_dir="$package_dir/usr/local/bin"
package_sam_dir="$package_dir/usr/local/aws-sam-cli"

# Create the required directories
mkdir -p "$package_deb_dir"
mkdir -p "$package_bin_dir"
mkdir -p "$package_sam_dir"

# Download the AWS SAM CLI ZIP file
wget "$sam_cli_zip_url" -O aws-sam-cli.zip

# Extract the 'dist' directory from the ZIP file
unzip aws-sam-cli.zip -d "$package_sam_dir" dist/*

# Create the symbolic link for the 'sam' executable
ln -s "/usr/local/aws-sam-cli/dist/sam" "$package_bin_dir/sam"

# Create the control file
cat <<EOF > "$package_deb_dir/control"
Package: $package_name
Version: $package_version
Section: utils
Priority: optional
Architecture: all
Maintainer: $maintainer
Description: $package_description
EOF

# Create the .deb package
dpkg-deb --build "$package_dir"

# Clean up temporary files
rm aws-sam-cli.zip
rm -r "$package_dir"

echo "Package created: $package_name-$package_version.deb"
