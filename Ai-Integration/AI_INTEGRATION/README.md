# Freshcycle AI Integration Engine

## Overview

This AI integration engine is a lightweight rule‑based AI supply‑chain engine designed to
support a food marketplace application. The engine processes
agricultural produce listings, evaluates freshness risk, performs lot
aggregation, and determines buyer‑to‑lot matching using configurable
business rules.

This implementation is intentionally transparent and production‑ready.
No machine learning model is required.

------------------------------------------------------------------------

## Main Script

Fresh.py

This file executes the full AI processing pipeline including: - Spoilage
risk classification - Aggregation detection - Buyer matching logic -
Shelf‑life threshold mapping - Validation reporting

------------------------------------------------------------------------

## Input

Provide a CSV dataset

Produce.csv

------------------------------------------------------------------------

## How to Run

python Fresh.py --input Produce.csv --outdir outputs

The output folder will be created automatically if it does not exist.

------------------------------------------------------------------------

## Outputs

fresh_AI.csv\
Processed dataset including Spoilage_Band, aggregation_status,
match_status

aggregated_lots.csv\
Lot‑level grouped table with totals and freshness metrics

shelflife_threshold_recommendation.csv\
Crop shelf‑life rules table

order_lot_matches.csv\
Buyer‑to‑lot matching decisions

validation_report.json\
Summary metrics and processing statistics

------------------------------------------------------------------------

## AI Logic

EcoTrack uses a deterministic rule‑based AI engine to ensure:

-   Explainable outputs
-   Low compute requirements
-   Easy mobile/backend deployment
-   Stable, repeatable decisions

------------------------------------------------------------------------

## Dependencies

Python 3+

Required packages:

pandas\
numpy


