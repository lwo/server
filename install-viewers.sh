#!/bin/sh

# Install Universal Viewer
git clone https://github.com/UniversalViewer/universalviewer.git /opt/build/universalviewer --recursive
cd /opt/build/universalviewer
npm install --build-from-source
grunt build --dist
mv /opt/build/universalviewer/examples/uv /opt/universalviewer

# Install IIIF archival viewer
git clone https://github.com/archival-IIIF/viewer.git /opt/build/iiif-viewer --recursive
cd /opt/build/iiif-viewer
npm install --build-from-source
npm run build
mv /opt/build/iiif-viewer/build /opt/iiif-viewer
