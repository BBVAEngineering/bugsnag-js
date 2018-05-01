#!/bin/bash
set -e
cd "$(dirname "$0")"

npx browserify -o dist/a.js src/a.js
npx browserify -o dist/b.js src/b.js
