#!/bin/sh

# Start fail2ban only if enabled and available
if [ "$XUI_ENABLE_FAIL2BAN" = "true" ] && command -v fail2ban-client >/dev/null 2>&1; then
  echo "Starting Fail2Ban..."
  fail2ban-client -x start
else
  echo "Fail2Ban not enabled or not found, skipping..."
fi

# Ensure x-ui is executable
chmod +x /app/x-ui

# Start x-ui in foreground (so container doesn't exit)
echo "Starting x-ui..."
exec /app/x-ui start
