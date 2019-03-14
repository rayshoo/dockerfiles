#!/bin/bash
set -e
set -o pipefail

COMMAND=/opt/sublime_text/sublime_text

su user -p -c "$COMMAND -w"
