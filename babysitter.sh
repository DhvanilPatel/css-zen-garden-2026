#!/bin/bash
# CSS Zen Garden Babysitter Script
# Runs hourly via cron to check on scope sessions and report progress

cd /Users/chip/Desktop/css-zen-garden

LOG_FILE="babysitter.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] Babysitter check starting" >> "$LOG_FILE"

# Check each session status
for session_id in 0 1 2 3; do
    status=$(scope poll $session_id 2>/dev/null | jq -r '.status' 2>/dev/null || echo "unknown")
    activity=$(scope poll $session_id 2>/dev/null | jq -r '.activity // "none"' 2>/dev/null || echo "none")
    echo "[$TIMESTAMP] Session $session_id: $status - $activity" >> "$LOG_FILE"
done

# Count pieces created
PIECES_COUNT=$(ls -d pieces/*/ 2>/dev/null | wc -l | tr -d ' ')
echo "[$TIMESTAMP] Pieces created so far: $PIECES_COUNT" >> "$LOG_FILE"

# Check if all sessions are done
ALL_DONE=true
for session_id in 0 1 2 3; do
    status=$(scope poll $session_id 2>/dev/null | jq -r '.status' 2>/dev/null || echo "unknown")
    if [ "$status" != "done" ] && [ "$status" != "exited" ]; then
        ALL_DONE=false
    fi
done

if [ "$ALL_DONE" = true ]; then
    echo "[$TIMESTAMP] All batch sessions complete!" >> "$LOG_FILE"
    # Could trigger gallery integration and deployment here
fi

# Git commit any new work
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "Babysitter: auto-commit progress - $PIECES_COUNT pieces"
    git push
    echo "[$TIMESTAMP] Committed and pushed progress" >> "$LOG_FILE"
fi

echo "[$TIMESTAMP] Babysitter check complete" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
