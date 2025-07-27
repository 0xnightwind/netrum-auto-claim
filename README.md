# Netrum Claim Automation Script

A simple bash script that automatically runs the `netrum-claim` command at regular intervals.

## Overview

This script automates the process of running `netrum-claim` by executing it repeatedly with a user-defined interval between runs. It's designed to handle the claiming process automatically without manual intervention.

## Features

- **Configurable intervals**: Set custom number of days between each claim
- **Input validation**: Ensures only positive integers are accepted
- **Automatic confirmation**: Automatically responds "yes" to netrum-claim prompts
- **Status logging**: Shows timestamps and status messages for each run
- **Continuous operation**: Runs indefinitely until manually stopped

## Prerequisites

- Bash shell environment
- `netrum-claim` command must be installed and accessible in your PATH
- `screen` utility installed (for background execution)
- Sufficient permissions to execute the script

## Usage

1. Install screen (if not already installed):
   ```bash
   sudo apt update && sudo apt install screen -y
   ```

2. Create a new screen session:
   ```bash
   screen -S netrum-claim
   ```

3. Download and run the script directly:
   ```bash
   wget -qO- https://raw.githubusercontent.com/0xnightwind/netrum-auto-claim/refs/heads/main/netrum_auto_claim.sh | bash
   ```

4. Enter the number of days between each claim when prompted (recommended: 7 days or less):
   ```
   Enter number of days between each claim: 7
   ```

5. Detach from the screen session (script keeps running in background):
   ```
   Ctrl+A, then D
   ```

### Managing the Screen Session

- **Reattach to the session:**
  ```bash
  screen -r netrum-claim
  ```

- **List all screen sessions:**
  ```bash
  screen -ls
  ```

- **Kill the session remotely:**
  ```bash
  screen -S netrum-claim -X quit
  ```

## Example Output

```
Enter number of days between each claim: 3
⏳ Will run 'netrum-claim' every 3 day(s) (259200 seconds).

📅 Running netrum-claim at Mon Jul 27 10:30:45 UTC 2025
[netrum-claim output here]
✅ Claim done. Sleeping for 3 day(s)...

📅 Running netrum-claim at Thu Jul 30 10:30:45 UTC 2025
[netrum-claim output here]
✅ Claim done. Sleeping for 3 day(s)...
```

## Notes

- The script assumes `netrum-claim` accepts "y" as confirmation input
- Make sure you have the necessary permissions and setup for `netrum-claim` to work properly
- **Recommended**: Use a screen session for long-term automation to prevent interruption
- **Important**: Keep the claim interval at 7 days or less to avoid missing claim windows
- The script will continue running indefinitely until manually stopped
- Screen sessions persist even after SSH disconnection, making them ideal for server deployments

