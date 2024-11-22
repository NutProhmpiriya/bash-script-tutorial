
#!/bin/bash
# Solution 2: System Monitoring Script

# Configuration
DISK_THRESHOLD=80
LOG_FILE="/var/log/system_monitor.log"
ARCHIVE_DIR="/backup/logs"
NOTIFY_EMAIL="admin@example.com"

monitor_system() {
    # Get current timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Check disk usage
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)
    
    # Log the check
    echo "[$TIMESTAMP] Checking disk usage: $DISK_USAGE%" >> "$LOG_FILE"
    
    if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        # Create archive directory with timestamp
        ARCHIVE_NAME="logs_$TIMESTAMP"
        mkdir -p "$ARCHIVE_DIR/$ARCHIVE_NAME"
        
        # Find and compress logs older than 7 days
        find /var/log -type f -name "*.log" -mtime +7 -exec cp {} "$ARCHIVE_DIR/$ARCHIVE_NAME" \;
        cd "$ARCHIVE_DIR" && tar czf "$ARCHIVE_NAME.tar.gz" "$ARCHIVE_NAME"
        rm -rf "$ARCHIVE_NAME"
        
        # Send notification
        NOTIFICATION="Disk usage is at ${DISK_USAGE}%. Old logs have been archived to $ARCHIVE_DIR/$ARCHIVE_NAME.tar.gz"
        echo "[$TIMESTAMP] $NOTIFICATION" >> "$LOG_FILE"
        echo "$NOTIFICATION" | mail -s "High Disk Usage Alert" "$NOTIFY_EMAIL"
        
        # Clean up old logs
        find /var/log -type f -name "*.log" -mtime +7 -delete
    fi
}

# Run monitoring function
monitor_system