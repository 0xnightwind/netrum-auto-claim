#!/bin/bash

read -p "Enter number of days between each claim: " days

# Validate input: must be a positive integer
if ! [[ "$days" =~ ^[0-9]+$ ]] || [ "$days" -le 0 ]; then
  echo "❌ Invalid number of days. Please enter a positive integer."
  exit 1
fi

# Convert days to seconds
sleep_seconds=$(( days * 86400 ))

echo "⏳ Will run 'netrum-claim' every $days day(s) ($sleep_seconds seconds)."

while true; do
  echo -e "\n📅 Running netrum-claim at $(date)"
  echo y | netrum-claim

  echo "✅ Claim done. Sleeping for $days day(s)..."
  sleep "$sleep_seconds"
done
