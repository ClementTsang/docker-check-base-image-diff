#!/bin/bash

BASE_LAYERS="$(skopeo inspect $1 | jq '.Layers')"
DERIVED_LAYERS="$(skopeo inspect $2 | jq '.Layers')"

jq '.base - .derived | .!=[]' <<< "{\"base\": $BASE_LAYERS, \"derived\": $DERIVED_LAYERS}"