#!/bin/sh

set -e

BUCKET=ai-techpark-assets

IMAGE_TRAINER_DIR=image_detection_training
SOUND_TRAINER_DIR=sound_detection_training

rm -rf dist
mkdir -p dist/image_trainer
mkdir -p dist/sound_trainer

gsutil -m cp -R gs://${BUCKET}/${IMAGE_TRAINER_DIR}/\* dist/image_trainer/
gsutil -m cp -R gs://${BUCKET}/${SOUND_TRAINER_DIR}/\* dist/sound_trainer/

firebase deploy --only hosting
