#!/bin/bash
# Solution 1: Project Structure Setup Script

create_project_structure() {
    # Set variables
    PROJECT_NAME=$1
    BASE_DIR="/var/projects/$PROJECT_NAME"
    LOG_DIR="$BASE_DIR/logs"
    BACKUP_DIR="$BASE_DIR/backups"
    MAX_LOG_SIZE=100M
    
    # Create directory structure
    mkdir -p "$BASE_DIR"/{src,logs,backups,config}
    
    # Set permissions
    chmod 755 "$BASE_DIR"
    chmod 775 "$LOG_DIR"
    chmod 775 "$BACKUP_DIR"
    
    # Create log files
    touch "$LOG_DIR/app.log"
    touch "$LOG_DIR/error.log"
    chmod 664 "$LOG_DIR"/*.log
    
    # Set up log rotation
    cat > "/etc/logrotate.d/$PROJECT_NAME" << EOF
$LOG_DIR/*.log {
    size $MAX_LOG_SIZE
    rotate 5
    compress
    delaycompress
    create 664 root root
    missingok
    notifempty
}
EOF
    
    echo "Project structure created successfully"
}

# Usage: ./script.sh project_name
if [ $# -eq 1 ]; then
    create_project_structure "$1"
else
    echo "Usage: $0 project_name"
    exit 1
fi